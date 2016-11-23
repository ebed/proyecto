class ChangeNameColumnEstadoItems < ActiveRecord::Migration[5.0]
  def change
  	rename_column :estadoitemdespachos, :estado, :nombre
  end
end
