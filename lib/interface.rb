
require "tty-prompt"
require "byebug"



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
        puts @header
        puts "Lets find something to do!".center(@header_length)
        puts @header
     
    end


    def title_block(title)
        system 'clear'
        puts @header
        puts title.center(@header_length)
        puts @header

        
    end




end
