require 'rails_helper'
RSpec.describe 'users index Page', type: :feature do
  let(:user) do
    User.create(
      name: 'bala7',
      photo: 'https://c4.wallpaperflare.com/wallpaper/564/893/316/anime-conan-conan-edogawa-detective-wallpaper-preview.jpg',
      bio: 'Developer',
      postsCounter: 4
    )
  end
  let(:user2) do
    User.create(
      name: 'coach',
      photo: 'https://c4.wallpaperflare.com/wallpaper/564/893/316/anime-conan-conan-edogawa-detective-wallpaper-preview.jpg',
      bio: 'Developer',
      postsCounter: 4
    )
  end

  it 'displays information of all users' do
    visit users_path(user)
    expect(page).to have_content(user.name)
    expect(page).to have_css('img')
    expect(page).to have_content("Number of posts: #{user.postsCounter}")
    visit users_path(user2)
    expect(page).to have_content(user2.name)

    click_link user.name

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.bio)
  end
end
