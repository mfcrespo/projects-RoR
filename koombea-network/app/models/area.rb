class Area < ApplicationRecord
	has_many :trainees
	validates :area, presence: true, uniqueness: { case_sensitive: false }
end	