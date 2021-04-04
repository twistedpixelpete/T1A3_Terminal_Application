require_relative 'lib/app'


freetrack = App.new

freetrack.display_enter_project
name = freetrack.input_project_name

freetrack.display_enter_hours
hours = freetrack.input_project_hours

freetrack.display_enter_rate
rate = freetrack.input_project_rate

freetrack.new_project(name, hours, rate)
freetrack.add_to_current_projects

freetrack.print_screen







