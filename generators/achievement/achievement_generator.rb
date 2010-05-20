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

    def after_generate
      puts "

Your new achievement, '#{class_name}' has been created.

Now you need to edit:

    app/models/achievements/#{file_name}.rb

and

    app/models/achievements/#{file_name}_observer.rb

Then you need to activate the observer, by adding ':#{file_name}_observer' to environment.rb, eg:

    config.active_record.observers = :#{file_name}_observer

"
    end
end