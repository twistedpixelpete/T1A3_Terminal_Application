class App
    attr_accessor :projects
    
    #what initialises on app start
    def initialize 
        @projects = []
    end

    #display to add a project
    def display_add_project
        puts "Enter a project name"   
    end
 
    # receives project name
    def add_project_name
        input_project = gets.strip
        
    end

    #add a project to the list
    def  new_project(input_project, input_hours, input_rate)
        @projects << {project: input_project, booked_hours: input_hours, worked_hours: 0.0, hourly_rate: input_rate, current_hours: 0, completed: false, invoiced: false} 
    end



    
end



