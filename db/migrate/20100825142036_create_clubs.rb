class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name
      t.integer :party_id
      t.integer :league_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
