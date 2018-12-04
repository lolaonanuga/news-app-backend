
def analyze(content)
    content = content.downcase
    content = content.split(" ")
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
    puts score
end

analyze("Former President George Bush will be honored this week in Washington and Houston in a series of tributes and memorial services before he is laid to rest at his presidential library and museum at Texas A&M University in College Station.

    After a ceremony on Monday night with congressional leadership and lawmakers in the Capitol Rotunda, the former president’s coffin will be on view for the public to pay tribute.
    
    On Wednesday, former President George W. Bush, Mr. Bush’s son, will deliver a eulogy during a state funeral at Washington National Cathedral. All of the other living former presidents — Jimmy Carter, Bill Clinton and Barack Obama — and President Trump are expected to attend the funeral. Breaking with recent tradition, the current president will not deliver a eulogy.
    
    American rituals reserved for the highest honor — including a 21-gun salute, the honor guard carrying the coffin and a presidential funeral train — will be on display all week.")

