class CreateReads < ActiveRecord::Migration
  def change
    create_table :reads do |t|
      t.integer :book_id
      t.integer :stars
      t.string :notes, default: ""

      t.timestamps null: false
    end
  end
end
