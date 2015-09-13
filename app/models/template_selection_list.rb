class TemplateSelectionList < ActiveRecord::Base
  belongs_to :template
  belongs_to :selection_list
end
