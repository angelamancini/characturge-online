class List < ActiveRecord::Base
  has_many :trait_lists
  has_many :traits, through: :trait_lists
  has_many :list_items

  validates :name, presence: true, length: { maximum: 50 }
end
