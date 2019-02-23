class AddCheckoutToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkout, :date
  end
end
