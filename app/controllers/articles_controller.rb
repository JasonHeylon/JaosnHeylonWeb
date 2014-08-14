class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit, :update]
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
    @article = Article.includes(:comments).find(params[:id])
  end

  def edit
  end

  def update
  	@article.update(article_param_for_create_update)
  	redirect_to blog_path
  end


  private
    def article_param_for_create_update
    	params.require(:article).permit(:title, :body)
    end

    def set_article
    	@article = Article.find(params[:id])
    end
    def add_read_number
      # @article.read_count +=1
      # @article.save
      
    end

end
