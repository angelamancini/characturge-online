class SegmentGroup < ActiveRecord::Base
  belongs_to :segment
  belongs_to :group
end
