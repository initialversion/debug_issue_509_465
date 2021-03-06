class Organization < ApplicationRecord
  # Direct associations

  has_many   :projects,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :description, :presence => true

  validates :location, :presence => true

  validates :name, :uniqueness => true

  validates :name, :presence => true

  validates :website, :uniqueness => true

  validates :website, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
