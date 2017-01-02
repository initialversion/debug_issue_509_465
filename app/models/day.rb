class Day < ApplicationRecord
  # Direct associations

  has_many   :projects,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :day, :presence => true

end
