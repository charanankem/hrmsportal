class EmployeeLeafe < ApplicationRecord
  belongs_to :employee
  has_one :leave
end
