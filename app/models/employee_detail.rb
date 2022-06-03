class EmployeeDetail < ApplicationRecord
  belongs_to :employee
  belongs_to :designation


  validates :contact_no, presence: true,length: { is: 10 }
  validates :emergency_contact_no, presence: true,length: { is: 10 }
  validates :blood_group, presence: true
  validates :work_experience, presence: true
  validates :manager_id, presence: true
end
