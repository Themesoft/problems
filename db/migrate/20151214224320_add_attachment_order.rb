class AddAttachmentOrder < ActiveRecord::Migration
  def change
    change_table :project_attachments do |t|
      t.integer :position
    end
  end
end
