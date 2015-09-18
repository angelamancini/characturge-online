class RemoveColumnFromSegment < ActiveRecord::Migration
  def change
    remove_columns :segments, :columns
  end
end
