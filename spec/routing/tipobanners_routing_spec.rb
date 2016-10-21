require "rails_helper"

RSpec.describe TipobannersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tipobanners").to route_to("tipobanners#index")
    end

    it "routes to #new" do
      expect(:get => "/tipobanners/new").to route_to("tipobanners#new")
    end

    it "routes to #show" do
      expect(:get => "/tipobanners/1").to route_to("tipobanners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tipobanners/1/edit").to route_to("tipobanners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tipobanners").to route_to("tipobanners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tipobanners/1").to route_to("tipobanners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tipobanners/1").to route_to("tipobanners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tipobanners/1").to route_to("tipobanners#destroy", :id => "1")
    end

  end
end
