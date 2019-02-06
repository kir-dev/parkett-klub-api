class FixParty < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :photo, :string
    add_column :parties, :start_date, :timestamp
    add_column :parties, :end_date, :timestamp
    add_column :parties, :program, :text
    add_column :parties, :content, :text
    add_column :parties, :facebook_event, :string
    add_column :parties, :application_form, :string
    add_column :parties, :spot, :string
    add_column :parties, :bss, :string
    
    add_reference :parties, :dance_course, index: true
  end
end
