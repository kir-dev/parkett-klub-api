class User < ApplicationRecord

  def admin?
    self.role == 'admin'
  end

end
