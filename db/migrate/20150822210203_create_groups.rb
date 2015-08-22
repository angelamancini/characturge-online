class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :number
      t.boolean :show_heading
      t.integer :dots_available
      t.string :type

      t.timestamps null: false
    end
  end
end
