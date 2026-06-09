module Admin
  class ReportsController < ApplicationController
    before_action :require_login
    before_action :require_admin

    def index
      @students = User.where(role: "student").includes(:attempts)
    end
  end
end
