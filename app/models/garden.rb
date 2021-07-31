class Garden < ApplicationRecord
  belongs_to :user
  validates :title, :address, :price, presence: true

end
