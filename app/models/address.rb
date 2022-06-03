class Address < ApplicationRecord
  belongs_to :employee

  validates :door_no, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :pincode, presence: true
  validates :country, presence: true
  validates :employee_id, presence: true

end
