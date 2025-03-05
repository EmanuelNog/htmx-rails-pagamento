class CreatePessoas < ActiveRecord::Migration[8.0]
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.date :dataNascimento

      t.timestamps
    end
  end
end
