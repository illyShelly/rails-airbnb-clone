class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :guests, :checkin, :checkout, presence: true
end
