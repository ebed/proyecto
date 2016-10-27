class StatusordersController < ApplicationController
  before_action :set_statusorder, only: [:show, :edit, :update, :destroy]
  before_action :setMantenedores
  # GET /statusorders
  # GET /statusorders.json
  def index
    @statusorders = Statusorder.all
  end

  # GET /statusorders/1
  # GET /statusorders/1.json
  def show
  end

  # GET /statusorders/new
  def new
    @statusorder = Statusorder.new
  end

  # GET /statusorders/1/edit
  def edit
  end

  # POST /statusorders
  # POST /statusorders.json
  def create
    @statusorder = Statusorder.new(statusorder_params)

    respond_to do |format|
      if @statusorder.save
        format.html { redirect_to @statusorder, notice: 'Statusorder was successfully created.' }
        format.json { render :show, status: :created, location: @statusorder }
      else
        format.html { render :new }
        format.json { render json: @statusorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statusorders/1
  # PATCH/PUT /statusorders/1.json
  def update
    respond_to do |format|
      if @statusorder.update(statusorder_params)
        format.html { redirect_to statusorders_path, notice: 'Statusorder was successfully updated.' }
        format.json { render :show, status: :ok, location: @statusorder }
      else
        format.html { render :edit }
        format.json { render json: @statusorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statusorders/1
  # DELETE /statusorders/1.json
  def destroy
    @statusorder.destroy
    respond_to do |format|
      format.html { redirect_to statusorders_url, notice: 'Statusorder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statusorder
      @statusorder = Statusorder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statusorder_params
      params.require(:statusorder).permit(:value, :pending)
    end
end
