puts "Hello, world."
str = "Welcome to Javascript!"
str["Javascript"] = "Ruby"
puts str
str = "Welcome to Javascript!"
str[8..20] = "Ruby"

str = "Welcome to PHP Essentials!"
puts str.gsub("PHP", "Ruby")
str.gsub!("PHP", "Ruby")
puts str

puts "Hello, Ruby".index('Ruby')

for i in 1..10 do
  puts "#{i} James"
end

puts 'Pick a number for 1 to 10'
guess = gets
num = rand(10) + 1

if guess == num
  puts "You guessed right (#{num})"
else
  puts "You guessed wrong (#{num})"
end

within_a_transaction do
  things_that
  must_happen_together
end

def within_a_transaction
  begin_transaction
  yield
  end_transaction
end
