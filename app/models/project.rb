class Project < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :number_of_volunteers_required, :presence => true

  validates :organization_id, :presence => true

end
