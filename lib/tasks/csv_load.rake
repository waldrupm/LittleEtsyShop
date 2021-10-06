namespace :csv_load do
  desc 'Loads Customer data from csvs in db data folder to activerecord'
  task customers: :environment do
    csv = load_csv('customers')
    csv.each do |row|
      Customer.create!(id: row['id'].to_i, first_name: row['first_name'], last_name: row['last_name'],
                       created_at: row['created_at'], updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('customers')
    puts "Added #{Customer.count} customers from CSV"
  end

  desc 'Loads Invoice data from csvs in db data folder to activerecord'
  task invoices: :environment do
    csv = load_csv('invoices')
    csv.each do |row|
      Invoice.create!(id: row['id'].to_i, customer_id: row['customer_id'].to_i, status: row['status'],
                      created_at: row['created_at'], updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('invoices')
    puts "Added #{Invoice.count} invoices from CSV"
  end

  desc 'Loads Merchant data from csvs in db data folder to activerecord'
  task merchants: :environment do
    csv = load_csv('merchants')
    csv.each do |row|
      Merchant.create!(id: row['id'].to_i, name: row['name'], created_at: row['created_at'],
                       updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('merchants')
    puts "Added #{Merchant.count} merchants from CSV"
  end

  desc 'Loads Item data from csvs in db data folder to activerecord'
  task items: :environment do
    csv = load_csv('items')
    csv.each do |row|
      Item.create!(id: row['id'].to_i, name: row['name'], description: row['description'],
                   unit_price: row['unit_price'].to_i, merchant_id: row['merchant_id'].to_i, created_at: row['created_at'], updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('items')
    puts "Added #{Item.count} items from CSV"
  end

  desc 'Loads InvoiceItem data from csvs in db data folder to activerecord'
  task invoice_items: :environment do
    csv = load_csv('invoice_items')
    csv.each do |row|
      InvoiceItem.create!(id: row['id'].to_i, item_id: row['item_id'].to_i, invoice_id: row['invoice_id'].to_i,
                          quantity: row['quantity'].to_i, unit_price: row['unit_price'].to_i, status: row['status'], created_at: row['created_at'], updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('invoice_items')
    puts "Added #{InvoiceItem.count} invoice items from CSV"
  end

  desc 'Loads Transaction data from csvs in db data folder to activerecord'
  task transactions: :environment do
    csv = load_csv('transactions')
    csv.each do |row|
      Transaction.create!(id: row['id'].to_i, invoice_id: row['invoice_id'].to_i,
                          credit_card_number: row['credit_card_number'].to_i, credit_card_expiration_date: row['credit_card_expiration_date'], result: row['result'], created_at: row['created_at'], updated_at: row['updated_at'])
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('transactions')
    puts "Added #{Transaction.count} transactions items from CSV"
  end

  desc 'Load all csv data into respective activerecord models'
  task all: %i[environment customers invoices merchants items invoice_items transactions] do
    puts 'Imported all CSVs'
  end
end

def load_csv(filename)
  require 'csv'
  csv_text = File.read(Rails.root.join('db', 'data', "#{filename}.csv"))
  CSV.parse(csv_text, headers: true)
end
