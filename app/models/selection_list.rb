class SelectionList < ActiveRecord::Base
  has_many :template_selection_lists
  has_many :templates, through: :template_selection_lists
  has_many :list_items

  accepts_nested_attributes_for :list_items, :reject_if => :all_blank
end
