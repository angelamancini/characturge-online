class Segment < ActiveRecord::Base
  has_many :template_segments
  has_many :templates, through: :template_segments
  has_many :segment_groups
  has_many :groups, through: :segment_groups
end
