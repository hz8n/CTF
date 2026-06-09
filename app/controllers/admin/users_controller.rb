module Admin
  class UsersController < ApplicationController
    before_action :require_login
    before_action :require_admin

    def index
      @users = User.order(points: :desc, name: :asc)
    end

    def show
      @user = User.find(params[:id])
      @attempts = @user.attempts.includes(:challenge).order(created_at: :desc)
    end
  end
end
