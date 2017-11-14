
Given /^Navigate to the main page$/ do
  @app.main_page.load
end

When /^Sign up as an? (\w+)$/ do | user |
  @app.main_page.sign_up_as(user)
end

When /^Login as an? (\w+)$/ do | user |
  @app.main_page.login_as(user)
end

And /^Create a few expenses$/ do
  @app.expenses_page.create_set_of_expenses
end

And /^Generate a report$/ do
  @app.expenses_page.generate_report
end

Then /^The report should be displayed$/ do
  expect(@app.expenses_page).to have_results_section
end

Then /^The subtotal amount should be correct$/ do
  expect(@app.expenses_page.get_report_results_subtotal).to eq CONFIG['report']['subtotal']
end
