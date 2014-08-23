require 'rails_helper'

describe "Static pages" do
	describe "Home page" do
	  it "should have the content 'Jason Heylon'" do
	    visit root_path
	    expect(page).to have_selector('h1', text: "Jason Heylon")
	  end
	  it "should have the title 'Jason Heylon - Index'" do
	  	visit root_path
	  	expect(page).to have_title('Jason Heylon - Index')
	  end

	end

end
