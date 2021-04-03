require_relative '../lib/app'

RSpec.describe App do
    subject(:app){described_class.new}

    it 'should have an empty project list' do
        expect(app.projects).to eq []
    end

    context 'adding a project' do

        it 'should add a project to the list' do
            app.new_project('Create Project', 5, 100)
            expect(app.projects.last).to eq ({project: 'Create Project', booked_hours: 5, worked_hours: 0.0, hourly_rate: 100, current_hours: 0, completed: false, invoiced: false}) 
        end

        it 'should get user input' do
            expected_output  = "Enter a project name\n"
            expect{app.display_add_project}.to output(expected_output).to_stdout
        end

        let(:input) {StringIO.new('test project')}
        it 'should receive project information' do
            $stdin = input
            expect(app.add_project_name).to eq ('test project')
        end
         
    end
    


end






