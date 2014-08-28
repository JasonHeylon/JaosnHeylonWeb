class StaticPagesController < ApplicationController
	layout 'full_page'

  def index

  end

  def about
  end

  def resume
  	render layout: 'resume_layout'
  end
end
