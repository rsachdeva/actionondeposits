class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|

      t.timestamps
    end
  end
end
