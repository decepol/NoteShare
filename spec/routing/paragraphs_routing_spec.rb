require "spec_helper"

describe ParagraphsController do
  describe "routing" do

    it "routes to #index" do
      get("/paragraphs").should route_to("paragraphs#index")
    end

    it "routes to #new" do
      get("/paragraphs/new").should route_to("paragraphs#new")
    end

    it "routes to #show" do
      get("/paragraphs/1").should route_to("paragraphs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/paragraphs/1/edit").should route_to("paragraphs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/paragraphs").should route_to("paragraphs#create")
    end

    it "routes to #update" do
      put("/paragraphs/1").should route_to("paragraphs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/paragraphs/1").should route_to("paragraphs#destroy", :id => "1")
    end

  end
end
