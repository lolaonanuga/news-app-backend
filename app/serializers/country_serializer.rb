class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :stories
  has_many :stories

end
class StorySerializer < ActiveModel::Serializer
  attributes :id, :country_id, :url, :title, :description, :image_url, :publishedAt, :active, :sentiment
  belongs_to :country

end
