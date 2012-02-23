Given /file containing:/ do |content|
  @file_content = content
end


When /run this file/ do
  eval @file_content
end

Then /"(.+)#(.+)"/ do |klass_name,method|
  klass = eval klass_name
  @results = klass.new.send method
end


Then /(".+") will have the following/ do |to_eval, table|
end

def hash_table_diff expected, actual

end


