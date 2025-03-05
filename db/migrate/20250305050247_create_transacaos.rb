class CreateTransacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :transacaos do |t|
      t.decimal :valor
      t.references :Conta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
