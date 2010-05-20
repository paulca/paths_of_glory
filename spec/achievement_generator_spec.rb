require 'spec_helper'
require 'rails_generator'
require 'rails_generator/scripts/generate'

describe AchievementGenerator do
  
  before do
    @dirs = {}
    @dirs['achievements'] = fake_rails_root + '/app/models/achievements'
    @dirs.each do |key, dir|
      FileUtils.mkdir_p(dir)
    end
    @original_files = {}
    @original_files['achievements'] = file_list(@dirs['achievements'])
    Rails::Generator::Scripts::Generate.new.run(["achievement", 'glory'], :destination => fake_rails_root, :backtrace => true)
    
    @files = (file_list(@dirs['achievements']) - @original_files['achievements'])
  end
  
  let(:achievement_file) { @files.first }
  let(:observer_file) { @files.last }
  
  it "should create the achievement file" do
    File.basename(achievement_file).should == "glory.rb"
    File.basename(observer_file).should == "glory_observer.rb"
  end
  
  it "should make them beautiful" do
    File.read(achievement_file).should match(/Glory < Achievement/)
  end
  
  it "should make them beautiful" do
    generated_code = File.read(observer_file)
    generated_code.should match(/GloryObserver < ActiveRecord::Observer/)
    generated_code.should match(/Glory\.award/)
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