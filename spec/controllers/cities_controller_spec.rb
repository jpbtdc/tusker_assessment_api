require 'rails_helper'

RSpec.describe CitiesController, type: :controller do
  let(:city1) { City.new('London') }
  let(:city2) { City.new('Paris') }
  let(:city3) { City.new('New York') }
  let(:cities) { [ city1, city2, city3 ] }

  describe "GET #index" do
    it "renders cities" do
      expect(City).to receive(:all).and_return(cities)
      get :index
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end
  end
end
