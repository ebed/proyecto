class DeliveryCompaniesController < ApplicationController
  before_action :set_delivery_company, only: [:show, :edit, :update, :destroy]
  before_action :setMantenedores
  # GET /delivery_companies
  # GET /delivery_companies.json
  def index
    @delivery_companies = DeliveryCompany.all
  end

  # GET /delivery_companies/1
  # GET /delivery_companies/1.json
  def show
    @address=@delivery_company.address
  end

  # GET /delivery_companies/new
  def new
    @delivery_company = DeliveryCompany.new
    @address=Address.new
  end

  # GET /delivery_companies/1/edit
  def edit
    @address = @delivery_company.address
  end

  # POST /delivery_companies
  # POST /delivery_companies.json
  def create
    @delivery_company = DeliveryCompany.new(delivery_company_params)

    respond_to do |format|
      if @delivery_company.save
        address =Address.create(address_params)
        @delivery_company.address= address
        @delivery_company.save
        format.html { redirect_to @delivery_company, notice: 'Delivery company was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_company }
      else
        format.html { render :new }
        format.json { render json: @delivery_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_companies/1
  # PATCH/PUT /delivery_companies/1.json
  def update
    respond_to do |format|
      if @delivery_company.update(delivery_company_params)
        format.html { redirect_to @delivery_company, notice: 'Delivery company was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_company }
      else
        format.html { render :edit }
        format.json { render json: @delivery_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_companies/1
  # DELETE /delivery_companies/1.json
  def destroy
    @delivery_company.destroy
    respond_to do |format|
      format.html { redirect_to delivery_companies_url, notice: 'Delivery company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_company
      @delivery_company = DeliveryCompany.find(params[:id])
    end
    def address_params
      params.require(:address).permit(:calle, :numero, :detalle, :comuna, :ciudad, :pais, :location_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_company_params
      params.require(:delivery_company).permit(:nombre, :address_id, :telefono)
    end
end
