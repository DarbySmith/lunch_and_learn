require 'rails_helper'

RSpec.describe LearningResource do
  describe 'initialize' do
    it 'exists' do
      country = "Peru"

      video = {
        id: {
          videoId: "g9dbw1nd5"
        },
        snippet: {
          title: "Video about China"
        }
      }

      images = [
        {
          alt_description: "photo 1",
          urls: {
            regular: "url 1"
          }
        },
        {
          alt_description: "photo 2",
          urls: {
            regular: "url 2"
          }
        },
        {
          alt_description: "photo 3",
          urls: {
            regular: "url 3"
          }
        },
        {
          alt_description: "photo 4",
          urls: {
            regular: "url 4"
          }
        }
      ]

      resource = LearningResource.new(images, video, country)
      expect(resource).to be_instance_of(LearningResource)
      expect(resource.video).to eq({
        title: "Video about China",
        youtube_video_id: "g9dbw1nd5"
      })
      expect(resource.images).to eq([
        {
          alt_tag: "photo 1",
          url: "url 1"
        },
        {
          alt_tag: "photo 2",
          url: "url 2"
        },
        {
          alt_tag: "photo 3",
          url: "url 3"
        },
        {
          alt_tag: "photo 4",
          url: "url 4"
        }
      ])
      expect(resource.country).to eq('Peru')
    end
  end

  describe '#video_info' do
    it 'returns a hash with keys if there is a video' do
      country = "Peru"

      video = {
        id: {
          videoId: "g9dbw1nd5"
        },
        snippet: {
          title: "Video about China"
        }
      }

      images = [
        {
          alt_description: "photo 1",
          urls: {
            regular: "url 1"
          }
        },
        {
          alt_description: "photo 2",
          urls: {
            regular: "url 2"
          }
        },
        {
          alt_description: "photo 3",
          urls: {
            regular: "url 3"
          }
        },
        {
          alt_description: "photo 4",
          urls: {
            regular: "url 4"
          }
        }
      ]

      resource = LearningResource.new(images, video, country)

      expect(resource.video_info(video)).to eq({:title=>"Video about China", :youtube_video_id=>"g9dbw1nd5"})
    end

    it 'returns an empty hash if video is nil' do
      country = "Peru"

      video = nil

      images = [
        {
          alt_description: "photo 1",
          urls: {
            regular: "url 1"
          }
        },
        {
          alt_description: "photo 2",
          urls: {
            regular: "url 2"
          }
        },
        {
          alt_description: "photo 3",
          urls: {
            regular: "url 3"
          }
        },
        {
          alt_description: "photo 4",
          urls: {
            regular: "url 4"
          }
        }
      ]

      resource = LearningResource.new(images, video, country)

      expect(resource.video_info(video)).to eq({})
    end
  end
end