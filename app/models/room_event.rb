class RoomEvent < ApplicationRecord
	validate :correct_times
	validate :booked

	def booked
		if RoomEvent.where(start_time: self.start_time..self.end_time, end_time: self.start_time..self.end_time).any?
			self.errors.add(:booked, 'Already booked')
			false
		end
	end

  def correct_times
    if self.end_time && (self.end_time > self.start_time)
      self.errors.add(:time_error, 'Incorrect time zones')
      false
    end
  end
	 
end
