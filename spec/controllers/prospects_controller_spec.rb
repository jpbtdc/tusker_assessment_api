require 'rails_helper'

RSpec.describe ProspectsController, type: :controller do
  let(:prospect1) { Prospect.new(contact: 'Alice', received: [ '1a', '1b' ], delivery_city: 'London') }
  let(:prospect2) { Prospect.new(contact: 'Bruce', received: [ '2a', '2b' ], delivery_city: 'Paris') }
  let(:prospect3) { Prospect.new(contact: 'Clare', received: [ '3a', '3b' ], delivery_city: 'New York') }
  let(:prospects) { [ prospect1, prospect2, prospect3 ] }

  describe "GET #index" do
    it "renders prospects" do
      expect(Prospect).to receive(:all).and_return(prospects)
      expect(prospect1).to receive(:next_package).and_return(Package.new(code: 'pk1', contents: [ '2a', '2b' ]))
      expect(prospect2).to receive(:next_package).and_return(nil)
      expect(prospect3).to receive(:next_package).and_return(Package.new(code: 'pk3', contents: [ '1a', '1b' ]))
      get :index
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
      expect(json[2][:next_package]).to be_nil
    end
  end

  describe "GET #show" do
    context "when prospect exists" do
      it "renders prospect" do
        expect(Prospect).to receive(:all).and_return(prospects)
        get :show, params: { id: prospect3.contact }
        expect(response).to be_success
      end
    end

    context "when prospect does exists" do
      it "renders not found" do
        expect(Prospect).to receive(:all).and_return(prospects)
        get :show, params: { id: 'Zach' }
        expect(response.status).to be(404)
      end
    end
  end
end
