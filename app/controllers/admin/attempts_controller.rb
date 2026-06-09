module Admin
  class AttemptsController < ApplicationController
    before_action :require_login
    before_action :require_admin

    def index
      @attempts = Attempt.includes(:user, :challenge).order(created_at: :desc)
    end
  end
end
