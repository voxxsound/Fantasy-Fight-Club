class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
