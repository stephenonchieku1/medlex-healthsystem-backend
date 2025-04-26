class Enrollment < ApplicationRecord
  belongs_to :client
  belongs_to :health_program

  validates :client_id, presence: true
  validates :health_program_id, presence: true
  validates :enrollment_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[active completed cancelled suspended] }
  validate :validate_unique_enrollment
  validate :validate_enrollment_date
  validate :validate_program_capacity

  private

  def validate_unique_enrollment
    existing_enrollment = Enrollment.where(
      client_id: client_id,
      health_program_id: health_program_id,
      status: %w[active suspended]
    ).where.not(id: id).first

    if existing_enrollment
      errors.add(:base, "Client is already enrolled in this program")
    end
  end

  def validate_enrollment_date
    return unless enrollment_date.present?
    if enrollment_date > Date.current
      errors.add(:enrollment_date, "cannot be in the future")
    end
  end

  def validate_program_capacity
    return unless health_program.present?
    # Add program capacity validation logic here if needed
  end
end 