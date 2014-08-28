class ArticlesController < ApplicationController

  before_action :admin_page, only: [:edit, :new, :destroy]

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
  		redirect_to named_article_path(@article.named_url)
  	else
  		if @article.errors.any?
	  		flash[:error_messages] = @article.errors.full_messages
  		end
  		render 'new'
  	end
  end

  def show
    # if params.include?(:id)
    #   @article = Article.find(params[:id])
    # else
    #   @article = Article.find_by(named_url: params[:name])
    # end
    redirect_to articles_path unless params.include?(:name)
    @article = Article.find_by(named_url: params[:name])

    unless signed_in?
      @article.read_count += 1
      @article.save
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
  	@article.update(article_param_for_create_update)
  	redirect_to named_article_path(@article.named_url)
  end

  def destroy
    Article.find(params[:id]).destroy

    redirect_to blog_path
  end


  private
    def article_param_for_create_update
    	params.require(:article).permit(:title, :body, :named_url)
    end


    def admin_page
      unless signed_in?
        redirect_to root_path
      end
    end

end
