class Client < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :health_programs, through: :enrollments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true, inclusion: { in: %w[male female other Male Female Other] }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :contact_number, presence: true, format: { with: /\A\+?[\d\s-]+\z/, message: "should only contain numbers, spaces, and hyphens" }

  before_validation :normalize_gender
  before_validation :normalize_contact_number

  private

  def normalize_gender
    self.gender = gender.downcase if gender.present?
  end

  def normalize_contact_number
    if contact_number.present?
      # Remove any non-digit characters except +, -, and spaces
      self.contact_number = contact_number.gsub(/[^\d+\s-]/, '')
      # Add country code if not present
      self.contact_number = "+254#{contact_number}" if contact_number.start_with?('0')
    end
  end

  def age
    return nil unless date_of_birth
    ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  end
end 