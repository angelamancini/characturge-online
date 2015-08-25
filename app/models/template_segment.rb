class TemplateSegment < ActiveRecord::Base
  belongs_to :template
  belongs_to :segment

  validates :template_id, presence: true
  validates :segment_id, presence: true
end
