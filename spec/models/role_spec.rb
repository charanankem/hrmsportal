require 'rails_helper'

RSpec.describe Role, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with all fields" do
    role=create(:role,name: "employee",description: "some desc")
    expect(role).to be_valid
  end
end
