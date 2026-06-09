module Admin
  class ChallengesController < ApplicationController
    before_action :require_login
    before_action :require_admin
    before_action :set_challenge, only: %i[show edit update destroy]

    def index
      @challenges = Challenge.order(created_at: :desc)
    end

    def show; end

    def new
      @challenge = Challenge.new
    end

    def create
      @challenge = Challenge.new(challenge_params)
      if @challenge.save
        redirect_to admin_challenges_path, notice: "Challenge created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @challenge.update(challenge_params)
        redirect_to admin_challenges_path, notice: "Challenge updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @challenge.destroy
      redirect_to admin_challenges_path, notice: "Challenge deleted successfully."
    end

    private

    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    def challenge_params
      params.require(:challenge).permit(:title, :description, :category, :difficulty, :points, :answer, :hint)
    end
  end
end
