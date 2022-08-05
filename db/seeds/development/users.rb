# frozen_string_literal: true

User.find_or_create_by email: 'example@streaver.com' do |user|
  user.first_name = 'John'
  user.last_name = 'Doe'
  user.mobile_phone = '099123456'
  user.password = 'Pa$$w0rd'
end
