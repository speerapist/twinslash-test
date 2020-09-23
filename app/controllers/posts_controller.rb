class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :set_post, only: %i[show edit update destroy status_new status_draft]

  def index
    @q = Post.ransack(params[:q])
    if params[:query]
      @posts = Post.where(status: 'published').search_by_title_and_content(params[:query]).order(id: :desc).page(params[:page]).per(10)
    else
      @posts = @q.result.where(status: 'published').order(id: :desc).page(params[:page]).per(10)
    end
  end

  def new
    @post = Post.new
  end

  def show; end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_posts_path, notice: 'Post created successfully'
    else
      flash.now[:alert] = 'Failed to create post'
      render :new
    end
  end

  def edit; end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: 'Post successfully deleted'
    else
      redirect_to posts_path, alert: 'Failed to delete post'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to request.referrer, notice: 'Post successfully edited'
    else
      flash.now[:alert] = 'Failed to edit post'
      render :edit
    end
  end

  def status_new
    @post.update_attributes status: 'new_post'
    redirect_to user_posts_posts_path, notice: 'Success! Post will be published after admin approval.'
  end

  def status_draft
    @post.update_attributes status: 'draft'
    redirect_to user_posts_posts_path, notice: 'Post was successfully converted to Draft Type.'
  end

  def user_posts
    @posts = current_user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end

  def user_archive
    @posts = current_user.posts.where(status: 'archived').order(created_at: :desc).page(params[:page]).per(10)
  end

  def delete_image
    @image = ActiveStorage::Attachment.find(params[:image_id])
    @image.purge
    redirect_to request.referrer, notice: 'Image deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :status, :post_type_id, images: [])
  end

  def set_post
    @post = Post.find(params[:id])
    @post = Post.with_attached_images.find(params[:id]) if @post.images.attached?
  end
end
