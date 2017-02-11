class RoomEvent < ApplicationRecord
	validate :correct_times
	validate :booked
  belongs_to :room
  belongs_to :user
  scope :today, -> { where(start_time: Date.today.beginning_of_day..Date.today.end_of_day)}

	def booked
		if RoomEvent.where(room_id: self.room_id).where("start_time BETWEEN ? AND ? OR end_time BETWEEN ? and ?", self.start_time, self.end_time, self.start_time, self.end_time).any?
			self.errors.add(:booked, 'Already booked')
			false
		end
	end

  def correct_times
    if self.end_time && (self.end_time < self.start_time)
      self.errors.add(:time_error, 'End time can\' be before start time')
      false
    end
  end
	 
end
