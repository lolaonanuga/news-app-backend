class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name, :key, :stories
  has_many :stories

class StorySerializer < ActiveModel::Serializer
  attributes :id, country_id, :url, :title, :description, :image_url, :publishedAt, :active, :comments, :content
  belongs_to :country

  # class CommentSerializer < ActiveModel::Serializer
  #   attributes :id, :text, :story_id, :created_at, :likes
  # end
end
