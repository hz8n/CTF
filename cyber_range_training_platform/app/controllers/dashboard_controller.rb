class DashboardController < ApplicationController
  before_action :require_login
  before_action :require_student

  def index
    @solved_count = current_user.solved_challenges.count
    @recent_attempts = current_user.attempts.includes(:challenge).order(created_at: :desc).limit(5)
    @badges = current_user.badges
  end
end
