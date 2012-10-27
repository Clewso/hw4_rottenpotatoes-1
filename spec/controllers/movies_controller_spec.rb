require 'spec_helper'

describe MoviesController do
  
  def stubFind
    Movie.stub(:find).and_return(stub_model(Movie))    
  end
  
    it "Should not error" do
      stubFind()
      get :show, :id=>1
      response.code.should eq("200")
    end
    
    it "Should Find Search for a movie" do
      id = "1"
      Movie.should_receive(:find).with(id)
      get :show, :id =>id 
    end
    
    it "Should allow editing" do
      id = "1"
      Movie.should_receive(:find).with(id)
      get :edit, :id =>id 
    end
    
    
end