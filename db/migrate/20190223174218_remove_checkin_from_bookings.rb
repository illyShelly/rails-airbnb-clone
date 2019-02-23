class RemoveCheckinFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :checkin, :string
  end
end
