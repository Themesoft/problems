class ModifyProjectOrder < ActiveRecord::Migration
  def change
    add_column :projects, :details_order, :string
    add_column :projects, :other_order, :string
  end
end
