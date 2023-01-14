class RecipesFacade
  def self.country_recipes(country)
    RecipesService.country_recipes(country)[:hits].map do |data|
      Recipe.new(country, data[:recipe])
    end
  end
end