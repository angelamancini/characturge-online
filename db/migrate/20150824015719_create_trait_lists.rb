class CreateTraitLists < ActiveRecord::Migration
  def change
    create_table :trait_lists do |t|
      t.integer :trait_id
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
