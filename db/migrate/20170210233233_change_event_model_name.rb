class ChangeEventModelName < ActiveRecord::Migration[5.0]
  def change
  	rename_table :events, :room_events
  end
end
