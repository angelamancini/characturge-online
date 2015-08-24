class List < ActiveRecord::Base
  has_many :trait_lists
  has_many :traits, through: :trait_lists
  has_many :list_items
end
