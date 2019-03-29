class Workshop < ApplicationRecord
  # TODO: find a way for foreign keys to be either valid or null

  belongs_to :dance, optional: true
  validates_associated :dance

  belongs_to :dance_teacher, optional: true
  validates_associated :dance_teacher

  belongs_to :party, optional: true
  validates_associated :party
end
