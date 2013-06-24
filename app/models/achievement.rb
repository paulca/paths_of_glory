class Achievement < ActiveRecord::Base

  belongs_to :user
  
  scope :not_notified, :conditions => {:notified => false}
  scope :recent, :order => "created_at desc"
  scope :kind_of, lambda { |type| {:conditions => {:type => type.to_s}}} do
    def current
      order("level desc").limit(1).first
    end
  end
  
  scope :order, lambda { |order| {:order => order} }
  scope :limit, lambda { |limit| {:limit => limit} }
  
  class << self
    def levels
      @levels ||= []
    end

    def level(level, options = {})
      levels << {:level => level, :quota => options[:quota]}
    end
    
    def set_thing_to_check(&block)
      @thing_to_check = block
    end
    
    def thing_to_check(object)
      @thing_to_check.call(object)
    end
    
    def select_level(level)
      levels.select { |l| l[:level] == level }.first
    end
    
    def quota_for(level)
      select_level(level)[:quota] if select_level(level)
    end
    
    def has_level?(level)
      select_level(level).present?
    end
    
    def current_level(user)
      if current_achievement = user.achievements.kind_of(self).current
        current_achievement.level
      else
        0
      end
    end
    
    def next_level(user)
      current_level(user) + 1
    end
    
    def current_progress(user)
      thing_to_check(user) - quota_for(current_level(user)).to_i
    end
    
    def next_level_quota(user)
      quota_for(next_level(user)) - quota_for(current_level(user)).to_i
    end
    
    def progress_to_next_level(user)
      if(has_level?(next_level(user)))
        return [(current_progress(user) * 100) / next_level_quota(user), 95].min
      else
        return nil
      end
    end
  end
end
