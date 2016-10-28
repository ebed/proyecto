class RepairProblemHabilitadoInUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sellers, :habilitado
  	add_column :sellers, :habilitado, :boolean, :default => false
  end
end
