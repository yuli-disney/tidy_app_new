class PostController < ApplicationController
  def index
    @current_user = User.find_by(id: session[:user_id])
    if @current_user
      @options = Select.all
      @options = @options.where(userid: @current_user.id)
      @posts = Post.all.order(created_at: :desc)
      @posts = @posts.where(user_id: @current_user.id)
    else
      redirect_to("/posts/login")
    end
      
  end

  def create
    @current_user = User.find_by(id: session[:user_id])
    @post=Post.new(id:params[:id],title: params[:title], url: params[:url], select: params[:select], user_id: @current_user.id)
    @post.save
    redirect_to("/")
  end

  def option_create
    @current_user = User.find_by(id: session[:user_id])
    @select = Select.new(genre:params[:genre],userid:@current_user.id)
    @select.save
    redirect_to("/")
  end

  def login
    @error_message
  end

  def newuser
        
  end

  
  def edit
    @options = Select.all
    @current_user = User.find_by(id: session[:user_id])
    @options = @options.where(userid: @current_user.id)
    @post = Post.find_by(id:params[:id])
  end

  def destroy
    begin
      @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to("/")
    rescue
      redirect_to ("/")
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title= params[:title]
    @post.select=params[:select]
    @post.url= params[:url]
    if @post.save
    redirect_to("/")
    else
      redirect_to("/posts/#{@post.id}")
    end
  end

  def each_option
    @options = Select.all
    @current_user = User.find_by(id: session[:user_id])
    @options = @options.where(userid: @current_user.id)
    @option = Select.find_by(id:params[:id])
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: @option.genre)
    @posts = @posts.where(user_id: @current_user.id)
  end

  def save
    @options = Select.all
    @current_user = User.find_by(id: session[:user_id])
    @options = @options.where(userid: @current_user.id)
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "とっておきたいページ")
    @posts = @posts.where(user_id: @current_user.id)
  end

  def often
    @options = Select.all
    @current_user = User.find_by(id: session[:user_id])
    @options = @options.where(userid: @current_user.id)
    @posts = Post.all.order(created_at: :desc)
    @posts = @posts.where(select: "よく見るページ")
    @posts = @posts.where(user_id: @current_user.id)
  end

  def destroyoption
    begin
      @option = Select.find_by(id: params[:id])
      @option.destroy
      redirect_to("/")
    rescue
      redirect_to ("/")
    end
  end
end
