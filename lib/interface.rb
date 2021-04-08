
require "tty-prompt"
require "byebug"
require 'colorize'



class Interface

    attr_reader :prompt
    attr_writer :title
    
    def initialize
        @prompt = TTY::Prompt.new
        @header = "-"*50
        @header_length = @header.length 
        @title
        
        
    end

    def welcome
        system 'clear'
        puts @header.colorize(:color => :light_blue)
        puts "Lets find something to do!".center(@header_length)
        puts @header.colorize(:color => :light_blue)
     
    end


    def title_block(title)
        system 'clear'
        puts @header.colorize(:color => :light_blue)
        puts title.center(@header_length)
        puts @header.colorize(:color => :light_blue)

        
    end

    def leave_app
        title_block("See you next time")
        puts "Have a great day!".colorize(:color => :light_blue)
        print "3 ".colorize(:color => :light_green)
        sleep(1)
        print "2 ".colorize(:color => :yellow)
        sleep(1)
        print "1\n".colorize(:color => :light_red)
        sleep(1)
        system 'clear'
    
        app = false
        exit!
        
    end

    
end

