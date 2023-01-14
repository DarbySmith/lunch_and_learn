class CountriesFacade
  def self.random_country
    Country.new(CountriesService.random_country[:name])
  end
end