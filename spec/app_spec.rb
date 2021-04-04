require_relative '../lib/app'
require_relative '../lib/project'

RSpec.describe App do
    subject(:app){App.new}

    it 'should have an empty project list' do
        expect(app.current_projects).to eq []
    end



    context 'adding a project' do
        before(:each) do
            app.new_project
            
        end
        
        
        it 'should add a project to the list' do
            
            app.add_to_current_projects
            expect(app.current_projects.length).to eq 1
        
        end

        it 'should input project name' do
            expected_output  = "Enter a project name\n"
            expect{app.display_enter_project}.to output(expected_output).to_stdout
        end

        it 'should input project hours' do
            expected_output  = "Enter your booked hours\n"
            expect{app.display_enter_hours}.to output(expected_output).to_stdout
        end

        it 'should input project rate' do
            expected_output  = "Enter your hourly rate\n"
            expect{app.display_enter_rate}.to output(expected_output).to_stdout
        end
  
    end

    # context 'display projects' do
    #     before(:each) do
    #         app.completed_projects = [{project_number: 1, name: "Test Project", booked_hours: 8.0, worked_hours: 0.0, hourly_rate: 70.0, current_hours: 0.0, completed: false, invoiced: false}]
    #     end

    #     it 'should display current projects' do
    #         expected_output = "Projects:\n Test Project\n"

    #         expect{app.list_projects}.to output(expected_output).to_stdout
    #     end

    # end


    


end






