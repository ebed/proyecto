class AddAtributoEstadoDespacho < ActiveRecord::Migration[5.0]
  def up
  	add_column :estadodespachos, :final, :boolean
  	add_column :estadodespachos, :inicial, :boolean
  	
  	
  	add_column :estadopaquetes, :final, :boolean
  	add_column :estadopaquetes, :inicial, :boolean
  	
  	add_column :estadoitemdespachos, :final, :boolean
  	add_column :estadoitemdespachos, :inicial, :boolean
  end
end
