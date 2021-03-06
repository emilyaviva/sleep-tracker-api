require 'rails_helper'

RSpec.describe Person, type: :model do
  it { should have_many(:sleep_periods).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
