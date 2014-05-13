class Comment < ActiveRecord::Base
  belongs_to :user #A comment belongs to a user
  belongs_to :post #A comment belongs to a post

  validates :content, presence: :true
end
