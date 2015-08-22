class CreateGroupTraits < ActiveRecord::Migration
  def change
    create_table :group_traits do |t|
      t.integer :group_id
      t.integer :trait_id

      t.timestamps null: false
    end
  end
end
