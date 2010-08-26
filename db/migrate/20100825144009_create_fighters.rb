class CreateFighters < ActiveRecord::Migration
  def self.up
    create_table :fighters do |t|
      t.integer :organization_id
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :weightclass

      t.timestamps
    end
  end

  def self.down
    drop_table :fighters
  end
end
