class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :title, :address, :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  include PgSearch::Model
  pg_search_scope :search_by_address,
    against: [ :address ],
    using: {
      tsearch: { prefix: true } 
    }

end
