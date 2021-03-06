class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :invoice, null: false, foreign_key: true
      t.integer :credit_card_number
      t.date :credit_card_expiration_date
      t.integer :result

      t.timestamps
    end
  end
end
