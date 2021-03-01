class Koombean < ApplicationRecord
	has_many :networks, dependent: :destroy
  accepts_nested_attributes_for :networks, reject_if: proc { |att| att['link'].blank? }, allow_destroy: true
end 