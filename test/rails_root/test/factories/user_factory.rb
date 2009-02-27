UNSORTED_NUMBERS = [1, 6, 2, 5, 4, 8, 10, 9, 3, 7]

Factory.define :user do |user|
  user.email { Factory.next :email }
  user.name  { Factory.next :name }
  user.age   { Factory.next :age }
  user.group { |user| user.association(:group) }
end

Factory.define :group do |group|
  group.name { Factory.next(:unsorted_name) }
end

Factory.sequence :email do |n|
  "email#{n}@example.com"
end

Factory.sequence :name do |n|
  "name#{n}"
end

Factory.sequence :unsorted_number do |n|
  UNSORTED_NUMBERS[n % UNSORTED_NUMBERS.size]
end

Factory.sequence :age do |n|
  20 + Factory.next(:unsorted_number)
end

Factory.sequence :unsorted_name do |n|
  "name#{Factory.next(:unsorted_number)}#{n}"
end
