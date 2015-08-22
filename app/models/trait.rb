class Trait < ActiveRecord::Base
  has_many :group_traits
  has_many :groups, through: :group_traits
end
