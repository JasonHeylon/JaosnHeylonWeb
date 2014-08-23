class User < ActiveRecord::Base

	attr_accessor :old_password

	before_save { email.downcase! }	#self.email = email.downcase

	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 50, minmum: 4 }
	validates :email, presence: true, uniqueness: { case_sensitive: true }, 
						length: { maximum: 60 }
	validates :password, length: { minimum: 6 }



	has_secure_password



	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.hash(token)
		Digest::SHA1.hexdigest(token)
	end



	private
		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end


end
