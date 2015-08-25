class Template < ActiveRecord::Base
  has_many :template_segments
  has_many :segments, through: :template_segments
  validates :title, presence: true, length: { maximum: 50 }
  validates :subtitle, presence: true, length: { maximum: 50 }

  def self.import(file)
    begin
      Parser::Characturge.parse_gct(file)
    rescue ArgumentError => e
      raise ArgumentError, e
    end
  end
end
