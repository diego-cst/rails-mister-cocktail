class Cocktail < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def average_score
    reviews_count = self.reviews.length
    return "no reviews yet" if reviews_count == 0
    score_sum = 0
    self.reviews.each do |review|
      score_sum += review.stars
    end
    average_score = score_sum/reviews_count
  end

end
