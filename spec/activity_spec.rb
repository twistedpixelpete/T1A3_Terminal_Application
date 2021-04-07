require_relative '../lib/melb'

RSpec.describe Melb do
    subject(:melb) do
      described_class.new
    end

    describe 'Class testing' do
        it 'should be an instance of Interface' do
          expect(melb).to be_a Melb
        end
      end
      

    end


