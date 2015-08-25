class ListItem < ActiveRecord::Base
  belongs_to :list

  validates :list_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  
end
