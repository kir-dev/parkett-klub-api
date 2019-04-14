class User < ApplicationRecord
  belongs_to :member, optional: true
  validate :member_soundness

  def member_soundness
    return unless member_id.present? && !Member.exists?(member_id)

    add_invalid_error :member_id
  end

  def add_invalid_error(id)
    errors.add id, 'is invalid'
  end
end
