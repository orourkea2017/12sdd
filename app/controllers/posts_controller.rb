class PostsController < ApplicationController
    def new
        @post = Post.new
        @title = "New Post // The Komplex"
    end

    def create
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to '/post/' + @post.id.to_s
        else
            redirect_to '/newpost'
        end
    end

    def show
        @post = Post.find(params[:id])
        @title = @post.title + " // The Komplex"
    end

    def showall
        @posts = Post.limit(20).reverse
        @title = "Your Feed // The Komplex"
    end
        
    private
        def post_params
            params.permit(:user_id, :posttype, :title, :extdata, :content, :tags)
        end

end
