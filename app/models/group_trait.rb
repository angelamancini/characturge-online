class GroupTrait < ActiveRecord::Base
  belongs_to :group
  belongs_to :trait

  validates :group_id, presence: true
  validates :trait_id, presence: true
end
