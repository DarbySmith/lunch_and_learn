class LearningResource
  attr_reader :images, :video, :country

  def initialize(images, video, country)
    @images = images.map {|h| {alt_tag: h[:alt_description], url: h[:urls][:regular]} }
    @video = video_info(video)
    @country = country
  end

  def video_info(video)
    if video
      { title: video[:snippet][:title], youtube_video_id: video[:id][:videoId]}
    else
      return {}
    end
  end
end