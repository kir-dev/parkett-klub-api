class Workshop < ApplicationRecord
  belongs_to :dance, optional: true
  validate :dance_soundness

  belongs_to :dance_teacher, optional: true
  validate :dance_teacher_soundness

  belongs_to :party, optional: true
  validate :party_soundness

  def dance_soundness
    if dance_id.present? && !Dance.exists?(dance_id)
      add_invalid_error :dance_id
    end
  end

  def dance_teacher_soundness
    if dance_teacher_id.present? && !DanceTeacher.exists?(dance_teacher_id)
      add_invalid_error :dance_teacher_id
    end
  end

  def party_soundness
    if party_id.present? && !Party.exists?(party_id)
      add_invalid_error :party_id
    end
  end

  def add_invalid_error(id)
    errors.add id, 'is invalid'
  end
end
