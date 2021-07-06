class Rental < ApplicationRecord
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true

  has_many :depots, dependent: :destroy

  accepts_nested_attributes_for :depots,
                                allow_destroy: true,
                                reject_if: :all_blank
end
