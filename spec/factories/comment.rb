# FactoryBot.define do
#   factory :comment do
#     sender_id { Work.find_by(name: 'sender').id }
#     recipient_id { User.find_by(name: 'recipient').id }
#   end
#
#   factory :comment_work ,class: User do
#     name {'recipient'}
#     email {'test1@gmail.com'}
#     password { 'password' }
#     password_confirmation { 'password' }
#   end
#
#   factory :sender_user ,class: User  do
#     name {'sender'}
#     email {'test2@gmail.com'}
#     password { 'password' }
#     password_confirmation { 'password' }
#   end
# end
