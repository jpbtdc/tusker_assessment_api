require 'rails_helper'

RSpec.describe 'cities', type: :routing do
  it { expect(:get => '/cities/:city_id/packages').to route_to(controller: 'cities', action: 'packages', city_id: ':city_id') }
end
