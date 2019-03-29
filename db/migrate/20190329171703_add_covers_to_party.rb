class AddCoversToParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :bss_cover, :string
    add_column :parties, :spot_cover, :string
  end
end
