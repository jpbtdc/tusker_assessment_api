require 'rails_helper'

RSpec.describe ProspectsController, type: :controller do
  let(:prospects) {
    [
      Prospect.new(contact: 'Alice', received: [ '1a', '1b' ], delivery_city: 'London'),
      Prospect.new(contact: 'Bruce', received: [ '2a', '2b' ], delivery_city: 'Paris'),
      Prospect.new(contact: 'Clare', received: [ '3a', '3b' ], delivery_city: 'New York')
    ]
  }

  describe "GET #index" do
    it "renders prospects" do
      expect(Prospect).to receive(:all).and_return(prospects)
      get :index
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end
  end
end
