class Party < ApplicationRecord
  belongs_to :dance_course, optional: true
  validate :dance_course_soundness

  belongs_to :dance_type, optional: true
  validate :dance_type_soundness

  has_many :workshop

  has_and_belongs_to_many :djs
  has_and_belongs_to_many :bands

  def dance_course_soundness
    return unless dance_course_id.present? && !DanceCourse.exists?(dance_course_id)

    add_invalid_error :dance_course_id
  end

  def dance_type_soundness
    return unless dance_type_id.present? && !DanceType.exists?(dance_type_id)

    add_invalid_error :dance_type_id
  end
end
