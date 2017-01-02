class Location < ApplicationRecord
  # Direct associations

  has_many   :projects,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :neighborhood, :presence => true

end
