class LearningResourceFacade
  def self.country_resource(country)
    video = YoutubeService.find_video(country)[:items][0]
    images = PhotosService.find_photos(country)[:results]
    LearningResource.new(images, video, country)
  end
end