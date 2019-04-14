class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def add_invalid_error(id)
    errors.add id, 'is invalid'
  end
end
