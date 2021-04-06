require 'nokogiri'
require 'httparty'
require 'byebug'

class Melb

    attr_reader :activities

    def initialize
        @activities = []
        scrape_today
        
    end
    

    def scrape_today
        url = "https://www.timeout.com/melbourne/things-to-do/things-to-do-in-melbourne-today"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        items = parsed_page.css('div.card-content')
        items.each do |activity|
            activity = {
                title: activity.css('h3.card-title').text,
                description: activity.css('p').text
            }  
            @activities << activity
            
            
        end    
           
    end

    def lists_today_activities
        i =0
         while i < activities.length-1
            title = activities[i][:title]
            puts "#{title.strip}"

            i += 1
         end
        end
    
end



