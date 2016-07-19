class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :show, :destroy]
  def index
    @comentarios = Comment.all
  end


  def edit

  end

  def update
    @comment.update(comment_params)
     redirect_to comments_path
  end

  def destroy
    @comment.destroy
     redirect_to comments_path
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = "Se creo correctamente"
    end

 redirect_to comments_path
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :user_id, :product_id)
  end

end
