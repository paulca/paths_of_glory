module Achievements
  
  def self.included(base)
    base.class_eval do
      has_many :achievements do
        def include?(achievement, level = nil)
          all.select { |a| a.type.to_s == achievement.to_s and a.level == level }.any?
        end
      end
    end
  end

  def award_achievement(achievement, level = nil)
    achievement.create!(:user => self, :level => level)
  end
  
  def has_achievement?(achievement, level = nil)
    conditions = {:type => achievement.to_s, :user_id => id}    
    conditions[:level] = level if level
    achievements.first(:conditions => conditions).present?
  end
  
  def get_badges_in_progress(badges)
    badges.collect do |achievement|
      {
        :type => achievement,
        :level => achievement.next_level(self),
        :progress => achievement.progress_to_next_level(self),
        :next_level_quota => achievement.next_level_quota(self),
        :current_progress => achievement.current_progress(self),
        :next_level => achievement.next_level(self)
      }
    end.sort_by { |achievement| achievement[:progress] }.reverse[0,3]
  end
  
end