class AddDanceTypeToWorkshop < ActiveRecord::Migration[5.0]
  def change
    add_reference :workshops, :dance_type, foreign_key: true
  end
end
