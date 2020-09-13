class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :status_new, :status_draft]

  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if@post.save
      redirect_to user_posts_posts_path, notice: "Post created successfully"
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

  def status_new
    @post.update_attributes status: 1
    redirect_to user_posts_posts_path, notice: "Success! Post will be published after admin approval."
  end

  def status_draft
    @post.update_attributes status: 0
    redirect_to user_posts_posts_path, notice: "Post was successfully converted to Draft Type."
  end

  def user_posts
    @posts = Post.where("user_id = ?", "#{current_user.id}").order(id: :desc).page(params[:page]).per(10)
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
