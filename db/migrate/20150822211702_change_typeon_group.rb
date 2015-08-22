class ChangeTypeonGroup < ActiveRecord::Migration
  def change
    rename_column :groups, :type, :input_type
  end
end
