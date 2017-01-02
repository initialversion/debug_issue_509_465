class ProjectSkill < ApplicationRecord
  # Direct associations

  belongs_to :skill

  belongs_to :project

  # Indirect associations

  # Validations

end
