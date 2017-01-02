class Organization < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :website, :uniqueness => true

  validates :website, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
