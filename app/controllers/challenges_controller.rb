class ChallengesController < ApplicationController
  before_action :require_login
  before_action :require_student

  def index
    @categories = Challenge::CATEGORIES
    @difficulties = Challenge::DIFFICULTIES
    @challenges = Challenge.order(:category, :difficulty, :title)
    @challenges = @challenges.where(category: params[:category]) if params[:category].present?
    @challenges = @challenges.where(difficulty: params[:difficulty]) if params[:difficulty].present?
  end

  def show
    @challenge = Challenge.find(params[:id])
    @attempt = Attempt.new
    @solved = @challenge.solved_by?(current_user)
  end
end
