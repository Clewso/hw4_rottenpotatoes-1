# => Steps to define the add directors feature

Given /the following movies exist:/ do |movies_table|
   movies_table.hashes.each do |movie|
    Movie.create!(
      :title=>movie[:title],
      :rating=>movie[:rating],
      :release_date=>movie[:release_date],
      :director=>movie[:director])
      
    if Movie.where(:title=>movie[:title]).empty?    
      flunk "Insert Failed"
    end
  end 
end


Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |arg1, arg2|
  movie = Movie.find(:first, :conditions=>["title = ?",arg1])
  
  if movie.director != arg2
    flunk "Director not saved"
  end
end
