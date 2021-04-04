require_relative '../lib/project'


RSpec.describe Project do
    subject(:project){described_class.new}

    it 'should be an instance of Project' do
        expect(project).to be_a Project
    end

    # context 'initial values' do
    #     before(:each) do
    #         Project.new
    #     end
    # it 'should populate with default values' do
    #     expect(project.defaults).not_to be_empty
    # end
        
    


    # end
    

    
    


end



