class AddAddressToOutbreaks < ActiveRecord::Migration
  def change
    add_column :outbreaks, :address, :string
  end
end
