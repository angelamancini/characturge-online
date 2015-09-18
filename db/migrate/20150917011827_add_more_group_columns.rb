class AddMoreGroupColumns < ActiveRecord::Migration
  def change
    add_column :groups, :has_dots, :boolean, default: false
    add_column :groups, :has_boxes, :boolean, default: false
    add_column :groups, :freebie_cost, :integer
    add_column :groups, :experience_new_cost, :integer
    add_column :groups, :experience_dot_cost, :integer
    add_column :groups, :max_value, :integer
  end
end
