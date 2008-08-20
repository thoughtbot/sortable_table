Factory.define :user do |user|
  user.email { Factory.next :email }
  user.name { Factory.next :name }
  user.age { Factory.next :age }
end

Factory.sequence :email do |each| 
  "email#{each}@example.com"
end

Factory.sequence :name do |each| 
  "name#{each}"
end

Factory.sequence :age do |each| 
  each
end
