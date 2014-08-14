class Comment < ActiveRecord::Base
  belongs_to :article

  validates :email, presence: :true
  validates :content, presence: :true
  validates :commenter, presence: :true

  def reply_to_comment
  	Comment.find_by(self.reply_to_id) if self.reply_to_id
  end


  def destroy
  	
  end

end
