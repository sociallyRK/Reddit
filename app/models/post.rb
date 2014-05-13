class Post < ActiveRecord::Base
  belongs_to :user #A Post belongs to a user
  has_many :comments #A Post has many comments
  accepts_nested_attributes_for :comments # Save a comment through a post

  validates :title, presence: :true
  validates :link, presence: :true
end