require_dependency "faalis/application_controller"

module Faalis::ContactUs
  class PostsController < ::ApplicationController

    layout Engine.default_layout

    def index
      @messages = Message.ordered
      @messages = @messages.page(params[:page]).per(5)
    end

    def show
      messages = Message

      puts "<<<<<<<<<< " * 100, SiteFramework.current_site.id
      @message = messages.find_by(permalink: params[:permalink])
      return

      if user_signed_in?
        @message = messages.find_by(permalink: params[:permalink])
      end

      # TODO: redirect to 404 page or show a message indicating
      # that the post you're looking for does not exists
    end

    def create
      @message = Message.new(params[:id])

      respond to do |format|
        if @message.save
          format.json { render :show, status: :created  }
        else
          format.json { render @message.errors, status: :unprocessable_entity}
        end
     end

    end

  end
end
