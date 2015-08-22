class CreateSegments < ActiveRecord::Migration
  def change
    create_table :segments do |t|
      t.string :name
      t.integer :columns
      t.boolean :has_priorities
      t.boolean :show_heading

      t.timestamps null: false
    end
  end
end
