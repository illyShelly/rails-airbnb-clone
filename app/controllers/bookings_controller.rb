class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def new
    # book particular flat by booking's flat_id
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def create
    # filled in form
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    # logged_in user assign
    @booking.user = current_user
    @booking.flat = @flat

    if @booking.save
      # redirect_to to-all-bookings/dashboard
      redirect_to flats_path
    else
      render :new
    end
  end

  private


  def booking_params
    params.require(:booking).permit(:checkin, :checkout, :guests, :status, :flat_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end


# 1. I want to create new Booking, no edit, update => make sence to know if I want to book or not when paying. Otherwise owner could have lost.
# 2. no possibility to delete or change, could show with payment method?? or direct redirection to payment gate...
# 3. on dashboard -> later created, see all bookings and all my own flats
# 4. see status -> confirm by owner (accept or decline)

# a) booking related to flat and current signin user
# b) when submit booking -> redirect to all my bookings
# c) owner cannot book his own flat
# d) check if flat is not booked already for particular time
# e) accept or decline -> method
