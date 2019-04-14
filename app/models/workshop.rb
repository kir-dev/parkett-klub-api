class Workshop < ApplicationRecord
  belongs_to :dance, optional: true
  validate :dance_soundness

  belongs_to :dance_teacher, optional: true
  validate :dance_teacher_soundness

  belongs_to :party, optional: true
  validate :party_soundness

  def dance_soundness
    return unless dance_id.present? && !Dance.exists?(dance_id)

    add_invalid_error :dance_id
  end

  def dance_teacher_soundness
    return unless dance_teacher_id.present? && !DanceTeacher.exists?(dance_teacher_id)

    add_invalid_error :dance_teacher_id
  end

  def party_soundness
    return unless party_id.present? && !Party.exists?(party_id)

    add_invalid_error :party_id
  end
end
