class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :address, :price, presence: true

end
