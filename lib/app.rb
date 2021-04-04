require_relative 'project'
require "tty-prompt"


class App
    attr_accessor :current_projects, :completed_projects
    
    #what initialises on app start
    def initialize 
        @current_projects = []
        @completed_projects = []
        @prompt = TTY::Prompt.new
    end

    # def run
    #     new_project
    #     display_enter_project
    #     input_project_name
    #     add_to_current_projects
    #     new_project
    #     display_enter_project
    #     input_project_name
    #     add_to_current_projects
    #     list_project_properties (1)
    #     # print_screen
        
    # end


    #add a project to the list

    def new_project(name, hours, rate)
        @job = Project.new(name: name, booked_hours: hours.to_f, hourly_rate: rate.to_f)
        
    end

    #display to add a project
    def display_enter_project
        puts "Enter a project name"   
    end
    #display enter hours
    def display_enter_hours
        puts "Enter your booked hours"   
    end
    #display enter rate
    def display_enter_rate
        puts "Enter your hourly rate"   
    end

      # input project name
      def input_project_name
        gets.strip
        # @job.name = input   
        
    end
      # input project hours
      def input_project_hours
         gets.strip
        # @job.booked_hours = input   
        
    end
      # input project rate
      def input_project_rate
        gets.strip
           
        
    end

    def add_to_current_projects
        @details = {project_number: Project.count, 
        name: @job.name, 
        booked_hours: @job.booked_hours, 
        worked_hours: 0.0, 
        hourly_rate: @job.hourly_rate, 
        current_hours: 0.0, 
        completed: false, 
        invoiced: false}
        @current_projects << @details
        
        
    end

    def print_screen
        p @current_projects
        p @current_projects.length
        p @current_projects[0][:name]
       
        
    end

    def list_projects
        puts "Projects:"
        @current_projects.each do |name|
            puts "#{name[:name]}"
        end
            
    end

    def list_project_properties(index)
        puts @current_projects[index]
        
    end

  

   
    
end



# p Project.count



