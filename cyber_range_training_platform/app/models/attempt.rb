class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  scope :correct, -> { where(correct: true) }
  scope :failed, -> { where(correct: false) }

  validates :submitted_answer, presence: true
  validates :points_awarded, numericality: { greater_than_or_equal_to: 0 }

  before_validation :strip_answer

  def self.normalized(value)
    value.to_s.strip.downcase
  end

  private

  def strip_answer
    self.submitted_answer = submitted_answer.to_s.strip
  end
end
