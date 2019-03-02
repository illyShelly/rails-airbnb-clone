class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, :description, :photo, :price, :address, :location, :capacity, presence: true
  validates :capacity, inclusion: { in: 1..8 }
  # validates :name, :description, :price, :address, :location, :capacity, presence: true

  include PgSearch
  pg_search_scope :search_by_columns,
    against: [ :name, :description, :address, :location ],
    using: {
      tsearch: { prefix: true } # <-- now `awesome fl` will return something!
    }
end


# 1. rails g model Flat name:string description:text photo:string price:integer address:string location:string capacity:integer  user:references
# 2. has many bookings -> when destroy flat -> bookings as well
# 3. added carrierwave gem for photo - app/uploaders/photo_uploader.rb, form update for flat
# 4. added line for using map with lat, lng for address
# 5. include PgSearch gem -> define what to search -> all columns rails c: Flat.search_by_columns("central fla")
# !!! needs to uncomment and have photo as present -> otherwise error not seed complete
# then display photo_uploader for local not run error for html file
