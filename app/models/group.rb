class Group < ActiveRecord::Base
  has_many :segment_groups
  has_many :segments, through: :segment_groups
  has_many :group_traits
  has_many :traits, through: :group_traits
end
