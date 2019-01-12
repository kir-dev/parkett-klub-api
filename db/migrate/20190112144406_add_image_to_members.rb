class AddImageToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :image, :string
  end
end
