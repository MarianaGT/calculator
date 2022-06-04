class AddBreadColumnsToCuestionarios < ActiveRecord::Migration[6.1]
  def change
    add_column :cuestionarios, :mantecadas, :boolean
    add_column :cuestionarios, :pan_blanco, :boolean
  end
end
