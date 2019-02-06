class DanceTeacher < ApplicationRecord
  has_many :dance_course
  has_many :workshop
end
