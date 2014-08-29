class TagsController < ApplicationController
  def show
  	@tag = params[:name]
  	@articles = Article.tagged_with(@tag)
  end
end
