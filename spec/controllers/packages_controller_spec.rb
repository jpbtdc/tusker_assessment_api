require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  let(:packages) {
    [
      Package.new(code: 'pk1', contents: [ '1a', '1b' ]),
      Package.new(code: 'pk2', contents: [ '2a', '2b' ]),
      Package.new(code: 'pk3', contents: [ '3a', '3b' ])
    ]
  }

  describe "GET #index" do
    it "renders packages" do
      expect(Package).to receive(:all).and_return(packages)
      get :index
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
    end
  end
end
