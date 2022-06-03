class Leave < ApplicationRecord
  has_many :employee_leaves

  validates :name, presence: true
  validates :no_of_days, presence: true
end
