class AddPositionToSliderImages < ActiveRecord::Migration
  def change
    add_column :slider_objects, :position, :integer
  end
end
