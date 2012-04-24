class AddReplayStartTimeAndReplayEndTimeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :replay_start_time, :datetime
    add_column :events, :replay_end_time, :datetime
  end
end
