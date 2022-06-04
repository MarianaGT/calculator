class ChangeColumnFromDecimalToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :cuestionarios, :actividad_fisica, :integer
  end
end
