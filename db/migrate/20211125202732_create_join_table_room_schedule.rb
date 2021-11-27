class CreateJoinTableRoomSchedule < ActiveRecord::Migration[6.1]
  def change
    create_join_table :rooms, :schedules do |t|
      t.index [:room_id, :schedule_id]
    end
  end
end
