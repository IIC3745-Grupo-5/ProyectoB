class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :time
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
