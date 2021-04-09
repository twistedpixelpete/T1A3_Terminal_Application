require 'nokogiri'
require 'httparty'
require 'byebug'
require 'tty-prompt'
require 'colorize'

class Activity

    attr_reader :today_activities, :fav_list, :chosen_today_activity, :processed_today
    attr_accessor :selected_activity

# Initialise class variables and scrape website for current information
    def initialize
        @today_activities = []
        @processed_today = []  
        @processed_favs = []
        scrape_today
        @chosen_today_activity
        @selected_activity =[]
        @fav_list = []
        @prompt = TTY::Prompt.new
        @header = "-"*50
        @header_length = @header.length
        process_today_activities
        @check = true
           
    end

#Method to run the app
    def run
        
        welcome_header
        main_menu
        
        
    end
    
# Method to scrape website for whats happening today in Melbourne
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

# Method to display today titles
    def display_today_activity_name
        i = 0
        while i < 10
            puts today_activities[i][:title]
            i += 1   
        end
    end

# Method to add to favorites
    def add_to_favorites(new_fav)
        @fav_list << new_fav      
    end

# Method to delete from favourites
    def delete_favorite(index)
        @fav_list.delete_at(index-1)
        
    end

#Method to display the main menu
    def main_menu
        @prompt.select("What would you like to do?") do |menu|
            menu.choice "Check out what's on today", -> {today_menu} 
            menu.choice "Check out things to do on the weekend", -> {}
            menu.choice "Look at my favorites", -> {display_favorites}
            menu.choice "Exit", -> {leave_app}    
            end    
    end

#Method to display the today menu
    def today_menu
        today_header
        @selected_activity = []
        @chosen_today_activity = @prompt.select("\nSelect an activity to find out more\n", @processed_today.push({name: "--Back to Menu--", value: 11}).uniq) 
        today_selection(chosen_today_activity)    
    end

#Method to receive the today selection
    def today_selection(chosen_today_activity)
        if  chosen_today_activity <= 10
                    puts "\n#{today_activities[chosen_today_activity-1][:description]}"
                    @selected_activity << today_activities[chosen_today_activity-1][:title] 
                    today_return_menu
        end
        
    end

#Method to display today return menu
    def today_return_menu
        today_return_selection = @prompt.select("\nSave to your favorites list or go back".blue) do |menu|
            menu.choice "Save to favorites", 1
            menu.choice "Go back", 2
           end 
           today_return_selection(today_return_selection)  
    end

#Method to process return selection
    def today_return_selection(return_selection)
        favorite_check
        case return_selection
        when 1
            if @check == false
                add_to_favorites(@selected_activity)
                favorite_saved 
                fav_saved_return   
            else
                puts "\nYou already have #{@selected_activity} in your favorites".red
                fav_saved_return   
            end          
        when 2
            today_menu
        else
            puts "Thats not right..."
        end   
    end

#Method to verify favorite is saved
    def favorite_saved
        puts "\n#{@selected_activity.last} saved to favorites!".green      
    end

#Method to display options after favorite saved
    def fav_saved_return
        fav_return_selection = @prompt.select("\nWhat would you like to do".blue) do |menu|
            menu.choice "Return to todays activities", 1
            menu.choice "Go to main menu", 2
           end
           fav_saved_selection(fav_return_selection)      
    end

#Method to process fav saved return selection 
    def fav_saved_selection(return_selection)
        case return_selection
        when 1
            today_menu           
        when 2
            welcome_header
            main_menu
        else
            puts "Thats not right..."
        end   
        
    end


#Method to display the favorites list

    def display_favorites
        favorites_header
        if @fav_list.length == 0
            puts "You have no favorites!!!".yellow
        else
        puts @fav_list.uniq
        end
        line_divider
        favorites_menu
    end
 
#Method to display the favorites menu
    def favorites_menu
        
        process_favorites
        deleted_favorite = @prompt.select("\nSelect a favorite to delete or EXIT to main menu\n", @processed_favs.uniq.push({name: "--EXIT--", value: fav_list.length+1})) 
       delete_selection(deleted_favorite)
    end

#Method to process delete selection
    def delete_selection(deleted_favorite)

        if deleted_favorite <= @fav_list.length
            delete_favorite(deleted_favorite)
            @processed_favs =[] 
            display_favorites
        else 
        welcome_header
        main_menu
        end

    end
   



#Method to process the activity list for the menu
    def process_today_activities
        i=0
        while i < 10
               item  = {name: today_activities[i][:title], value: i+1.to_i}  
                
                @processed_today << item
                 
                i += 1     
            end   
    end

#Method to process the favorites list for the menu
    def process_favorites
        i=0
        while i < fav_list.length
               item  = {name: fav_list[i], value: i+1.to_i}
                
                @processed_favs << item
                 
                i += 1     
            end   
    end


    def welcome_header
        system 'clear'
        puts @header.light_blue
        puts "Lets find something to do!".center(@header_length)
        puts @header.light_blue
    end

    def today_header
        system 'clear'
        puts @header.light_blue
        puts "Find something to do today!".center(@header_length)
        puts @header.light_blue
    end

    def favorites_header
        system 'clear'
        puts @header.light_blue
        puts "My Favorites".center(@header_length)
        puts @header.light_blue
    end

    def leave_header
        system 'clear'
        puts @header.light_blue
        puts "See you next time!".center(@header_length)
        puts @header.light_blue
    end

    def line_divider   
        puts @header.light_blue
    end


#Method to check if favorite exists

    def favorite_check
        @check = @fav_list.include?(@selected_activity)
       
    end

    def leave_app
        leave_header
        puts "Have a great day!".center(@header_length).blue
        sleep(1.5)
        system 'clear'
        exit!   
    end

end
# Title blocksheaders





    # def lists_today_activities
    #     i =0
    #      while i < today_activities.length-1
    #         title = today_activities[i][:title]
    #         puts "#{title.strip}"
            
    #         i += 1
    #      end
    #     end

    #     def combine_today_titles
    #         i =0
    #          while i < today_activities.length-1
    #             title = today_activities[i][:title]
                
    #             @today_titles << title
    #             i += 1
    #          end
    #     end

    #     def combine_today_description
    #         i =0
    #          while i < today_activities.length-1
    #             description = today_activities[i][:description]
                
    #             @combine_today_description << description
    #             i += 1
    #         end
            
    #     end

    #     def activity_display
    #         i=0
    #        while i < 10
               
    #           bob = {name: today_activities[i][:title], value: i+1.to_i}

    #           @list << bob

    #             i += 1     
    #         end
    #     end 

    #     def melb_list_today

    #         i=0
    #        while i < 10
               
    #           bob = {name: today_activities[i][:title], value: i+1.to_i}           
    #              @list << bob

    #             i += 1     
    #         end
        
    #     end        
    







