class CreateTransacaos < ActiveRecord::Migration[7.0]
  def change
    create_table :transacaos do |t|
      t.integer :tipo
      t.string :titulo
      t.string :descricao
      t.decimal :valor
      t.date :data
      t.references :conta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
