
require "tty-prompt"
require "byebug"



class Interface

    attr_reader :prompt
    
    def initialize
        @prompt = TTY::Prompt.new
        @header = "-"*50
        @header_length = @header.length 
        
        
    end

    def welcome
        system 'clear'
        puts @header
        puts "Lets find something to do!".center(@header_length)
        puts @header
            sleep(1)
         prompt.select("What would you like to do?") do |menu|
            menu.choice "Check out what's on today", -> { melb_list_today } 
            menu.choice "Check out things to do on the weekend", -> { melb_list_weekend }
            menu.choice "Look at my favorites", -> { favorites_list }
            menu.choice "Exit"
          end      
    end

    def melb_list_today
        puts "Today's list"
        
    end

    def melb_list_weekend
        puts "Weekend list"
        
    end

    def favorites_list
        puts "Favorite list"
        
    end




end
