require 'spec_helper'

describe Movie do
  
  before(:each) do
    @movie = Movie.new
    @movie.title = "Alien"
    @movie.rating = "PG"
    @movie.director = "Ridley scott"
    @movie.release_date = "19/09/1989"
    @movie.save!
 end
  
  it "should have store all rating variant" do
    Movie.all_ratings.should == %w(G PG PG-13 NC-17 R)
  end
  
  it "Should respond to match director" do
    assert Movie.match_director(1)
  end
end