class AddColumnDoorNoToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :door_no, :string
  end
end
