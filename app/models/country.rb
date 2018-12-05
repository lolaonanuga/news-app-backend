class Country < ApplicationRecord
has_many :stories

require 'news-api'
@@newsapi = News.new("525e8618ca644ffbb1a1f534a2385f03")


def get_stories
    
    @news = @@newsapi.get_top_headlines(country: self.key, language: 'en',)

    @news.each do |post|
        Story.create(country_id: self.id, url: post.url, title: post.title, description: post.description, publishedAt: post.publishedAt, image_url: post.urlToImage)
    end
end


end