def sign_up_and_register
  visit("/")
  fill_in("name", with: "Test Person")
  fill_in("email", with: "Test@address.com")
  fill_in("password", with: "TestPassword")
  click_button("Submit")
end