class CreateDanceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_types do |t|
      t.string :name
      t.string :color
      t.string :image
    end

    add_reference :dances, :dance_type, index: true
  end
end
