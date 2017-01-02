class Project < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :description, :presence => true

  validates :location_id, :presence => true

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :number_of_volunteers_required, :presence => true

  validates :organization_id, :presence => true

end
