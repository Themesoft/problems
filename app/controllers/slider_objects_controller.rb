class SliderObjectsController < ApplicationController
  before_action :set_slider_object, only: [:show, :edit, :update, :destroy]

  # GET /slider_objects
  # GET /slider_objects.json
  def index
    @slider_objects = SliderObject.all
  end

  # GET /slider_objects/1
  # GET /slider_objects/1.json
  def show
  end

  # GET /slider_objects/new
  def new
    @slider_object = SliderObject.new
  end

  # GET /slider_objects/1/edit
  def edit
  end

  # POST /slider_objects
  # POST /slider_objects.json
  def create
    @slider_object = SliderObject.new(slider_object_params)

    respond_to do |format|
      if @slider_object.save
        format.html { redirect_to @slider_object, notice: 'Slider object was successfully created.' }
        format.json { render :show, status: :created, location: @slider_object }
      else
        format.html { render :new }
        format.json { render json: @slider_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slider_objects/1
  # PATCH/PUT /slider_objects/1.json
  def update
    respond_to do |format|
      if @slider_object.update(slider_object_params)
        format.html { redirect_to @slider_object, notice: 'Slider object was successfully updated.' }
        format.json { render :show, status: :ok, location: @slider_object }
      else
        format.html { render :edit }
        format.json { render json: @slider_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slider_objects/1
  # DELETE /slider_objects/1.json
  def destroy
    @slider_object.destroy
    respond_to do |format|
      format.html { redirect_to slider_objects_url, notice: 'Slider object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider_object
      @slider_object = SliderObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_object_params
      params[:slider_object]
    end
end
