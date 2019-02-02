class Dance < ApplicationRecord
  belongs_to :dance_type
  validates_associated :dance_type
end
