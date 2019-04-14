class Party < ApplicationRecord
  belongs_to :dance_course, optional: true
  validate :dance_course_soundness

  has_many :workshop

  def dance_course_soundness
    return unless dance_course_id.present? && !DanceCourse.exists?(dance_course_id)

    add_invalid_error :dance_course_id
  end
end
