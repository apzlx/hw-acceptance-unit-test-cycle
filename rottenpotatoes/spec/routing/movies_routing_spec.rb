# spec/routing/movies_routing_spec.rb
require "rails_helper"

RSpec.describe MoviesController, type: :routing do
  it "routes to #same_director" do
    expect(get: "/same_director/1").to route_to("movies#same_director", id: "1")
  end
end
