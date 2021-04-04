class Project
    @@count = 0

    def self.count
        @@count
        
    end
    attr_accessor :name, :booked_hours, :worked_hours, :hourly_rate, :current_hours, :completed, :invoiced
    attr_reader :project_number

    def initialize (details = {})

        defaults = {project_number: @@count, 
                    name: 'New Job', 
                    booked_hours: 8.0, 
                    worked_hours: 0.0, 
                    hourly_rate: 70.0, 
                    current_hours: 0.0, 
                    completed: false, 
                    invoiced: false }
        defaults.merge!(details)

        @project_number = defaults[:project_number]
        @name = defaults[:name]
        @booked_hours = defaults[:booked_hours]
        @worked_hours = defaults[:worked_hours]
        @hourly_rate = defaults[:hourly_rate]
        @current_hours = defaults[:current_hours]
        @completed = defaults[:completed]
        @invoiced = defaults[:invoiced]
        @@count += 1
        
        
    end

    


end






