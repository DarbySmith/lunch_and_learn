class LearningResource
  attr_reader :images, :video, :country

  def initialize(images, video, country)
    @images = images.map {|h| {alt_tag: h[:alt_description], url: h[:urls][:regular]} }
    @video = { title: video[:snippet][:title], youtube_video_id: video[:id][:videoId]}
    @country = country
  end
end