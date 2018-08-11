class CreateDanceTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_teachers do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
