feature "visiting booking page" do
  scenario "as soon as you press book it confirms your booking" do
    user = User.create(email: "jon@test.com", password: "blah", name: "jon")
    listing = Spaces.create(name: "shack", description: "rumfun", cost: "40", user_id: user.id )
    visit('/spaces')
    click_button('Log Out')
    user2 = User.create(email: "dave@test.com", password: "blah", name: "dave")
    visit("/spaces")
    click_link("Request Booking")
    expect(current_path).to eq "/spaces/#{listing.id}"
    expect(page).to have_content("You just booked shack!")
  end
end
