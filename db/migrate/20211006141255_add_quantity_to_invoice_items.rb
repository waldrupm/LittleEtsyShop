class AddQuantityToInvoiceItems < ActiveRecord::Migration[6.1]
  def change
    change_table :invoice_items do |t|
      t.integer :quantity
    end
  end
end
