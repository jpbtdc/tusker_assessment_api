require 'rails_helper'

RSpec.describe 'root', type: :routing do
  it { expect(:get => '/').to route_to(controller: 'prospects', action: 'index') }
end
