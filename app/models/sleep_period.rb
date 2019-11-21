class SleepPeriod < ApplicationRecord
  belongs_to :person
  validates_presence_of :started_at
  validates_presence_of :ended_at
  validates_presence_of :quality
end
