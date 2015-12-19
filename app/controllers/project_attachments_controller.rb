class ProjectAttachmentsController < ApplicationController
  before_action :set_project_attachment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @project_attachments = ProjectAttachment.all
    respond_with(@project_attachments)
  end

  def show
    respond_with(@project_attachment)
  end

  def new
    @project_attachment = ProjectAttachment.new
    respond_with(@project_attachment)
  end

  def edit
  end

  def create
    @project_attachment = ProjectAttachment.new(project_attachment_params)
    @project_attachment.save
    respond_with(@project_attachment)
  end

  def update
    @project_attachment.update(project_attachment_params)
    respond_with(@project_attachment)
  end

  def destroy
    @project_attachment.destroy
    respond_with(@project_attachment)
  end

  private
    def set_project_attachment
      @project_attachment = ProjectAttachment.find(params[:id])
    end

    def project_attachment_params
      params.require(:project_attachment).permit(:project_id, :resource, :resource_type, :project_attachment_type_id, :_destroy, :title)
    end
end
