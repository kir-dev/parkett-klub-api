class AddDanceTypeToParty < ActiveRecord::Migration[5.0]
  def change
    add_reference :parties, :dance_type, foreign_key: true
  end
end
