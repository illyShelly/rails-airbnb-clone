class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :guests, :checkin, :checkout, presence: true

  def accept
    # change booking's status
    self.status = "accepted"
    self.save
  end

  def decline
    self.status = "declined"
    self.save
  end
end
