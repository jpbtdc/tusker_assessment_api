require 'rails_helper'

RSpec.describe City, :type => :model do
  let(:prospect1) { Prospect.new(contact: 'Alice', received: [ '1a', '1b' ], delivery_city: 'London') }
  let(:prospect2) { Prospect.new(contact: 'Bruce', received: [ '2a', '2b' ], delivery_city: 'Paris') }
  let(:prospect3) { Prospect.new(contact: 'Clare', received: [ '3a', '3b' ], delivery_city: 'New York') }
  let(:prospects) { [ prospect1, prospect2, prospect3 ] }

  describe 'all' do
    subject { City.all }
    it 'returns cities' do
      expect(Prospect).to receive(:all).exactly(4).times.and_return(prospects)
      expect(prospect1).to receive(:next_package).and_return(Package.new(code: 'pk1', contents: [ '2a', '2b' ]))
      expect(prospect2).to receive(:next_package).and_return(nil)
      expect(prospect3).to receive(:next_package).and_return(Package.new(code: 'pk3', contents: [ '1a', '1b' ]))
      is_expected.to all(be_a(City))
    end
  end
end
