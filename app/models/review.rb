class Review < ApplicationRecord
  belongs_to :cocktail
  validates :stars, presence: true, inclusion: {in: [0, 1, 2, 3, 4, 5], message: "Invalid value!"}
  validates :description, presence: true
end
