class PhotosService
  def self.conn
    Faraday.new("https://api.unsplash.com") do |faraday|
      faraday.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.find_photos(country)
    get_url("/search/photos?query=#{country}&page=1&per_page=10")
  end
end