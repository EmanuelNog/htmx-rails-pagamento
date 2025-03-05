class CreateConta < ActiveRecord::Migration[8.0]
  def change
    create_table :conta do |t|
      t.decimal :saldo
      t.decimal :limiteSaqueDiario
      t.boolean :flagAtivo
      t.integer :tipoConta
      t.datetime :dataCriacao
      t.references :Pessoa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
