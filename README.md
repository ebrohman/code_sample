
CSV parsing method example
------------

Installation
  * bundle
  * rake db:migrate
  * rake seed:teams
  * rake seed:players
  * rake seed:performances
  * rails c

Nokigiri Data Scrapping:

    Call “GamePerformance.scrape_data” in rails console to parse the page (public/data/stats.html) with Nokogiri.  The method then iterates over all the <td> elements and throws the text into an array.  From there, the method takes the array and slices it into chunks of 12 - this breaks apart each performance record - and then puts it into an array of arrays.  After this a CSV file is created with each row corresponding to elements 1-9 in each array (so as not to include the “show, edit, and delete” text).  The CSV file is then parsed and the data is loaded into the database via the GamePerformance model.





