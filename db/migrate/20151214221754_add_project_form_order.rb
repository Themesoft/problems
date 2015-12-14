class AddProjectFormOrder < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      # string of numebrs representing the order of the content blocks
      # There are 5 of them (assigned 0-4)
      t.string :feature_order
    end
  end
end
