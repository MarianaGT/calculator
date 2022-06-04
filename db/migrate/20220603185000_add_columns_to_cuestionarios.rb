class AddColumnsToCuestionarios < ActiveRecord::Migration[6.1]
  def change
    add_column :cuestionarios, :necesidad_orinar, :boolean
    add_column :cuestionarios, :perdida_peso, :boolean
    add_column :cuestionarios, :sed_excesiva, :boolean
    add_column :cuestionarios, :hambre_excesiva, :boolean
    add_column :cuestionarios, :al_pastor, :boolean
    add_column :cuestionarios, :suadero, :boolean
    add_column :cuestionarios, :guisados, :boolean
    add_column :cuestionarios, :galletas_saladas, :boolean
    add_column :cuestionarios, :galletas_dulces, :boolean
    add_column :cuestionarios, :jamon_pavo, :boolean
    add_column :cuestionarios, :jamon_puerco, :boolean
    add_column :cuestionarios, :salchicha_pavo, :boolean
    add_column :cuestionarios, :fritura_papa, :boolean
    add_column :cuestionarios, :fritura_chicharron, :boolean
  end
end
