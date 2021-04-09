require_relative '../lib/activity'

RSpec.describe Activity do
    subject(:activity) do
      described_class.new
    end

    describe 'Class testing' do
        it 'should be an instance of Activity' do
          expect(activity).to be_a Activity
        end
      end
      

    describe 'initial settings' do
        it 'should populate activity list' do
          expect(activity.today_activities).not_to eq([])        
        end      
    end

    # describe 'display content'

    #    it 'should display todays titles' do
    #      expected_output = 
    #    end

    describe 'favorites handling' do
      before(:each) do
        activity.fav_list << {title: 'fav 1', description: 'test fav 1'}
        activity.fav_list << {title: 'fav 2', description: 'for delete test'}
        activity.fav_list << {title: 'fav 2', description: 'test fav 3'}
      end
      it 'should add to favorite list' do
        activity.add_to_favorites('new favorite')
      expect(activity.fav_list.last).to eq('new favorite')
      end
      
      it 'should remove a favorite from the list' do
        removed_fav = {title: 'fav 2', description: 'for delete test'}
        activity.delete_favorite(1)
        expect(activity.fav_list).not_to include(removed_fav)
      end

    end


 end


