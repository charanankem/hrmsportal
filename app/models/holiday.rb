class Holiday < ApplicationRecord
  validates :name, presence: true
  validates :date, presence: true
  validates :year, presence: true
end
