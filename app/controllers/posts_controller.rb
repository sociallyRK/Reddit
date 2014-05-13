class PostsController < ApplicationController

  def index
    @posts = Post.all #Retrieve all of the posts from the database and assign them to the variable @posts
  end

  def up_vote
    @post = Post.find(params[:id])
    @post.upvotes = @post.upvotes + 1
    @post.save
    redirect_to post_comments_path(@post)
  end

  def down_vote
    @post = Post.find(params[:id])
    @post.downvotes = @post.downvotes + 1
    @post.save
    redirect_to post_comments_path(@post)
  end
  
  def new
    @post = Post.new #Make a new empty post and assign it to the variable @post
  end

  def create #Can place a binding.pry on the create method's first line to inspect the params passed through
    @post = Post.create(post_params) #Create a new post and call the post_params method
    @post[:user_id] = current_user.id
    if @post.save #If the post saves to the database
      redirect_to post_comments_path(@post) #Redirect to the post's comments' index page
    end
  end

  private #Only self can use this method
  
    def post_params
      params.require(:post).permit(:title, :link, :user_id)
    end

end