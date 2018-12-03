class StorySerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :publishedAt, :comments
  has_many :comments

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :text, :story_id, :created_at
end
end
