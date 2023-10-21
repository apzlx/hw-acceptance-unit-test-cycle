# spec/models/movie_spec.rb
require "rails_helper"

RSpec.describe Movie, type: :model do
  describe ".find_movies_with_same_director" do
    let!(:movie1) { Movie.create!(title: "Star Wars", director: "George Lucas") }
    let!(:movie2) { Movie.create!(title: "THX-1138", director: "George Lucas") }
    let!(:movie3) { Movie.create!(title: "Blade Runner", director: "Ridley Scott") }

    it "returns movies with the same director" do
      expect(Movie.find_movies_with_same_director(movie1.director)).to contain_exactly(movie1, movie2)
    end

    it "does not return movies of different directors" do
      expect(Movie.find_movies_with_same_director(movie1.director)).not_to include(movie3)
    end

    # If you decide to handle the 'no director' case at the model level
    context "when the director is not known" do
      it "returns an empty array" do
        expect(Movie.find_movies_with_same_director(nil)).to eq([])
      end
    end
  end
end
