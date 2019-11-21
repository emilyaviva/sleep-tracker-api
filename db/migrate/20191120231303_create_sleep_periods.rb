class CreateSleepPeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :sleep_periods do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :quality
      t.string :notes
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
