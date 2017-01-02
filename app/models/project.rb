class Project < ApplicationRecord
  # Direct associations

  belongs_to :location

  belongs_to :date,
             :class_name => "Day",
             :foreign_key => "day_id"

  has_many   :project_skills,
             :dependent => :destroy

  belongs_to :organization

  # Indirect associations

  # Validations

  validates :day_id, :presence => true

  validates :description, :presence => true

  validates :location_id, :presence => true

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :number_of_volunteers_required, :presence => true

  validates :organization_id, :presence => true

end
