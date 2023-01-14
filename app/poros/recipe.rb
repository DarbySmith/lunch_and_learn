class Recipe
  attr_reader :title, :url, :country, :image

  def initialize(country, attributes)
    @title = attributes[:label]
    @url = attributes[:url]
    @country = country.capitalize
    @image = attributes[:image]
  end
end