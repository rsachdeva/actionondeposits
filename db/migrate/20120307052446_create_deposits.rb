class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.string :bank_name
      t.integer :account_number
      t.decimal :amount
      t.integer :term_in_days
      t.decimal :apr
      t.integer :compounding_times
      t.decimal :apy
      t.date :start_date
      t.timestamps
    end
  end
end
