class Addtiendatoorder < ActiveRecord::Migration[5.0]
  def change
	add_column :orders, :tienda_id, :integer
  end
end
