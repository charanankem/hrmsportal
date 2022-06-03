require 'rails_helper'

RSpec.describe Employee, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:emp_role) {create(:role, name: 'employee')}
  it "is valid with all fields" do
    # role=create(:role,name: "employee",description: "some desc")
    employee=build(:employee, first_name: "charan sai",last_name: "Ankem",employee_unique_id: "zen123",role_id: emp_role.id,email: "zen123@gmail.com" ,password: "123456")
    expect(employee).to be_valid
  end
end
