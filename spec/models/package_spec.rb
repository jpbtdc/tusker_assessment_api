require 'rails_helper'

RSpec.describe Package, :type => :model do
  let(:packages) {
    [
      { code: 'pk1', contents: [ '1a', '1b' ] },
      { code: 'pk2', contents: [ '2a', '2b' ] },
      { code: 'pk3', contents: [ '3a', '3b' ] }
    ].to_json
  }

  describe 'all' do
    before { ActiveResource::HttpMock.respond_to { |mock| mock.get "/packages.json", {}, packages } }
    subject { Package.all }
    it { is_expected.to all(be_a(Package)) }
  end
end
