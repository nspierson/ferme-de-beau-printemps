class AddCityCountryStreetPostalcodeClientnameClientemailToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :city, :string
    add_column :orders, :country, :string
    add_column :orders, :street, :string
    add_column :orders, :street2, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :client_name, :string
    add_column :orders, :client_email, :string
  end
end
