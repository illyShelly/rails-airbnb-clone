class RemoveCheckoutFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :checkout, :string
  end
end
