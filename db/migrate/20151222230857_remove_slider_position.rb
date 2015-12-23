class RemoveSliderPosition < ActiveRecord::Migration
  def change
    remove_column :slider_objects, :position
  end
end
