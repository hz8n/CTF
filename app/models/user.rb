class User < ApplicationRecord
  has_secure_password
  has_many :attempts, dependent: :destroy
  has_many :challenges, through: :attempts
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  ROLES = %w[student admin].freeze

  before_validation :normalize_email

  validates :name, presence: true, length: { maximum: 80 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, inclusion: { in: ROLES }
  validates :points, numericality: { greater_than_or_equal_to: 0 }

  def admin? = role == "admin"
  def student? = role == "student"

  def solved_challenges
    Challenge.joins(:attempts).where(attempts: { user_id: id, correct: true }).distinct
  end

  def solved?(challenge)
    attempts.exists?(challenge: challenge, correct: true)
  end

  def update_level!
    new_level = case points
                when 0..100 then "Beginner"
                when 101..250 then "Junior"
                when 251..500 then "Intermediate"
                else "Advanced"
                end
    update!(level: new_level)
  end

  def award_badges!
    award_badge("First Solve") if attempts.correct.exists?
    award_badge("Cyber Starter") if points >= 100
    log_solved_count = solved_challenges.where(category: "Log Analysis").count
    award_badge("Log Analyst") if log_solved_count >= 3
  end

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end

  def award_badge(name)
    badge = Badge.find_by(name: name)
    user_badges.find_or_create_by!(badge: badge) if badge
  end
end
