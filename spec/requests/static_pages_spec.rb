require 'rails_helper'

describe "Static page request" do
	describe "home page" do
		it "should have content 'Jason Heylon' " do
			get root_path
			expect(response).to have_http_status(:success)
			expect(response.body).to have_content("Jason Heylon")
		end
		
	end
end

