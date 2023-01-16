class User < ApplicationRecord
  before_create :generate_api_key

  validates_presence_of :name, :email
  validates :email, uniqueness: true
  validates :api_key, uniqueness: true

private
  def generate_api_key
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists?(api_key: api_key)
  end
end
