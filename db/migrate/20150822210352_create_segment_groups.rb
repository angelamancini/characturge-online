class CreateSegmentGroups < ActiveRecord::Migration
  def change
    create_table :segment_groups do |t|
      t.integer :segment_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
