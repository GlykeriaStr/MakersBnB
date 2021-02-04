feature "when visiting homepage" do
  scenario "a message should appear" do
    visit("/")
    expect(page).to have_content("Makers BnB")
    expect(page).to have_content("We'll never share your email with anyone else.")
  end
end
