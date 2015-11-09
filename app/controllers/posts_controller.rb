class PostsController < ApplicationController
  
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
   @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'new' 
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
      flash[:success] = "Post updated!"
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_url
    flash[:danger] = "Post deleted!"
  end

  def index
    @posts = Post.all
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
