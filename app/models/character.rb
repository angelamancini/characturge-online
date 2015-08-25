class Character < ActiveRecord::Base
  belongs_to :template
  validates :name, presence: true, length: { maximum: 50 }
  validates :player, presence: true, length: { maximum: 50 }
  validates :template_id, presence: true
  validates :description, presence: true
end
