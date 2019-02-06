class Party < ApplicationRecord
  belongs_to :dance_course
  validates_associated :dance_course
end
