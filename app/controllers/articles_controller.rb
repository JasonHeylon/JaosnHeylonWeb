class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update, :destroy]
  before_action :admin_page, only: [:edit, :new, :destroy]
  before_action :add_read_number, only: :show

  layout 'application'

  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_param_for_create_update)
  	if @article.save
  		redirect_to @article
  	else
  		if @article.errors.any?
	  		flash[:error_messages] = @article.errors.full_messages
  		end
  		render 'new'
  	end
  end

  def show
    

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  	@article.update(article_param_for_create_update)
  	redirect_to blog_path
  end

  def destroy
    Article.find(params[:id]).destroy

    redirect_to blog_path
  end


  private
    def article_param_for_create_update
    	params.require(:article).permit(:title, :body)
    end

    def set_article
    	
    end

    def add_read_number
      @article = Article.find(params[:id])
      @article.read_count += 1
      @article.save
      
    end

    def admin_page
      unless signed_in?
        redirect_to root_path
      end
    end

end
