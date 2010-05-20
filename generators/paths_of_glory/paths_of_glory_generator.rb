class PathsOfGloryGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'db/migrate'
      m.file "20100311101933_create_achievements.rb", "db/migrate/20100311101933_create_achievements.rb"
    end
  end
  
  def after_generate
    puts "

You're on the Path to Glory

Now, add 'include Achievements' to your User model:

    class User < ActiveRecord::Base
      include Achievements
    end
    
and add 'app/modeles/achievements' to your load paths:

    config.load_paths += \%\W( \#\{Rails.root\}/app/models/achievements )

and run:

    rake db:migrate,

To generate a new Achievement, run:

    ./script/generate achievement Glory

where 'Glory' is the name of the achievement.

Good luck!

"
  end
end