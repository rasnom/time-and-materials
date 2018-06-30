class CreatePayPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :pay_periods do |t|
    	t.date :end_date, null: false

      t.timestamps
    end
  end
end
