class PagesController < ApplicationController

  before_action :get_posts, only: [:home, :explore]

  def index
  end

  def home
    @newPost = Post.new
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found!"
    end
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
  end

  def explore
  end

  private
  def get_posts
    @posts = Post.all
  end

end
