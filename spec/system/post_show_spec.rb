require 'rails_helper'
RSpec.describe 'posts index Page', type: :feature do
  let(:user) do
    User.create(
      id: 5,
      name: 'bala7',
      photo: 'https://c4.wallpaperflare.com/wallpaper/564/893/316/anime-conan-conan-edogawa-detective-wallpaper-preview.jpg',
      bio: 'Developer'
    )
  end

  it 'displays information of all posts of a certain user' do
    post = user.posts.create(title: 'Wazzaa', text: 'Hi there fellas', comments_counter: 5, likes_counter: 3)
    comment1 = post.comments.create(text: 'hey', post: post, author: user)
    comment2 = post.comments.create(text: 'hey', post: post, author: user)
    comment3 = post.comments.create(text: 'hey', post: post, author: user)
    visit user_post_path(user, post)
    expect(page).to have_content("#{post.title} by #{user.name}")
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content("#{comment1.author.name}: #{comment1.text}")
    expect(page).to have_content("#{comment2.author.name}: #{comment2.text}")
    expect(page).to have_content("#{comment3.author.name}: #{comment3.text}")
  end
end