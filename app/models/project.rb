class Project < ApplicationRecord
  #has_many: employees
  #has_many :employee_projects
  #has_many :employees, :through=> :employee_projects
  has_and_belongs_to_many :employees

  validates :name, presence: true
  validates :manager_id, presence: true
  validates :project_lead_id, presence: true
end
