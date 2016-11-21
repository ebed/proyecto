class CreatePreciosdeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :preciosdeliveries do |t|
      t.integer :distanciaMinima
      t.integer :distanciaMaxima
      t.string :unidadMedida
      t.integer :deliveryCompany_id

      t.timestamps
    end
  end
end
