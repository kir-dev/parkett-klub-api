class CreateDjsParties < ActiveRecord::Migration[5.0]
  def change
    create_table :djs_parties do |t|
      t.references :dj, foreign_key: true
      t.references :party, foreign_key: true
    end
  end
end
