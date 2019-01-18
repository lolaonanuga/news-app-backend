# Telescoop - Server

Telescoop is a web app for viewing top news stories around the world with a visual display of the average ‘sentiment’ of the daily news in each country.


## Getting Started

This is the server side repo for the app. Please follow the instructions carefully.


## Prerequisites



## Installing

```
bundle
rails s
```

# SETTING UP ENVIRONMENT

To seed the database with news stories, you'll need to complete three steps in the seeds.rb file. When you're on Step 1, comment out Step 2 and 3, and so on. 

 Every time you have a new shell session:
     go into the 'lib' folder and ctrl+click on the file 'NewsApp-7584f1ce17a2.json'
    select 'copy path'
   IN THE SHELL, paste the following: 

   ```
    $ export GOOGLE_APPLICATION_CREDENTIALS=[PATH]
   ```

  

The process should step should take about 10-15 minutes total. 


## Built With


[News API](https://newsapi.org)<br>
[Google Translate API](https://cloud.google.com/translate)


## Authors

[Lola Onanuga](https://github.com/lollypop036) & [Natasha Buck](https://github.com/natashabuck)


## Ackowledgements
