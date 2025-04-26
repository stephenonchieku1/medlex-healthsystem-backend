class Client < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :health_programs, through: :enrollments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true, inclusion: { in: %w[male female other] }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\+?[\d\s-]+\z/ }

  def age
    return nil unless date_of_birth
    ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor
  end
end 