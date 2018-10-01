class BlogsController < ApplicationController
    # before any blog action happens, it will authenticate the user
    before_action :authenticate_user!
    def index
      @user = current_user.email
      @blogs = Blog.all
    end
    #Other Restful methods show, new, edit, create, update, destroy
     
      # GET /posts/1
      def show
        @blog = Blog.find(params[:id])
      end
    
      # GET /posts/new
      def new
        @blog = Blog.new
      end
    
      # GET /posts/1/edit
      def edit
        @blog = Blog.find(params[:id])
      end
    
      # POST /posts
      def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        if @blog.save
          redirect_to "/"
        else
          render "/blogs/new"
        end
      end
    
      # PATCH/PUT /posts/1
      def update
        @blog = Blog.find(params[:id])
        @blog.update(blog_params)
        if @blog.save
          redirect_to "/"
        else
          render "/blogs/new"
        end
      end
    
      # DELETE /posts/1
      def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to "/"
      end
    
      private
        # Only allow white list through, never trust parameters from the internet.
        def blog_params
          params.require(:blog).permit(:title, :body, :user_id)
        end
    end
  