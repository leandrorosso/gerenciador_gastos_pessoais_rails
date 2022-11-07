class CreateConta < ActiveRecord::Migration[7.0]
  def change
    create_table :conta do |t|
      t.string :titulo
      t.decimal :saldo

      t.timestamps
    end
  end
end
