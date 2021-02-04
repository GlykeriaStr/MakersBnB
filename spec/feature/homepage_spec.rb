feature "when visiting homepage" do
  scenario "a message should appear" do
    visit("/")
    expect(page).to have_content("Hello World")
  end
end
