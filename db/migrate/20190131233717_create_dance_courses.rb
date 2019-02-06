class CreateDanceCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_courses do |t|
      t.references :dance_teacher, foreign_key: true
      t.references :dance, foreign_key: true
      t.string :level
      t.string :length

      t.timestamps
    end
  end
end
