class AddResourceToSliderObject < ActiveRecord::Migration
  def change
    add_column :slider_objects, :resource, :string
  end
end
