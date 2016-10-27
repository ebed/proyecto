class ContactypesController < ApplicationController
  before_action :set_contactype, only: [:show, :edit, :update, :destroy]
before_action :setMantenedores
  # GET /contactypes
  # GET /contactypes.json
  def index
    @contactypes = Contactype.all.order(:name)
  end

  # GET /contactypes/1
  # GET /contactypes/1.json
  def show
  end

  # GET /contactypes/new
  def new
    @contactype = Contactype.new
  end

  # GET /contactypes/1/edit
  def edit
  end

  # POST /contactypes
  # POST /contactypes.json
  def create
    @contactype = Contactype.new(contactype_params)

    respond_to do |format|
      if @contactype.save
        format.html { redirect_to contactypes_path, notice: 'Contactype was successfully created.' }
        format.json { render :show, status: :created, location: @contactype }
      else
        format.html { render :new }
        format.json { render json: @contactype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactypes/1
  # PATCH/PUT /contactypes/1.json
  def update
    respond_to do |format|
      if @contactype.update(contactype_params)
        format.html { redirect_to contactypes_path, notice: 'Contactype was successfully updated.' }
        format.json { render :show, status: :ok, location: @contactype }
      else
        format.html { render :edit }
        format.json { render json: @contactype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactypes/1
  # DELETE /contactypes/1.json
  def destroy
    @contactype.destroy
    respond_to do |format|
      format.html { redirect_to contactypes_url, notice: 'Contactype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contactype
      @contactype = Contactype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contactype_params
      params.require(:contactype).permit(:name)
    end
end
