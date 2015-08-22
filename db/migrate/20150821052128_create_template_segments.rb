class CreateTemplateSegments < ActiveRecord::Migration
  def change
    create_table :template_segments do |t|
      t.integer :template_id
      t.integer :segment_id

      t.timestamps null: false
    end
  end
end
