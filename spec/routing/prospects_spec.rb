require 'rails_helper'

RSpec.describe 'prospects', type: :routing do
  it { expect(:get => '/prospects/:prospect_id/next_package').to route_to(controller: 'prospects', action: 'next_package', prospect_id: ':prospect_id') }
  it { expect(:get => '/prospects/:prospect_id/available_packages').to route_to(controller: 'prospects', action: 'available_packages', prospect_id: ':prospect_id') }
end
