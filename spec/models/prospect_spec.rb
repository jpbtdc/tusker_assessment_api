require 'rails_helper'

RSpec.describe Prospect, :type => :model do
  let(:prospects) {
    [
      { contact: "Alice", received: [ '1a', '1b' ], delivery_city: 'London' },
      { contact: "Bruce", received: [ '2a', '2b' ], delivery_city: 'Paris' },
      { contact: "Clare", received: [ '3a', '3b' ], delivery_city: 'New York' }
    ].to_json
  }

  describe 'all' do
    before { ActiveResource::HttpMock.respond_to { |mock| mock.get "/prospects.json", {}, prospects } }
    subject { Prospect.all }
    it { is_expected.to all(be_a(Prospect)) }
  end
end
