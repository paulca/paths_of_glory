require 'spec_helper'

describe Achievement do
  class Thing < Achievement
    level 1, :quota => 1
    level 2, :quota => 2
    
    set_thing_to_check {|u| u.sign_in_count }
  end
  
  class Dedicated < Achievement

    level 1, :quota => 5
    level 2, :quota => 10
    level 3, :quota => 30
    level 4, :quota => 100
    level 5, :quota => 500

    set_thing_to_check { |user| user.sign_in_count.to_i }

    def self.award_achievements_for(user)
      return unless user
      levels.each do |level|
        if !user.has_achievement?(self, level[:level]) and thing_to_check(user) >= level[:quota]
          user.award_achievement(self, level[:level])
        end
      end
    end
  end
  
  class User < ActiveRecord::Base
    include Achievements
    
    def after_save
      Dedicated.award_achievements_for(self) if sign_in_count_changed?
    end
  end
  
  User.blueprint do
    email 'joe@king.com'
    encrypted_password 'blah'
    password_salt 'are you joking?'
  end
  
  it "should have 2 levels" do
    Thing.levels.size.should == 2
  end
  
  it "should have a levels array" do
    Thing.levels.should == [{:quota=> 1, :level =>1}, {:quota=>2, :level=>2}]
  end
  
  describe ".quota_for" do
    it "should give me back the quota" do
      Dedicated.quota_for(2).should == 10
    end
  end
  
  describe ".has_level?" do
    it "should tell me if it has a level" do
      Dedicated.has_level?(1).should be_true
    end
    
    it "should tell me if it doesn't have a level" do
      Dedicated.has_level?(6).should be_false
    end
  end
  
  describe ".progress_to_next_level" do
    before do
      @user = User.make(:sign_in_count => 2)
    end
    
    it "should tell me the thing to check" do
      Thing.thing_to_check(@user).should == 2
    end
    
    it "should show me that I'm 40% the way to dedicated" do
      Dedicated.progress_to_next_level(@user).should == 40
    end
    
    it "should update the progress as things happen" do
      @user.update_attribute(:sign_in_count, 4)
      Dedicated.progress_to_next_level(@user).should == 80
    end
    
    it "should work for more than one level" do
      @user.sign_in_count = 5
      @user.save!
      Dedicated.thing_to_check(@user).should == 5
      Dedicated.progress_to_next_level(@user).should == 0
      @user.update_attribute(:sign_in_count, 6)
      Dedicated.progress_to_next_level(@user).should == 20
    end
    
    it "should return nil finally" do
      @user.sign_in_count = 500
      @user.save!
      Dedicated.progress_to_next_level(@user).should be_nil
    end
  end
end
