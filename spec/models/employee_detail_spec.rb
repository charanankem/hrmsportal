require 'rails_helper'

RSpec.describe EmployeeDetail, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with all fields" do
    employee_detail=create(:employee_detail, contact_no: "9985955837",emergency_contact_no:"8501801810",blood_group:"b+",work_experience:"5years",employee_id: 1,designation_id: 1)
    expect(:employee_detail).to be_valid
  end
end
