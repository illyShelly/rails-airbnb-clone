class DashboardController < ApplicationController
  def all_bookings
    @bookings = current_user.bookings
  end

  def all_flats
    @flats = current_user.flats
  end
end


# 1. show all my flats - created
# 2. show all my bookings - others owners
# e.x. User.order('id ASC').reorder('name DESC')
