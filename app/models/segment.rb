class Segment < ActiveRecord::Base
  has_many :template_segments
  has_many :templates, through: :template_segments
  has_many :segment_groups
  has_many :groups, through: :segment_groups

  validates :name, presence: true, length: { maximum: 50 }
  validates :columns, presence: true
  validates :has_priorities, presence: true
  validates :show_heading, presence: true
end
