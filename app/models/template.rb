class Template < ActiveRecord::Base
  has_many :template_segments
  has_many :segments, through: :template_segments

  def self.import(file)
    begin
      Parser::Characturge.parse_gct(file)
    rescue ArgumentError => e
      raise ArgumentError, e
    end
  end
end
