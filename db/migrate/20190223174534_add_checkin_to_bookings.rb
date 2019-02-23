class AddCheckinToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkin, :date
  end
end
