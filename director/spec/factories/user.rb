FactoryGirl.define do
  factory :user do
    email 'test1@example.com'
    password 'Test1234'
    password_confirmation 'Test1234'
    #encrypted_password '$2a$10$8uCZ9wCTsFoqa0aIfpssne4qtchcpqhepdU5WylZwh4GBAkgFWEYe'
  end
end
