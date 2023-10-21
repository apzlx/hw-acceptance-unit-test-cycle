# spec/controllers/movies_controller_spec.rb
require "rails_helper"

RSpec.describe MoviesController, type: :controller do
  describe "GET #same_director" do
    let!(:movie1) { Movie.create!(title: "Star Wars", director: "George Lucas") }
    let!(:movie2) { Movie.create!(title: "THX-1138", director: "George Lucas") }
    let!(:movie3) { Movie.create!(title: "Alien") } # no director

    context "when the specified movie has a director" do
      it "assigns similar movies as @movies" do
        get :same_director, params: { id: movie1.to_param }
        expect(assigns(:movies)).to eq([movie2])
        expect(response).to render_template(:same_director) # assuming the view template is 'same_director'
      end
    end

    context "when the specified movie has no director" do
      it "redirects to the movies list" do
        get :same_director, params: { id: movie3.to_param }
        expect(response).to redirect_to(movies_path)
        expect(flash[:notice]).to eq("'Alien' has no director info") # verify the flash notice as well
      end
    end
  end
end