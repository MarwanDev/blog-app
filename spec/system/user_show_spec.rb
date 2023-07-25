require 'rails_helper'
RSpec.describe 'Users show Page', type: :feature do
  let(:user) do
    User.create(
      name: 'Ahmed',
      photo: 'https://c4.wallpaperflare.com/wallpaper/564/893/316/anime-conan-conan-edogawa-detective-wallpaper-preview.jpg',
      bio: 'Developer'
    )
  end

  it 'displays post information and comments' do
    post = user.posts.create(title: 'Hello everybody', text: 'Hello everybody, How are ya?', comments_counter: 2, likes_counter: 5)

    visit user_post_path(user, post)

    expect(page).to have_content(user.name)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content("Comments: #{post.comments_counter}")
    expect(page).to have_content("Likes: #{post.likes_counter}")

    # Test for comments
    commentor = User.create(name: 'Bala7')
    comment = Comment.create(author: commentor, post:, text: 'Wazzzaaaa')

    visit user_post_path(user, post)
    expect(page).to have_content(commentor.name)
    expect(page).to have_content(comment.text)
  end
end
