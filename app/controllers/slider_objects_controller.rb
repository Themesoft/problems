class SliderObjectsController < ApplicationController
  before_action :set_slider_object, only: [:show, :edit, :update, :destroy]

  respond_to :html
  # GET /slider_objects
  # GET /slider_objects.json
  def index
    @slider_objects = SliderObject.all
    respond_with(@slider_objects)
  end

  # GET /slider_objects/1
  # GET /slider_objects/1.json
  def show
    respond_with(@slider_object)
  end

  # GET /slider_objects/new
  def new
    @slider_object = SliderObject.new
    respond_with(@slider_object)
  end

  # GET /slider_objects/1/edit
  def edit
  end

  # POST /slider_objects
  # POST /slider_objects.json
  def create
    @slider_object = SliderObject.new(slider_object_params)
    @slider_object.save
    respond_with(@slider_object)
  end

  # PATCH/PUT /slider_objects/1
  # PATCH/PUT /slider_objects/1.json
  def update
    @slider_object.update(slider_object_params)
    respond_with(@slider_object)
  end

  # DELETE /slider_objects/1
  # DELETE /slider_objects/1.json
  def destroy
    @slider_object.destroy
    respond_with(@slider_object)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider_object
      @slider_object = SliderObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slider_object_params
      params.require(:slider_object).permit(:project_id, :description, :file_name, :resource, :position)
    end
end
