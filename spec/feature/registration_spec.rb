feature "when in home page" do
  scenario "user can sign up" do
    sign_up_and_register
    expect(current_path).to eq('/spaces')
    expect(page).not_to have_content("Sign up")
    expect(page).to have_content("Book a Space")
  end
end