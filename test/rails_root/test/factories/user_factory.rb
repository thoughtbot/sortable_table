Factory.sequence :email do |n|
  "random#{n}@gmail.com"
end

Factory.define :user do |user|
  user.email { Factory.next :email }
  user.name 'name'
  user.age 18
end
