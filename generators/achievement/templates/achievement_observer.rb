class <%= class_name %>Observer < ActiveRecord::Observer
  observe :user
  
  def after_save(user)
    Dedicated.award_achievements_for(user) if ('your conditions here')
  end
end