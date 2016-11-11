class GolfCourse < ApplicationRecord
	belongs_to :address
    accepts_nested_attributes_for :address
	has_many :golf_course_organizers
	
	validates :name, presence: true
	validates :address, presence: true	
	
	after_validation :cleanup
	
	protected
		def cleanup
			self.name = self.name.strip
		end
end
