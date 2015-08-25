class Group < ActiveRecord::Base
  has_many :segment_groups
  has_many :segments, through: :segment_groups
  has_many :group_traits
  has_many :traits, through: :group_traits

  validates :name, presence: true, length: { maximum: 50 }
  validates :number, presence: true
  # validates :show_heading, presence: true
  validates :input_type, presence: true
end
