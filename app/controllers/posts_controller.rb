class PostsController < ApplicationController
before_action :set_post, only: [ :show, :edit, :update, :destroy]
rescue_from Pundit::NotAuthorizedError, :with => :unauthorized_error

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def show
    @comments = @post.comments
  end

  def create
    params[:commit] == 'Publish' ? published = true : published = false
    params[:post][:published] = published
    @post = current_user.posts.new(post_params)
    
    respond_to do |format|
      if @post.save
        @post.published == true ? notice = 'published' : notice = 'saved as draft'
        format.html { redirect_to posts_path, notice: 'Post was successfully ' + notice}
      else
        format.html { render action: 'new', notice: 'Error: Not able to save the new post'}
      end
    end
  end

  def edit
    authorize @post
  end 


  def update
    
    params[:commit] == 'Publish' ? published = true : published = false
    params[:post][:published] = published

    authorize @post
    
    if @post.update(post_params)
      @post.published == true ? notice = 'published' : notice = 'saved as draft'
      redirect_to @post, notice: 'Post was successfully ' + notice
    else
      render action: 'new', notice: 'Error: cannot able to save post'
    end

  end


  def draft_posts
    @drafts = current_user.posts.where(published: false)
  end

  def destroy
    authorize @post

    if @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def set_post
    @post = Post.find_by_id params[:id]
  end

  def unauthorized_error
    redirect_to posts_path, :alert => "You can't change this post!"
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :subtitle, :body, :published)
  end

end
