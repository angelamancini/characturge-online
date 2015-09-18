class SegmentDotsAvailable < ActiveRecord::Migration
  def change
    add_column :segments, :dots_available, :integer
  end
end
