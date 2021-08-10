class Review < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  validates :rating, :content, presence: true
  validates :rating, inclusion: { :in => 1..5 }
end
