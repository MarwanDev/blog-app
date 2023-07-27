require 'rails_helper'
RSpec.describe 'posts index Page', type: :feature do
  let(:user) do
    User.create(
      name: 'bala7',
      photo: 'https://c4.wallpaperflare.com/wallpaper/564/893/316/anime-conan-conan-edogawa-detective-wallpaper-preview.jpg',
      bio: 'Developer'
    )
  end

  it 'displays information of all posts of a certain user' do
    post1 = user.posts.create(title: 'Wazzaa', text: 'Hi there fellas', comments_counter: 5, likes_counter: 3)
    user.posts.create(title: 'Hi', text: 'Hi there', comments_counter: 7, likes_counter: 8)
    user.posts.create(title: 'Hi', text: 'Hi there', comments_counter: 7, likes_counter: 8)
    user.posts.create(title: 'Hi', text: 'Hi there', comments_counter: 7, likes_counter: 8)
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
    expect(page).to have_css('img')
    expect(page).to have_content("Number of posts: #{user.postsCounter}")
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)
    expect(page).to have_content('paginton')
    expect(page).to have_content("Comments: #{post1.comments_counter}")
    expect(page).to have_content("Likes: #{post1.likes_counter}")

    click_link post1.text

    expect(current_path).to eq(user_post_path(user, post1))
    expect(page).to have_content(post1.title)
    expect(page).to have_content(post1.text)
  end
end
