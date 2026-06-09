class AttemptsController < ApplicationController
  before_action :require_login
  before_action :require_student

  def create
    @challenge = Challenge.find(params[:challenge_id])
    submitted = params.dig(:attempt, :submitted_answer).to_s.strip

    if submitted.blank?
      redirect_to @challenge, alert: "Answer cannot be empty."
      return
    end

    already_solved = current_user.solved?(@challenge)
    correct = Attempt.normalized(submitted) == @challenge.normalized_answer
    points_awarded = correct && !already_solved ? @challenge.points : 0

    current_user.attempts.create!(challenge: @challenge, submitted_answer: submitted, correct: correct, points_awarded: points_awarded)

    if points_awarded.positive?
      current_user.increment!(:points, points_awarded)
      current_user.update_level!
      current_user.award_badges!
      redirect_to @challenge, notice: "Correct answer. Points awarded: #{points_awarded}."
    elsif correct
      redirect_to @challenge, notice: "Correct answer. You already solved this challenge, so no extra points were awarded."
    else
      redirect_to @challenge, alert: "Incorrect answer. Review the hint and try again."
    end
  end
end
