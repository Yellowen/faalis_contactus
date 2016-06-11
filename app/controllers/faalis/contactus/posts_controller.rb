require_dependency "faalis/application_controller"

module Faalis::Blog
  class PostsController < ::ApplicationController

    layout Engine.default_layout

    def index
      @posts = Post.published.ordered
      @posts = @posts.where(members_only: false) unless user_signed_in?
      @posts = @posts.page(params[:page]).per(5)
    end

    def show
      posts = Post.published

      puts "<<<<<<<<<< " * 100, SiteFramework.current_site.id
      @post = posts.find_by(permalink: params[:permalink])
      return

      if user_signed_in?
        @post = posts.find_by(permalink: params[:permalink])

      else
        @post = posts.where(members_only: false) \
                .find_by(permalink: params[:permalink])
      end

      # TODO: redirect to 404 page or show a message indicating
      # that the post you're looking for does not exists
      @comments = @post.comments.punlished.ordered
    end

    def create
      @comment = commentable.comments.create

    end

  end
end
