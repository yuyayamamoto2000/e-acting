FactoryBot.define do
  factory :conversation do
    sender_id { User.find_by(name: 'sender').id }
    recipient_id { User.find_by(name: 'recipient').id }
  end

  factory :recipient_user ,class: User do
    name {'recipient'}
    email {'test1@gmail.com'}
    password { 'password' }
    password_confirmation { 'password' }
  end

  factory :sender_user ,class: User  do
    name {'sender'}
    email {'test2@gmail.com'}
    password { 'password' }
    password_confirmation { 'password' }
  end
end
