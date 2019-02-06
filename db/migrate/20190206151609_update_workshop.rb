class UpdateWorkshop < ActiveRecord::Migration[5.0]
  def change
    remove_column :workshops, :p

    add_column :workshops, :photo, :string
    add_column :workshops, :start_date, :timestamp
    add_column :workshops, :end_date, :timestamp
    add_column :workshops, :program, :text
    add_column :workshops, :content, :text
    add_column :workshops, :theme, :text
    add_column :workshops, :facebook_event, :string
    add_column :workshops, :application_form, :string
    
    add_reference :workshops, :party, index: true
    add_reference :workshops, :dance, index: true
    add_reference :workshops, :dance_teacher, index: true
  end
end
