class StorySerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :image_url, :publishedAt, :active, :comments
  has_many :comments

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :text, :story_id, :created_at, :likes
  end
end
