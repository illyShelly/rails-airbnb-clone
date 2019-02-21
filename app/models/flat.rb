class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
end


# 1. rails g model Flat name:string description:text photo:string price:integer address:string location:string capacity:integer  user:references
# 2. has many bookings -> when destroy flat -> bookings as well
