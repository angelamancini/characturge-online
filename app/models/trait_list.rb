class TraitList < ActiveRecord::Base
  belongs_to :trait
  belongs_to :list
end
