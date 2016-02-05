class AddCountryToAdvertises < ActiveRecord::Migration
  def change
    add_column :advertises, :country, :string
    add_column :advertises, :close_text, :string
    add_column :advertises, :views, :integer, :default => 0
    add_column :advertises, :clicks, :integer, :default => 0
  end
end
