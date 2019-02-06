class DanceCourse < ApplicationRecord
  has_one :party

  belongs_to :dance_teacher
  validates_associated :dance_teacher

  belongs_to :dance
  validates_associated :dance
end
