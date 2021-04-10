require_relative '../lib/activity'

RSpec.describe Activity do
    subject(:activity) do
      described_class.new
    end

  #This test is to check if the instance if the activity class is created
    describe 'Class testing' do
        it 'should be an instance of Activity' do
          expect(activity).to be_a Activity
        end
      end
      
#This test checks that the initial website scrape completes as the app initialises
#with the @today_activities variable  empty array and then is populated if successful
    describe 'initial settings' do
        it 'should populate activity list' do
          expect(activity.today_activities).not_to eq([])        
        end      
    end

  #This test checks that when a favorite is added to the list the last favorite
  #in the favorites list equals the favorite that was added.
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
    #This test checks that when a favorite is deleted it is no longer in the list
    #by comparing the deleted favorite with the favorite list.
      it 'should remove a favorite from the list' do
        removed_fav = {title: 'fav 2', description: 'for delete test'}
        activity.delete_favorite(1)
        expect(activity.fav_list).not_to include(removed_fav)
      end

    end


 end


