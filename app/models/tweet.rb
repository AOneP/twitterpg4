class Tweet < ApplicationRecord
  paginates_per 25

def self.search(query)
  scope = all
  return scope unless query.present?
  scope = scope.where('text like ?', "%#{query}%")
  scope
end

end
