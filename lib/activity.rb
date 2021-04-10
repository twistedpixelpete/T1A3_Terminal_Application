require 'nokogiri'
require 'httparty'
require 'tty-prompt'
require 'colorize'
require 'json'
require 'netchecker'

#the Class Activity is the application
class Activity
    

    attr_reader :today_activities, :fav_list, :chosen_today_activity, :processed_today, :weekend_activities
    attr_accessor :selected_activity, :active

# Initialise class variables and scrape website for current information
    def initialize(file_path)
        
        connection?
        @today_activities = []
        @weekend_activities = []
        @processed_today = []  
        @processed_weekend = []  
        @processed_favs = []
        @chosen_today_activity
        @chosen_weekend_activity
        @selected_activity =[]
        @fav_list = []
        @prompt = TTY::Prompt.new
        @bar = TTY::ProgressBar.new("[:bar]", bar_format: :box, width: 60)
        @header = "-"*60
        @header_length = @header.length
        @check = true
        @active = 1
        @file_path = file_path
        load_data(file_path)
                  
    end

#Method to run the app
    def run
        if  ARGV.empty? && @alive
            scrape_today  
            scrape_weekend
            process_today_activities
            process_weekend_activities
            run_normal
            elsif !ARGV.empty? && @alive      
            scrape_today  
            scrape_weekend
            process_today_activities
            process_weekend_activities
            run_argv
            elsif !ARGV.empty? && !@alive
            run_argv
            else    
            run_offline
            30.times do
            sleep(0.1)
            @bar.advance
            end 
            display_favorites
        end   
    end

#Method to run in normal mode
    def run_normal
        welcome_header
        main_menu    
    end

#Mehod to run offline
    def run_offline
        offline_header
    end



#method to run in ARVG mode
    def run_argv
        first, *other = ARGV
        ARGV.clear
        case first
        when 'favs', "f"
        display_favorites
        when '-new', "-n"
        
        add_to_favorites(other.join(' '))
        puts "#{other.join(' ')} has been added to the list"
        process_favorites
        when '-today', '-t'
        raise StandardError, "Currently offline, connect the internet to see todays activities - check if online '-online' '-o'" if @alive == false
        display_today_activity_name
        when '-weekend', '-w'
        raise StandardError, "Currently offline, connect the internet to see the weekends activities - check if online '-online' '-o'" if @alive == false
        display_weekend_activity_name
        when '-all', '-a'
        raise StandardError, "Currently offline, connect the internet to see the list of activities - check if online '-online' '-o'" if @alive == false
        display_today_activity_name
        display_today_activity_name
        when '-online', '-o'
       puts @alive
        when '-help', '-h'
       puts "-today, -t   Displays todays activities"
       puts "-weekend, -w Displays weekend activities"
       puts "-all, -a     Displays all activities"
       puts "-new, -n     Add your own favourite"
       puts "-online, -o  Checks internet connection"
       else
       puts 'Not a valid argument!'
       end
       File.write(@file_path, @processed_favs.uniq.to_json)        
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
                description: activity.css('p').text }  
            @today_activities << activity                
        end               
    end
    

    
