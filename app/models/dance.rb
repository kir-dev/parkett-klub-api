class Dance < ApplicationRecord
  belongs_to :dance_type
  validates_associated :dance_type

  has_many :dance_course
end
