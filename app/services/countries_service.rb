class CountriesService
  def self.conn
    Faraday.new("https://restcountries.com")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.random_country
    get_url("/v3.1/all?fields=name").sample
  end
end