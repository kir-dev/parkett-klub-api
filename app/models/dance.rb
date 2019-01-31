class Dance < ApplicationRecord
  has_one :dance_type
  validates :dance_type, presence: true
end
