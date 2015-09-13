class CreateTemplateSelectionLists < ActiveRecord::Migration
  def change
    create_table :template_selection_lists do |t|
      t.integer :template_id
      t.integer :selection_list_id

      t.timestamps null: false
    end
  end
end
