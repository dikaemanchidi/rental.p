class Depot < ApplicationRecord
  belongs_to :rental, optional: true
end
