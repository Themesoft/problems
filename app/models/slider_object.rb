class SliderObject < ActiveRecord::Base
  mount_uploader :resource, ResourceUploader

  belongs_to :project
  before_save :default_name

  def default_name
    self.file_name = File.basename(resource.file.path, '.*').gsub("_", " ")
  end

  def mark_for_removal
    unless resource
      mark_for_destruction
    end
  end

end
