class YoutubeService
  def self.conn
    Faraday.new("https://www.googleapis.com") do |faraday|
      faraday.params['key'] = ENV['youtube_api_key']
    end
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.find_video(country)
    get_url("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&maxResults=1&q=#{country}")
  end
end