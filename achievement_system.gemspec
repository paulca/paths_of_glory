# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{achievement_system}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Campbell"]
  s.date = %q{2010-05-20}
  s.email = %q{paul@rslw.com}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "CHANGELOG",
     "README.md",
     "Rakefile",
     "app/models/achievement.rb",
     "app/models/achievements.rb",
     "generators/achievement/USAGE",
     "generators/achievement/achievement_generator.rb",
     "generators/achievement/templates/achievement.rb",
     "generators/achievement/templates/achievement_observer.rb",
     "generators/paths_of_glory/USAGE",
     "generators/paths_of_glory/paths_of_glory_generator.rb",
     "generators/paths_of_glory/templates/20100311101933_create_achievements.rb",
     "rails/init.rb",
     "spec/achievement_generator_spec.rb",
     "spec/achievement_spec.rb",
     "spec/blueprints.rb",
     "spec/database.yml",
     "spec/debug.log",
     "spec/paths_of_glory_generator_spec.rb",
     "spec/schema.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = false
  s.homepage = %q{http://www.github.com/paulca/achievement_system}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Getting you started on the road to achievements.}
  s.test_files = [
    "spec/achievement_generator_spec.rb",
     "spec/achievement_spec.rb",
     "spec/blueprints.rb",
     "spec/paths_of_glory_generator_spec.rb",
     "spec/schema.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

