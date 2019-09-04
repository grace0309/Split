class AddAddressToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :deals, :address, :string
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
  end
end
