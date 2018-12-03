class Story < ApplicationRecord
    has_many :comments

    require 'news-api'
    @@newsapi = News.new("525e8618ca644ffbb1a1f534a2385f03")
    @@news = @@newsapi.get_top_headlines(sources: "the-new-york-times, bbc-news", pageSize:5)

    def self.get_news
        @@news.each do |post|
            Story.create(url: post.url, title: post.title, description: post.title, publishedAt: post.publishedAt)
        end
    end

end
