class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  def show

  end

  def index
    @scores = Score.all
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.create(score_params)
    if @score.save
      flash[:notice] = "Se a creado correctamente"
    else
      flash[:alert] = "Falló la creación"
    end
    redirect_to scores_path

  end


  def edit

  end

  def update
    @score.update(score_params)
    redirect_to scores_path
  end

  def destroy
    @score.destroy
     redirect_to scores_path

  end


  private
  def set_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:id, :value, :user_id, :product_id)
  end

end
