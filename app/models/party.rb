class Party < ApplicationRecord
  # TODO: find a way for foreign keys to be either valid or null

  belongs_to :dance_course, optional: true
  validates_associated :dance_course

  has_many :workshop
end
