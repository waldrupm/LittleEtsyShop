namespace :csv_load do
  desc 'Loads Customer data from csvs in db data folder to activerecord'
  task customers: :environment do
  end

  desc 'Loads InvoiceItem data from csvs in db data folder to activerecord'
  task invoice_items: :environment do
  end

  desc 'Loads Invoice data from csvs in db data folder to activerecord'
  task invoices: :environment do
  end

  desc 'Loads Item data from csvs in db data folder to activerecord'
  task items: :environment do
  end

  desc 'Loads Merchant data from csvs in db data folder to activerecord'
  task merchants: :environment do
  end

  desc 'Loads Transaction data from csvs in db data folder to activerecord'
  task transactions: :environment do
  end

  desc 'Load all csv data into respective activerecord models'
  task all: :environment do
  end
end
