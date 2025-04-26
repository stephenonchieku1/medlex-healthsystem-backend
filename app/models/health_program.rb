class HealthProgram < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :clients, through: :enrollments

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :active, inclusion: { in: [true, false] }
end 