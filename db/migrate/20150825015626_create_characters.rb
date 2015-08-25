class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :player
      t.integer :template_id
      t.text :description

      t.timestamps null: false
    end
  end
end
