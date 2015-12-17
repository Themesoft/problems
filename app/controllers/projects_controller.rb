class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @feature_order = (@project.feature_order || "0123").chars.map do |id|
      partial_from_id(id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @project_attachment = @project.project_attachments.build
    @types = Type.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @edit = true
    @project = Project.includes(:project_attachments).find(params[:id])
    @project_attachment = @project.project_attachments.build
  end

  # POST /projects
  # POST /projects.json
  def create

    # Update params for position
    project_attachments_attr = params[:project][:project_attachments_attributes]

    puts "-------------"
    puts project_attachments_attr
    puts "-------------"

    project_attachments_attr.each_with_index do |att_index, index|
      att_index[1][:position] = index
      puts "INDEX:::: #{att_index[1][:position].inspect}"
    end

    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        if params[:project_attachments]
          create_attachments
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupon_codes/1
  # PATCH/PUT /coupon_codes/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(project_params)
        if params[:project_attachments]
          create_attachments
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupon_codes/1
  # DELETE /coupon_codes/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to project_url }
      format.json { head :no_content }
    end
  end

  private
    def create_attachments
      params[:project_attachments_attributes].each do |project_attachment_attributes|
        @project_attachment = @project.project_attachments.create!(
                                    :resource => project_attachment_attributes[:resource],
                                    :project_attachment_type_id => project_attachment_attributes[:project_attachment_type_id].to_i,
                                    :project_id => @project.id)
      end
    end

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def project_params
      params.require(:project).permit(:name, :status, :user_id, :content, :type_id, :why, :duration, :launch_method, :teacher_moves, :solution,  :problem_statement, :author_name, :author_link, {tag_ids: []}, {standard_ids: []}, :history, :pathways, :extensions, :hints, :featured_image, :remove_featured_image, :featured_image_cache,
      {project_attachments_attributes: [:project_attachment_type_id, :resource, :_delete, :id, :title, :position]})
    end

    def partial_from_id (id)
      return case id
        when "0"
          "show_important"
        when "1"
          "show_details"
        when "2"
          "show_extra"
        when "3"
          "show_slider"
        else
          "show_important"
    end
  end
end
