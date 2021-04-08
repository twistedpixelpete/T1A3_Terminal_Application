require 'nokogiri'
require 'httparty'
require 'byebug'
require 'tty-prompt'

class Activity

    attr_reader :today_activities, :favs, :today_titles, :list, :chosen_activity

    def initialize
        @today_activities = []
        @today_titles =[]
        scrape_today
        @chosen_activity
        
        @combine_today_description
        @list = []
        @prompt = TTY::Prompt.new
        
        
    end
    

    def scrape_today
        url = "https://www.timeout.com/melbourne/things-to-do/things-to-do-in-melbourne-today"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        items = parsed_page.css('div.card-content')
        items.each do |activity|
            activity = {
                title: activity.css('h3.card-title').text.strip,
                description: activity.css('p').text
            }  
            @today_activities << activity
            
            
        end    
           
    end

    def lists_today_activities
        i =0
         while i < today_activities.length-1
            title = today_activities[i][:title]
            puts "#{title.strip}"
            
            i += 1
         end
        end

        def combine_today_titles
            i =0
             while i < today_activities.length-1
                title = today_activities[i][:title]
                
                @today_titles << title
                i += 1
             end
        end

        def combine_today_description
            i =0
             while i < today_activities.length-1
                description = today_activities[i][:description]
                
                @combine_today_description << description
                i += 1
            end
            
        end

        def activity_display
            i=0
           while i < 10
               
              bob = {name: today_activities[i][:title], value: i+1.to_i}

              @list << bob

                i += 1     
            end
        end 


        def melb_list_today

            i=0
           while i < 10
               
              bob = {name: today_activities[i][:title], value: i+1.to_i}

              @list << bob

                i += 1     
            end  
  
           
            
  
        
        end 
        
    
end



