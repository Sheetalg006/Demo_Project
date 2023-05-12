class ChangePricetypeToCourses < ActiveRecord::Migration[7.0]
  def change
    change_column :courses, :price, :integer
  end
end
