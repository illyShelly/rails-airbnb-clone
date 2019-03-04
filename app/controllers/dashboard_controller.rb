class DashboardController < ApplicationController

  # all my bookings made -> others flats
  def all_bookings
    @my_bookings = current_user.bookings.order(checkin: :asc)
    authorize :dashboard, :all_bookings?
  end

  # all flats booked by others
  def all_flats
    @my_flats = current_user.flats
    authorize :dashboard, :all_flats?

    # all bookings -> ordered by check-in date FIFO
    @bookings = policy_scope(Booking).order(checkin: :asc).all

    # bookings related to my own flats
    @bookings_of_flat = []
      # all flats -> others as well
      @my_flats.each do |flat|
        @bookings.each do |booking|
          # check once more booked flat has id as my flat
          if booking.flat_id == flat.id
            # display every booking - from new to old
            @bookings_of_flat << booking
          end
        end
    end
    # needs to be here to after loop -> to include all, not just 1
      return @bookings_of_flat
  end
end


# 1. show all my flats - created
# 2. show all my bookings - others owners
# e.x. User.order('id ASC').reorder('name DESC')


