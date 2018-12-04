class Story < ApplicationRecord
    has_many :comments

    require 'news-api'
    @@newsapi = News.new("525e8618ca644ffbb1a1f534a2385f03")

    def analyze_text(content)
        content = content.downcase.split(" ")
        score = 0

        filters = { ("useless-words.txt") => 0, ("negative-words.txt") => (-1), ("positive-words.txt") => 1}
        
        filters.each do |file, num|
            fileObj = File.new( "#{file}", "r" )
            while (line = fileObj.gets)
                content.each do |word|
                    if line.include?(word)
                        score += num
                        content.delete(word)
                    end
                end
            end
            fileObj.close
        end
        score
    end

    def self.refresh_news
        Story.all.each {|story| story.update(active: false)}
        
        @news = @@newsapi.get_top_headlines(sources: "the-new-york-times, bbc-news", pageSize:5)

        @news.each do |post|
            Story.create(url: post.url, title: post.title, description: post.description, publishedAt: post.publishedAt, image_url: post.urlToImage, sentiment: analyze_text(post.content))
        end
    end

end
