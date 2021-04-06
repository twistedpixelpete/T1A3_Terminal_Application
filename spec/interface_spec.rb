require_relative '../lib/interface'

RSpec.describe Interface do
    subject(:interface) do
      described_class.new
    end

    describe 'Class testing' do
        it 'should be an instance of Interface' do
          expect(interface).to be_a Interface
        end
      end


      

    end