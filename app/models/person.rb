class Person < ApplicationRecord
  has_many :sleep_periods, dependent: :destroy
  validates_presence_of :name
end
