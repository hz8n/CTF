module Admin
  class DashboardController < ApplicationController
    before_action :require_login
    before_action :require_admin

    def index
      @total_users = User.count
      @total_challenges = Challenge.count
      @total_attempts = Attempt.count
      @solved_count = Attempt.correct.count
      @most_solved = Challenge.left_joins(:attempts).where(attempts: { correct: true }).group("challenges.id").order("COUNT(attempts.id) DESC").limit(5).count("attempts.id")
      @hardest = Challenge.left_joins(:attempts).where(attempts: { correct: false }).group("challenges.id").order("COUNT(attempts.id) DESC").limit(5).count("attempts.id")
    end
  end
end
