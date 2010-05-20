class AchievementGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions class_name, "#{class_name}"
      m.class_collisions class_name, "#{class_name}Observer"
      
      m.directory 'app/models/achievements'
      m.template "achievement.rb", "app/models/achievements/#{file_name}.rb"
      m.template "achievement_observer.rb", "app/models/achievements/#{file_name}_observer.rb"
    end
  end
end