require 'spec_helper'

describe MoviesController do
  
  def stubFind
    Movie.stub(:find).and_return(stub_model(Movie))    
  end
  
  it "Should not error" do
      stubFind()
      get :show, :id=>1
      response.code.should_not eq("404")
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
    it "should respond, or redirect" do
      stubFind()
      id = "1"
      get :match_director, :id=>id
      response.code.should_not eq("404")
    end
    
    it "should search for movies with the same director" do
      id = "1"
      
      Movie.should_receive(:match_director).with(id).and_return([mock_model(Movie)])
      
      get :match_director, :id=>id
    end
    
    it "should pass all matching movies to view" do
      id = "1"
      Movie.should_receive(:match_director).with(id).and_return([mock_model(Movie)])
      get :match_director, :id=>id
      assigns[:movies].should_not be nil
    end
    
    it "should pass a list of movies" do
      id = "1"
      Movie.stub(:match_director).with(id).and_return([stub_model(Movie)])
      get :match_director, :id=>id
      
      assigns[:movies].each do |movie|
        movie.should be_instance_of(Movie)
      end
    end    
  end
end