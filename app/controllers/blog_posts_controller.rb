class BlogPostsController < ApplicationController

before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

  def index
  	@blog_posts = BlogPost.all
  end

  def show
  	@comment = Comment.new
  end

  def new
  	@blog_post = BlogPost.new
  end

  def your_posts
  end

  def user_profile
    @user = User.find(params[:id])
  end

  def edit
    unless current_user.id == @blog_post.user.id
    redirect_to root_url
    end
  end

  def create
  	@blog_post = BlogPost.new(blog_post_params)

  	respond_to do |format|
  		if @blog_post.save
  			format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was made successfully."}
  		else
  			format.html {render :new}
  		end
  	end

  end

  def update

  	respond_to do |format|
  		if @blog_post.update(blog_post_params)
  			format.html { redirect_to blog_post_url(@blog_post), notice: "Blog post was updated successfully."}
  		else
  			format.html { render :edit}
  		end
  	end

  end

  def destroy
  	@blog_post.destroy

  	respond_to do |format|
  		format.html { redirect_to blog_posts_url, notice: "Your Blog post was Destroyed."}
  	end

  end

  private

  def set_blog_post
  	@blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
  	params.require(:blog_post).permit(:title, :blog_entry, :user_id)
  end


end
