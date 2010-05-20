class PathsOfGloryGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'db/migrate'
      m.file "20100311101933_create_achievements.rb", "db/migrate/20100311101933_create_achievements.rb"
    end
  end
end