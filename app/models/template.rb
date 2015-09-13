class Template < ActiveRecord::Base
  has_many :template_segments
  has_many :segments, through: :template_segments
  has_many :template_selection_lists
  has_many :selection_lists, through: :template_selection_lists
  accepts_nested_attributes_for :selection_lists, :reject_if => :all_blank
  before_save :autosave_associated_records_for_selection_list

  validates :title, presence: true, length: { maximum: 50 }
  validates :subtitle, presence: true, length: { maximum: 50 }

  def self.import(file)
    begin
      Parser::Characturge.parse_gct(file)
    rescue ArgumentError => e
      raise ArgumentError, e
    end
  end

  def autosave_associated_records_for_selection_list
    new_selection_list = SelectionList.find_or_create_by(name: self.selection_list.name)
    self.selection_list = new_selection_list
  end
end
