module Sentiment

    def self.analyze_text(content)
        content = content.downcase.split(" ")
        score = 0
        word_count = 0

        filters = { ("lib/useless-words.txt") => 0, ("lib/negative-words.txt") => (-1), ("lib/positive-words.txt") => 1}
        
        filters.each do |file, num|
            fileObj = File.new( file, "r" )
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
        
        if word_count < 50
            return 0.000
        else
            return average
        end
    end
end