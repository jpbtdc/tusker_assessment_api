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
    before { ActiveResource::HttpMock.respond_to { |mock| mock.get "/prospects.json", TuskerMarvelResourceHelpers.headers, prospects } }
    subject { Prospect.all }
    it { is_expected.to all(be_a(Prospect)) }
  end

  describe 'next_package' do
    before { ActiveResource::HttpMock.respond_to { |mock| mock.get "/prospects.json", TuskerMarvelResourceHelpers.headers, prospects } }
    subject { Prospect.all.detect{ |p| p.contact == 'Alice' }.next_package }

    context 'when package exists where content not already received' do
      let(:package1) { Package.new(code: 'pk1', contents: [ '1a', '2b' ]) }
      let(:package2) { Package.new(code: 'pk2', contents: [ '2b', '3a' ]) }
      let(:package3) { Package.new(code: 'pk3', contents: [ '3a', '1b' ]) }
      let(:packages) { [ package1, package2, package3 ] }
      it 'returns package with unreceived content' do
        expect(Package).to receive(:all).and_return(packages)
        is_expected.to eq package2
      end
    end

    context 'when no package exists where content not already received' do
      let(:package1) { Package.new(code: 'pk1', contents: [ '1a', '2b' ]) }
      let(:package2) { Package.new(code: 'pk2', contents: [ '2b', '1a' ]) }
      let(:package3) { Package.new(code: 'pk3', contents: [ '3a', '1b' ]) }
      let(:packages) { [ package1, package2, package3 ] }
      it 'returns nil' do
        expect(Package).to receive(:all).and_return(packages)
        is_expected.to be_nil
      end
    end
  end
end
