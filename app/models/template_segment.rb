class TemplateSegment < ActiveRecord::Base
  belongs_to :template
  belongs_to :segment
end
