require 'spec_helper'
require 'rails_generator'
require 'rails_generator/scripts/generate'

describe PathsOfGloryGenerator do
  
  before do
    @dirs = {}
    @dirs['migration'] = fake_rails_root + '/db/migrate'
    @dirs['config'] = fake_rails_root + '/config'
    @dirs.each do |key, dir|
      FileUtils.mkdir_p(dir)
    end
    @original_files = {}
    @original_files['migration'] = file_list(@dirs['migration'])
    @original_files['config'] = file_list(@dirs['config'])
    Rails::Generator::Scripts::Generate.new.run(["paths_of_glory"], :destination => fake_rails_root, :backtrace => true)
  end
  
  it "should create the migration file" do
    new_migration_file = (file_list(@dirs['migration']) - @original_files['migration']).first
    "20100311101933_create_achievements.rb".should == File.basename(new_migration_file)
  end
  
  after do
    FileUtils.rm_r(fake_rails_root)
  end
  
  
  def fake_rails_root
    File.join(File.dirname(__FILE__), 'spec', 'rails_root')
  end

  def file_list(dir)
    Dir.glob(File.join(dir, "*"))
  end
  
end