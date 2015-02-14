class CreateCurrentReadings < ActiveRecord::Migration
  def change
    create_table :current_readings do |t|
      t.integer :book_id
      t.integer :progress

      t.timestamps null: false
    end
  end
end