# Method to scrape website for whats happening on the weekend in Melbourne
    def scrape_weekend
        url = "https://www.timeout.com/melbourne/things-to-do/things-to-do-in-melbourne-this-weekend"
        unparsed_page = HTTParty.get(url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        items = parsed_page.css('div.card-content')
        items.each do |activity|
            activity = {
                title: activity.css('h3.card-title').text.strip,
                description: activity.css('p').text }  
            @weekend_activities << activity                
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
# Method to display weekend titles
    def display_weekend_activity_name
        i = 0
        while i < 10
            puts weekend_activities[i][:title]
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
        @active = 0
        @prompt.select("\nWhat would you like to do?\n".blue) do |menu|
            menu.choice "Check out what's on today", -> {today_menu} 
            menu.choice "Check out things to do on the weekend", -> {weekend_menu}
            menu.choice "Look at my favourites", -> {display_favorites}
            menu.choice "Exit".red, -> {leave_app}    
           end    
    end

#Method to display the today menu
    def today_menu
        @active = 1
        if @alive ==true
        today_header
        else
        offline_header
        end
        @selected_activity = []
        @chosen_today_activity = @prompt.select("\nSelect an activity to find out more\n".blue, @processed_today.push({name: "--Back to Menu--", value: 11}).uniq) 
        today_selection(chosen_today_activity)    
    end

#Method to receive the today selection
    def today_selection(chosen_today_activity)
        if  chosen_today_activity <= 10
                    puts "\n#{today_activities[chosen_today_activity-1][:description]}"
                    @selected_activity << today_activities[chosen_today_activity-1][:title]                  
                    today_return_menu
        else
            if chosen_today_activity == 11
                welcome_header
                main_menu
            end
        end
        
    end

#Method to display today return menu
    def today_return_menu
        today_return_selection = @prompt.select("\nSave to your favourites list or go back\n".blue) do |menu|
            menu.choice "Save to favourites", 1
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
                add_to_favorites(@selected_activity.last)
                favorite_saved 
                fav_saved_return   
            else
                puts "\nYou already have #{@selected_activity.last} in your favourites".red
                fav_saved_return   
            end          
        when 2
            if active == 1 
            today_menu
            else   
            weekend_menu
            end
           
        else
            puts "That's not right..."
        end   
    end

#Method to verify favorite is saved
    def favorite_saved
        puts "\n#{@selected_activity.last} saved to favourites!".green      
    end

#Method to display options after favorite saved
    def fav_saved_return
        fav_return_selection = @prompt.select("\nWhat would you like to do".blue) do |menu|
            menu.choice "See today activities", 1
            menu.choice "See weekend activities", 2
            menu.choice "See my favourites", 3
            menu.choice "--Main Menu--", 4
           end
           fav_saved_selection(fav_return_selection)      
    end

#Method to process fav saved return selection 
    def fav_saved_selection(return_selection)
        case return_selection
        when 1
            today_menu           
        when 2
            weekend_menu
        when 3
            display_favorites
        else
            welcome_header
            main_menu
        end   
        
    end


#Method to display the favorites list

    def display_favorites
        if @alive == true
        favorites_header
        else
        offline_header
        end
        if @fav_list.length == 0
            puts "You have no favourites!!!".center(@header_length).yellow
        else
        puts @fav_list.uniq
        end
        line_divider
        favorites_menu
    end
 
#Method to display the favorites menu
    def favorites_menu
        
        process_favorites
        deleted_favorite = @prompt.select("\nSelect a favourite to DELETE or EXIT to main menu\n".blue, @processed_favs.uniq.push({name: "--EXIT--".green, value: fav_list.length+1}), active_color: :red) 
       delete_selection(deleted_favorite)
    end

#Method to process delete selection
    def delete_selection(deleted_favorite)

        if deleted_favorite <= @fav_list.length
                delete = @prompt.ask("\nAre you sure?\nEnter 'Y' to confirm or any key to return") do |q|
                q.modify :down
              end
              case delete  
              when "y"
                delete_favorite(deleted_favorite)
            @processed_favs =[] 
            display_favorites
            else
                display_favorites
            end
            
        else 
        welcome_header
        main_menu
        end

    end
   

#Method to process the today activity list for the menu
    def process_today_activities
        i=0
        while i < 10
               item  = {name: today_activities[i][:title], value: i+1.to_i}  
                
                @processed_today << item
                 
                i += 1     
            end   
            
    end

#Method to process the weekend activity list for the menu
    def process_weekend_activities
        i=0
        while i < 10
               item  = {name: weekend_activities[i][:title], value: i+1.to_i}  
                
                @processed_weekend << item
                 
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

#Method to display the weekend menu
    def weekend_menu
        active = 2
        if @alive == true
        weekend_header
        else
        offline_header
        end
        @selected_activity = []
        chosen_weekend_activity = @prompt.select("\nSelect an activity to find out more\n".blue, @processed_weekend.push({name: "--Back to Menu--", value: 11}).uniq) 
        weekend_selection(chosen_weekend_activity)    
    end

 #Method to receive the weekend selection
    def weekend_selection(chosen_weekend_activity)
        if  chosen_weekend_activity <= 10
                    puts "\n#{weekend_activities[chosen_weekend_activity-1][:description]}"
                    @selected_activity << weekend_activities[chosen_weekend_activity-1][:title] 
                    
                    today_return_menu
        else
            if chosen_weekend_activity == 11
                welcome_header
                main_menu
            end
        end
        
    end

    
    
 #Method to display the welcome header
    def welcome_header
        system 'clear'
        puts @header.light_blue
        puts "Lets find something to do in Melbourne!".center(@header_length)
        puts @header.light_blue
    end
#Method to display the today section header
    def today_header
        system 'clear'
        puts @header.light_blue
        puts "Check out whats on around Melbourne today!".center(@header_length)
        puts @header.light_blue
    end
#Mthod to display the weekend header
    def weekend_header
        system 'clear'
        puts @header.light_blue
        puts "Check out whats on around Melbourne this weekend!".center(@header_length)
        puts @header.light_blue
    end
#Method to display the favourites header
    def favorites_header
        system 'clear'
        puts @header.light_blue
        puts "My Favourites".center(@header_length)
        puts @header.light_blue
    end
#method to display the leave header
    def leave_header
        system 'clear'
        puts @header.light_blue
        puts "See you next time!".center(@header_length)
        puts @header.light_blue
    end
#method to display the leave header
    def offline_header
        system 'clear'
        puts @header.light_blue
        puts "Check your network".center(@header_length).red
        puts "Currently offline - current activities not avilable!".center(@header_length).red
        puts "You can still look at your favourites though!".center(@header_length).red
        puts @header.light_blue
    end
#Method to display the line divider
    def line_divider   
        puts @header.light_blue
    end
#Method to clear the screen
    def clear
        system 'clear'
        
    end

#Method to check if favorite exists in the list

    def favorite_check
        @check = @fav_list.include?(@selected_activity.last)
       
    end

#Method to leave the app
    def leave_app
        leave_header
        puts "Have a great day!".center(@header_length).blue
        File.write(@file_path, @processed_favs.uniq.to_json)
        sleep(1.5)
        system 'clear'
        exit!   
    end

#Method to load saved data
    def load_data(file_path)
        json_data = JSON.parse(File.read(file_path))
        @processed_favs = json_data.map do |fav|
        fav.transform_keys(&:to_sym)   
        end

        i = 0
        while i < @processed_favs.length

            items = @processed_favs[i][:name]
            @fav_list << items

            i += 1
        end
    rescue Errno::ENOENT
        File.open(file_path, 'w+')
        File.write(file_path, [])
        retry
    end

#Method to check there is an internet connection
    def connection?
         check = Netchecker.new() 
        @alive = check.check_url("google.com", 80) 
    end

end

