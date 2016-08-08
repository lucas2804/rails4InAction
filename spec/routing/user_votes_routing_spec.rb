require "rails_helper"

RSpec.describe UserVotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_votes").to route_to("user_votes#index")
    end

    it "routes to #new" do
      expect(:get => "/user_votes/new").to route_to("user_votes#new")
    end

    it "routes to #show" do
      expect(:get => "/user_votes/1").to route_to("user_votes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_votes/1/edit").to route_to("user_votes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_votes").to route_to("user_votes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_votes/1").to route_to("user_votes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_votes/1").to route_to("user_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_votes/1").to route_to("user_votes#destroy", :id => "1")
    end

  end
end
