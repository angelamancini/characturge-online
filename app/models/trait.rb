class Trait < ActiveRecord::Base
  has_many :group_traits
  has_many :groups, through: :group_traits
  has_many :trait_lists
  has_many :lists, through: :trait_lists

  validates :name, presence: true, length: { maximum: 50 }
end
