class Movie < ActiveRecord::Base
  def self.find_movies_with_same_director(director)
    where(director: director)
  end
end
