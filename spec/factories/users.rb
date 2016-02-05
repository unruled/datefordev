FactoryGirl.define do
  factory :user do
    email 'ivan@petrov.ex'
    password '12345678'
    username 'ivantea'
    is_girl false
    before(:create) { |user| user.skip_confirmation! }
  end

end
