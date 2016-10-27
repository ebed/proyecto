class TipobannersController < ApplicationController
  before_action :set_tipobanner, only: [:show, :edit, :update, :destroy]
  before_action :setMantenedores
  # GET /tipobanners
  # GET /tipobanners.json
  def index
    @tipobanners = Tipobanner.all

  end

  # GET /tipobanners/1
  # GET /tipobanners/1.json
  def show
  end

  # GET /tipobanners/new
  def new
    @tipobanner = Tipobanner.new
  end

  # GET /tipobanners/1/edit
  def edit
  end

  # POST /tipobanners
  # POST /tipobanners.json
  def create
    @tipobanner = Tipobanner.new(tipobanner_params)

    respond_to do |format|
      if @tipobanner.save
        format.html { redirect_to @tipobanner, notice: 'Tipobanner was successfully created.' }
        format.json { render :show, status: :created, location: @tipobanner }
      else
        format.html { render :new }
        format.json { render json: @tipobanner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipobanners/1
  # PATCH/PUT /tipobanners/1.json
  def update
    respond_to do |format|
      if @tipobanner.update(tipobanner_params)
        format.html { redirect_to @tipobanner, notice: 'Tipobanner was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipobanner }
      else
        format.html { render :edit }
        format.json { render json: @tipobanner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipobanners/1
  # DELETE /tipobanners/1.json
  def destroy
    @tipobanner.destroy
    respond_to do |format|
      format.html { redirect_to tipobanners_url, notice: 'Tipobanner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipobanner
      @tipobanner = Tipobanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipobanner_params
      params.require(:tipobanner).permit(:name)
    end
end
