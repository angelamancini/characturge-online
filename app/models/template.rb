class Template < ActiveRecord::Base

  def self.import(file)
    begin
      Parser::Characturge.parse_gct(file)
    rescue ArgumentError => e
      raise ArgumentError, e
    end
  end
end
