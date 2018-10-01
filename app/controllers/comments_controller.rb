class CommentsController < ApplicationController
  
  # before any blog action happens, it will authenticate the user
  before_action :authenticate_user!
  def index
    @user = current_user.email
    @comments = Comment.all
  end
  #Other Restful methods show, new, edit, create, update, destroy
   
    # GET /posts/1
    def show
      @comment = Comment.find(params[:id])
    end
  
    # GET /posts/new
    def new
      @comment = Comment.new
    end
  
    # GET /posts/1/edit
    def edit
      @comment = Comment.find(params[:id])
    end
  
    # POST /posts
    def create
      @blog = Blog.find(params[:blog_id])
      @comment = current_user.comments.new(comment_params)
      @comment.blog = @blog
      if @comment.save
        redirect_to "/"
      else
        render "/blogs/new"
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      @comment = Comment.find(params[:id])
      @comment.update(comment_params)
      if @comment.save
        redirect_to "/"
      else
        render "/blogs/new"
      end
    end
  
    # DELETE /posts/1
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to "/"
    end
  
    private
      # Only allow white list through, never trust parameters from the internet.
      def comment_params
        params.require(:comment).permit(:content, :user_id, :blog_id)
      end
  end
