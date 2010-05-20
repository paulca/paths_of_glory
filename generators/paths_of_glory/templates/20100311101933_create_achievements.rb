class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.string :type
      t.integer :level
      t.integer :user_id
      t.notified :boolean, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
