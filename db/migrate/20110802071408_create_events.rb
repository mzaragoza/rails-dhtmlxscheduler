class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :text
      t.integer :event_pid
      t.string :event_length
      t.string :rec_pattern
      t.string :rec_type

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
