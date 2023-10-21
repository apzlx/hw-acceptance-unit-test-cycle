
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  rating_list.split(', ').each do |rating|
    step %{I #{uncheck.nil? ? '' : 'un'}check "ratings_#{rating}"}
  end
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  Movie.all.each do |movie|
    step %{I should see "#{movie.title}"}
  end
end

Then(/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie_title, expected_director|
  movie = Movie.find_by(title: movie_title)
  expect(movie.director).to eq(expected_director)
end

When /I am on the details page for movie titled "(.*)"/ do |movie_title|
  movie = Movie.find_by(title: movie_title)
  visit movie_path(movie)
end

When(/^I click "Delete"$/) do
  click_link('Delete')
end

And(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.accept
end

Then /I should not see "([^"]*)" in the movies list/ do |movie_title|
  within("#movies") do
    expect(page).to have_no_content(movie_title)
  end
end

When /I dismiss popup/ do
  page.driver.browser.switch_to.alert.dismiss
end