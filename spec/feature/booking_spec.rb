feature "visiting booking page" do
  scenario "as soon as you press book it confirms your booking" do
    user = User.create(email: "jon@test.com", password: "blah", name: "jon")
    listing = Spaces.create(name: "shack", description: "rumfun", cost: "40", user_id: user.id )
    user2 = User.create(email: "dave@test.com", password: "blah", name: "dave")
    visit("spaces")
    click_button("Request Booking")
    expect(current_path).to eq '/spaces/#{listing.id}'
  end
end