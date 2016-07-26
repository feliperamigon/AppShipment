class ContainersController < ApplicationController
  before_action :set_container, only: [:show, :edit, :update, :destroy]
  def aproveRequest
    shipment = Shipment.find(params[:id]) 
    shipment.status = "Aprobado";
    shipment.save();
    redirect_to '#show'
  end
  def rejectRequest
    shipment = Shipment.find(params[:id])  
    shipment.status = "Rechazado";
    shipment.save();
    redirect_to '#show'
  end
  def reserve
    @container = Container.find(params[:id])
    @packages = current_user.packages
  end
  def reservation
    container = Container.find params[:id]
    package= Package.find params[:package_id]
    shipment =Shipment.create()
    shipment.status ="Pendiente"
    shipment.package=package
    shipment.container =container
    shipment.save()
    return shipment

  end
  # GET /containers
  # GET /containers.json
  def index

    @containers = Container.where user_id: current_user.id
  end

  # GET /containers/1
  # GET /containers/1.json
  def show
    @container = Container.find(params[:id])
    @shipments = Shipment.where container_id: @container.id
  end

  # GET /containers/new
  def new
    @container = Container.new
  end

  # GET /containers/1/edit
  def edit
  end

  # POST /containers
  # POST /containers.json
  def create
    @container = Container.new(container_params)
    current_user.containers<<@container

    respond_to do |format|
      if @container.save
        format.html { redirect_to @container, notice: 'Container was successfully created.' }
        format.json { render :show, status: :created, location: @container }
      else
        format.html { render :new }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /containers/1
  # PATCH/PUT /containers/1.json
  def update
    respond_to do |format|
      if @container.update(container_params)
        format.html { redirect_to @container, notice: 'Container was successfully updated.' }
        format.json { render :show, status: :ok, location: @container }
      else
        format.html { render :edit }
        format.json { render json: @container.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /containers/1
  # DELETE /containers/1.json
  def destroy
    @container.destroy
    respond_to do |format|
      format.html { redirect_to containers_url, notice: 'Container was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container
      @container = Container.find(params[:id])
    end
  def container_params 
    params[:container].permit(:title,:origin,:destiny,:shipping_day)
  end 
end
