class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if@post.save
      redirect_to posts_path, notice: "Post created successfully"
    else
      flash.now[:alert] = 'Failed to create post'
      render :new
    end
  end

  def edit
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: "Post successfully deleted"
    else
      redirect_to posts_path, alert: "Failed to delete post"
    end
  end

  def update
    if@post.update(post_params)
      redirect_to posts_path, notice: "Post successfully edited"
    else
      flash.now[:alert] = 'Failed to edit post'
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
