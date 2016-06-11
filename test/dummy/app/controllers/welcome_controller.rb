class WelcomeController < ApplicationController
  def index
    puts "(" * 100, view_paths
    puts "*" * 100, Rails.application.config.assets
  end
end
