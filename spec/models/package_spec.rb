require 'rails_helper'

RSpec.describe Package, :type => :model do
  let(:packages) {
    [
      { code: 'pk1', contents: [ '1a', '1b' ] },
      { code: 'pk2', contents: [ '2a', '2b' ] },
      { code: 'pk3', contents: [ '3a', '3b' ] }
    ].to_json
  }

  before(:each) { ActiveResource::HttpMock.respond_to { |mock| mock.get "/packages.json", TuskerMarvelResourceHelpers.headers, packages } }

  describe 'all' do
    subject { Package.all }
    it { is_expected.to all(be_a(Package)) }
  end

  describe 'find_by_missing_contents' do
    subject { Package.find_by_missing_contents([ '1a', '2b' ]) }
    it { is_expected.to all(be_a(Package)) }
    it { expect(subject.length).to eq 1 }
  end

  describe 'includes_contents?' do
    let(:package) { Package.new(code: 'pk1', contents: [ '1a', '1b', '1c' ]) }
    context 'when includes all contents' do
      subject { package.includes_contents? [ '1a', '1b' ] }
      it { is_expected.to be true }
    end
    context 'when includes some contents' do
      subject { package.includes_contents? [ '1a', '2a' ] }
      it { is_expected.to be true }
    end
    context 'when includes no contents' do
      subject { package.includes_contents? [ '2a', '2b' ] }
      it { is_expected.to be false }
    end
  end
end
