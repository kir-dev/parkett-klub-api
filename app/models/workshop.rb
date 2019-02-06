class Workshop < ApplicationRecord
  belongs_to :dance
  validates_associated :dance

  belongs_to :dance_teacher
  validates_associated :dance_teacher

  belongs_to :party
  validates_associated :party
end
