class Attendance < ApplicationRecord
  belongs_to :employee

  def logintime
    lt=self.login
  end

  def logouttime
    lot=self.logout
  end
end
