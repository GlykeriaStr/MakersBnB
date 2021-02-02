feature "when visiting homepage" do
  it "a message should appear" do
    visit("/")
    expect(page).to have_content("Hello World")
  end
end