FactoryBot.define do
  factory :user do
    name {'test'}
    email {'test@gmail.com'}
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :user1 do
    name {'test1'}
    email {'test1@gmail.com'}
    password { 'password' }
    password_confirmation { 'password' }
  end
end
