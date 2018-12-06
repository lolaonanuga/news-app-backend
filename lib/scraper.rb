require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require "google/cloud/translate"
require_relative './sentiment.rb'

module Scraper
    include Sentiment
    @@project_id = "newsapp-1544016535550"
    @@translate = Google::Cloud::Translate.new project: @@project_id

    def self.get_page(url)
        begin
            doc = open(url, :allow_redirections => :all)
        rescue Errno::ECONNRESET   
            puts "ECONNRESET handled. Continuing seed..."

        rescue OpenURI::HTTPError
            puts "HTTPError handled. Continuing seed..."

        rescue OpenSSL::SSL::SSLError
            puts "SSLError handled. Continuing seed..."
        
        rescue EOFError
            puts "EOFError handled. Continuing seed..."

        rescue URI::InvalidURIError
            puts "InvalidURIError handled. Continuing seed..."

        rescue Net::OpenTimeout
            puts "OpenTimeout handled. Continuing seed..."
        
        rescue Errno::ENETUNREACH
            puts "ENETUNREACH handled. Continuing seed..."

        # rescue Google::Cloud::PermissionDeniedError
        #     puts "PermissionDenied handled. Continuing seed..."

        end

        if doc
            doc = Nokogiri::HTML(doc)
            article_body = (doc.css("p").text)

            if article_body.length >= 1999
                article_body = article_body[0..1999]
            end
            
            translation = @@translate.translate article_body, to: "en"
            
            Sentiment.analyze_text(translation.text)
        end
    end
end