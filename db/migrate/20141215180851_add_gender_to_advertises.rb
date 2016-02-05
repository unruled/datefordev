class AddGenderToAdvertises < ActiveRecord::Migration
  def change
    add_column :advertises, :gender, :integer
  end
end
