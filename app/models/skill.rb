class Skill < ApplicationRecord
  # Direct associations

  has_many   :project_skills,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
