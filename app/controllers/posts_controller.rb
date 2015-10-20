class PostsController < ApplicationController
  
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
    else
      
      render 'edit'
    end
  end

  def show
  end

  def destroy

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
