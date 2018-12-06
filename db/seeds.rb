###############################################################
# STEP 1: SET UP ENVIRONMENT

# To seed the db, you'll need to go through both parts below. When you're on Step 1, comment out Step 2, and vice versa. 

# Every time you have a new shell session:
    # go into the 'lib' folder and ctrl+click on the file 'NewsApp-7584f1ce17a2.json'
    # select 'copy path'
    # IN THE SHELL, paste the following: 

    #   'export GOOGLE_APPLICATION_CREDENTIALS='[PATH]'

    # for example:
    # export GOOGLE_APPLICATION_CREDENTIALS='/Users/natashabuck/dev/mod3/news-app-rails/lib/NewsApp-7584f1ce17a2.json'

# Part 3(sentiment) should take about 10-15 minutes total.  

###############################################################
# STEP 2: ADDING STORIES

# Story.delete_all
# Country.delete_all

# countries = {"Argentina"=>"ar", "Australia"=>"au", "Austria"=>"at", "Belgium"=>"be", "Brazil"=>"br", "Bulgaria"=>"bg", "Canada"=>"ca", "China"=>"cn", "Colombia"=>"co", "Cuba"=>"cu", "Czech Republic"=>"cz", "Egypt"=>"eg", "France"=>"fr", "Germany"=>"de", "Greece"=>"gr", "Hong Kong"=>"hk", "Hungary"=>"hu", "India"=>"in", "Indonesia"=>"id", "Ireland"=>"ie", "Israel"=>"il", "Italy"=>"it", "Japan"=>"jp", "Latvia"=>"lv", "Lithuania"=>"lt", "Malaysia"=>"my", "Mexico"=>"mx", "Morocco"=>"ma", "Netherlands"=>"nl", "New Zealand"=>"nz", "Nigeria"=>"ng", "Norway"=>"no", "Philippines"=>"ph", "Poland"=>"pl", "Portugal"=>"pt", "Romania"=>"ro", "Russia"=>"ru", "Saudi Arabia"=>"sa", "Serbia"=>"rs", "Singapore"=>"sg", "Slovakia"=>"sk", "Slovenia"=>"si", "South Africa"=>"za", "South Korea"=>"kr", "Sweden"=>"se", "Switzerland"=>"ch", "Taiwan"=>"tw", "Thailand"=>"th", "Turkey"=>"tr", "UAE"=>"ae", "Ukraine"=>"ua", "United Kingdom"=>"gb", "United States of America"=>"us", "Venuzuela"=>"ve"}

# countries.each do |k, v|
#     new_country = Country.create(name:k, key:v) 
# end

# Country.all.each do |country|
#     country.get_stories
# end

###############################################################
# STEP 3: ADDING SENTIMENT

include Scraper

Story.where("sentiment IS ?", nil).each do |story|
    story.update(sentiment: Scraper.get_page(story.url))
    story.save
end

Story.where("sentiment = 0").each do |story|
    story.update(sentiment: Scraper.get_page(story.url))
    story.save
end