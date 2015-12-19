class RemovePositionFromProjectAttachments < ActiveRecord::Migration
  def change
    remove_column :project_attachments, :position
  end
end
