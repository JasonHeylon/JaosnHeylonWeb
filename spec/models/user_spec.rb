require 'rails_helper'

RSpec.describe User, :type => :model do


	before do
	  @user = User.new(name: "Jason Heylon",
	  				   email: "jasonheylon@gmail.com",
	  				   password: "foobar",
	  				   password_confirmation: "foobar")
	end
	subject { @user }


	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }


	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should be_valid }


	describe "invalid situations" do

		describe "without the name " do
			before { @user.name = " " }
			it { should_not be_valid }
		end
		describe "without email" do
			before { @user.email= " " }
			it { should_not be_valid }
		end

		describe "without password" do
			before do
				@user.password = " " 
				@user.password_confirmation = " "
			end
			it { should_not be_valid }

			describe "password doesn't match" do
				before do
					@user.password = "password"
					@user.password_confirmation = "doesnt_match"
				end
				it { should_not be_valid }
			end	
		end

	end





end
