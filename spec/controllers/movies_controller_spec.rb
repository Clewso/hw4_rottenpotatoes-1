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
  
  describe "Find Movies With Same Director" do
    it "should respond, and find the requested movie" do
      stubFind()
      id = "1"
      get :match_director, :id=>id
      response.code.should eq("200")
    end
    
    it "should search for movies with the same director" do
      id = "1"
      Movie.should_receive(:match_director).with(id)
      get :match_director, :id=>id
    end
    
    it "should pass all matching movies to view" do
      id = "1"
      Movie.should_receive(:match_director).with(id).and_return("")
      get :match_director, :id=>id
      assigns[:movies].should_not be nil
    end
    
    it "should pass a list of movies" do
      id = "1"
      Movie.stub(:match_director).and_return(stub_model(Movie))
      get :match_director, :id=>id
      
      assigns[:movies].should be_instance_of(Movie)
    end
    
  end
end