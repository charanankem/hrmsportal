class Designation < ApplicationRecord
  has_many :employees, :through => :employee_details

  validates :name, presence: true
end
