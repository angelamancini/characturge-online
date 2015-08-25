class SegmentGroup < ActiveRecord::Base
  belongs_to :segment
  belongs_to :group

  validates :segment_id, presence: true
  validates :group_id, presence: true
end
