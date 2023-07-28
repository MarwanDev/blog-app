class Api::V1::CommentsController < ApplicationController
    skip_before_action :authenticate_user!
    protect_from_forgery with: :null_session
  
    # GET /comments or /comments.json
    def index
      @post = Post.find(params[:post_id])
      @comments = @post.comments
      respond_to do |format|
        if @comments
          format.json { render json: @comments, status: 200 }
        else
          format.json { render json: @comments.errors, status: 400 }
        end
      end
    end
  
    def create
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
      @comments = @post.comments.new(comment_params)
      @comments.post_id = @post.id
      @comments.author_id = @user.id
  
      respond_to do |format|
        if @comments.save
          format.json { render json: @comments, status: 200 }
        else
          format.json { render json: @comments.errors, status: 400 }
        end
      end
    end
  
    # PATCH/PUT /comments/1 or /comments/1.json
    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to comment_url(@comment), notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text, :created_at, :updated_at)
    end
  end
  