class StorySerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :publishedAt, :comments
  has_many :comments

  class CommentSerializer < ActiveModel::Serializer
    attributes :id, :audio_clip, :story_id, :created_at
end
end
