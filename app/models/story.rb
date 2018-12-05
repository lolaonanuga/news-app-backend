class Story < ApplicationRecord
    # has_many :comments
    belongs_to :country

    require 'news-api'
    @@newsapi = News.new("525e8618ca644ffbb1a1f534a2385f03")
   
    def self.refresh_news
        Story.all.each {|story| story.update(active: false)}
        @news = @@newsapi.get_top_headlines(sources: "the-new-york-times, bbc-news", pageSize:5)
        @news.each do |post|
            Story.create(url: post.url, title: post.title, description: post.description, publishedAt: post.publishedAt, image_url: post.urlToImage)
        end
    end

   

end
