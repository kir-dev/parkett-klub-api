class CreateBandsParties < ActiveRecord::Migration[5.0]
  def change
    create_table :bands_parties do |t|
      t.references :band, foreign_key: true
      t.references :party, foreign_key: true
    end
  end
end
