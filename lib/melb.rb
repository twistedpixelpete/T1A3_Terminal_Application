require 'nokogiri'
require 'httparty'
require 'byebug'

class Melb

    def scrape_today
        url = "https://www.broadsheet.com.au/melbourne/search/things-to-do/today"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page)
        byebug 
    end
    
end


