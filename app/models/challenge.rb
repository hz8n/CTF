class Challenge < ApplicationRecord
  has_many :attempts, dependent: :destroy
  has_many :users, through: :attempts

  CATEGORIES = ["Log Analysis", "Phishing Awareness", "Password Security", "Basic Cryptography", "Security Misconfiguration", "Cybersecurity Quiz"].freeze
  DIFFICULTIES = %w[Easy Medium Hard].freeze

  validates :title, :description, :category, :difficulty, :answer, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :difficulty, inclusion: { in: DIFFICULTIES }
  validates :points, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 500 }

  def normalized_answer
    answer.to_s.strip.downcase
  end

  def solved_by?(user)
    return false unless user
    attempts.exists?(user: user, correct: true)
  end
end
