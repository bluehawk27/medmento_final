class CreateClockworkEvents < ActiveRecord::Migration
  def change
    create_table :clockwork_events do |t|
      t.string :patient_name
      t.string :drug_name
      t.string :message
      t.string :patient_number


      # clockwork fields
      t.integer :frequency_quantity
      t.references :frequency_period
      t.string :at

      t.timestamps
    end

    add_index :clockwork_events, :frequency_period_id
  end
end