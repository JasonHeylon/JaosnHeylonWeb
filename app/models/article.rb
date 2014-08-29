class Article < ActiveRecord::Base

	has_many :comments

	acts_as_taggable
	ActsAsTaggableOn.remove_unused_tags = true


	validates :title, presence: true
	validates :body, presence: true
	validates :named_url, presence: true, uniqueness: true


	default_scope -> { order("created_at DESC") }





end
