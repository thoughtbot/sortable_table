Factory.define :user do |user|
  user.email { Factory.next :email }
  user.name  { Factory.next :name }
  user.age   { Factory.next :age }
  user.group { |user| user.association(:group) }
end

Factory.define :group do |group|
  group.name { Factory.next :name }
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
