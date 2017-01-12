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

  describe "GET #show" do
    context "when city exists" do
      it "renders city" do
        expect(City).to receive(:all).and_return(cities)
        get :show, params: { id: city2.name }
        expect(response).to be_success
      end
    end

    context "when prospect does exists" do
      it "renders not found" do
        expect(City).to receive(:all).and_return(cities)
        get :show, params: { id: 'Vatican' }
        expect(response.status).to be(404)
      end
    end
  end

end
