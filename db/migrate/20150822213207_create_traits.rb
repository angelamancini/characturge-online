class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name
      t.integer :max_value
      t.integer :start_value
      t.integer :freebie_cost
      t.integer :experiance_dot_cost
      t.integer :experiance_new_cost

      t.timestamps null: false
    end
  end
end
