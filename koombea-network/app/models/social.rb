class Social < ApplicationRecord
  validates :link, uniqueness: { case_sensitive: false },
                    length: {minimum:3, maximum:20}
end  