class RecipesService
  def self.conn
    Faraday.new({ 
      url: "https://api.edamam.com",
      params: { app_id: ENV['recipes_app_id'], app_key: ENV['recipes_app_key']}
    })
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.country_recipes(country)
    get_url("/api/recipes/v2?type=public&q=#{country}")
  end
end