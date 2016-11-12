class CreateEstadopaquetes < ActiveRecord::Migration[5.0]
  def change
    create_table :estadopaquetes do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
