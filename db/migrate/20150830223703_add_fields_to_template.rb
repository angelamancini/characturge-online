class AddFieldsToTemplate < ActiveRecord::Migration
  def change
    add_column :templates, :privacy, :string, default: 'public'
  end
end
