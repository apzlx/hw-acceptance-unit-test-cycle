class Movie < ActiveRecord::Base
  def find_movies_with_same_director
    return [] if self.director.blank?
    Movie.where(director: self.director)
  end
end
