class CommentsController < ApplicationController

  before_filter :load_post #find the post that the comment belongs to before each of these methods run

  def index
    @comments = @post.comments.all #Retrieve all of the comments for the post, can add .order(:amount) by descending
  end

  def new
    @comment = @post.comments.new #Make an empty new comment for the post that will be passed along to the form
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def create
    @comment = @post.comments.create(comment_params) #Create a new comment for this post and call the comment_params method for the params
    if @comment.save #If the comment saves to the database
      redirect_to post_comments_path(@post) #Redirect to the post's comment's index
    end
  end

  private #Only self can use these methods. Note that for protected, both self and is_a?(self) can use these methods
          #is_a?(self) returns true if it has a class self or if it is a subclass of self
    def load_post
      @post = Post.find(params[:post_id]) #Find the post that the comment belongs to
    end

    def comment_params
      params.require(:comment).permit(:content) #Require that the params hash contains a bid, permit the amount attribute
    end

end
