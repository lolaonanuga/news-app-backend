class Country < ApplicationRecord
    has_many :stories

    include Scraper
    require 'news-api'

    @@newsapi = News.new("808fdaa09243439c95668190175f3819")

    def get_stories
        @news = @@newsapi.get_top_headlines(country: self.key, language: 'en',)

        @news.each do |post|

            Story.create(country_id: self.id, url: post.url, title: post.title, description: post.description, publishedAt: post.publishedAt, image_url: post.urlToImage)
        end
    end


end