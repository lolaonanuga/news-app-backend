class Country < ApplicationRecord
    has_many :stories

    require 'nokogiri'
    require 'open-uri'
    require 'news-api'

    @@newsapi = News.new("525e8618ca644ffbb1a1f534a2385f03")

    def get_stories
        @news = @@newsapi.get_top_headlines(country: self.key, language: 'en',)

        @news.each do |post|
            Story.create(country_id: self.id, url: post.url, title: post.title, description: post.description, publishedAt: post.publishedAt, image_url: post.urlToImage, sentiment: get_page(post.url))
        end
    end

    def get_page(url)
        doc = Nokogiri::HTML(open(url))
        article_body = doc.css("article").first.css("p").text
        analyze_text(article_body)
    end

    def analyze_text(content)
        content = content.downcase.split(" ")
        score = 0
        word_count = 0

        filters = { ("useless-words.txt") => 0, ("negative-words.txt") => (-1), ("positive-words.txt") => 1}
        
        filters.each do |file, num|
            fileObj = File.new( "#{file}", "r" )
            while (line = fileObj.gets)
                content.each do |word|
                    if line.include?(word)
                        score += num
                        content.delete(word)
                        word_count += 1
                    end
                end
            end
            fileObj.close
        end
        average = (score/word_count.to_f).round(3)
    end


end