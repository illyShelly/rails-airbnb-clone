class DashboardController < ApplicationController

  def all_bookings
    @my_bookings = current_user.bookings
    authorize :dashboard, :all_bookings?
  end

  def all_flats
    @flats = current_user.flats
    authorize :dashboard, :all_flats?

    # all bookings related to my own flats -> ordered by check-in date FIFO
    @bookings = policy_scope(Booking).order(checkin: :asc).all

    @bookings_of_flat = []

    @flats.each do |flat|

      @bookings.each do |booking|

        if booking.flat_id == flat.id
          # display every booking - from new to old
          @bookings_of_flat << booking
        end
      end

    end

    # end
    return @bookings_of_flat
  end
end


# 1. show all my flats - created
# 2. show all my bookings - others owners
# e.x. User.order('id ASC').reorder('name DESC')
