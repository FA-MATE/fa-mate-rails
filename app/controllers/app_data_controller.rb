class AppDataController < ApplicationController
  # GET /app_data
  def index
    @app_data = AppData.new.app_data
  end
end
