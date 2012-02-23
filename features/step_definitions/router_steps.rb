Given /file containing:/ do |content|
  @file_content = content
end


When /run this file/ do
  eval @file_content
end


Then /^I should see the following routes$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }
end

Then /^I should see all of the following routes$/ do |table|
  table.map_headers! {|header| header.downcase.to_sym }
  true.should be_false
end

def hash_table_diff expected, actual

end


