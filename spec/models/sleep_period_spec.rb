require 'rails_helper'

RSpec.describe SleepPeriod, type: :model do
  it { should belong_to(:person) }
  it { should validate_presence_of(:started_at) }
  it { should validate_presence_of(:ended_at) }
  it { should validate_presence_of(:quality) }
end
