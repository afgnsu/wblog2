class Admin::PostsController < ApplicationController
  layout 'layouts/admin'
  before_action :authericate_user!

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find( params[:id] )
  end

  def destroy
    @post = Post.find( params[:id] )
    if @post.destroy
      flash[:notice] = '刪除日誌成功！'
      redirect_to admin_posts_path
    else
      flash[:error] = '刪除日誌失敗！'
      redirect_to admin_posts_path
    end
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end

  def create
    labels = params.delete(:labels).to_s
    #@post = Post.new( params.permit(:title, :content, :type) )
    @post = Post.new(params.permit(:title, :content, :type))
  #  params.require(:post).permit(:title, :content)
    #@post = Post.new(post_params)
    initialize_or_create_labels(labels)

    if @post.save
      flash[:notice] = '新增日誌成功！'
      redirect_to admin_posts_path
    else
      flash.now[:error] = '新增日誌失敗！'
      render :new
    end
  end

  def update
    @post = Post.find( params[:id] )

    labels = params.delete(:labels).to_s
    initialize_or_create_labels(labels)

    if @post.update( params.permit(:title, :content, :type) )
    #if @post.update_attributes(post_params)
      flash[:notice] = '更新日誌成功！'
      redirect_to admin_posts_path
    else
      flash[:error] = '更新日誌失敗！'
      render :edit
    end
  end

  def preview
    render plain: Post.render_html(params[:content] || "")
  end

private

  #def post_params
  #  params.require(:post).permit(:title, :content)
  #end

  def initialize_or_create_labels(labels)
    @post.labels = []
    labels.split(",").map { |i| i.strip }.uniq.each do |name|
      label = Label.find_or_initialize_by(name: name.strip)
      label.save!
      @post.labels << label
    end
  end

end
