require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'requires a name' do
  	blog = Blog.new(name: '')
  	blog.valid?
  	expect(blog.errors[:name].any?).to eq(true)
  end
  it 'requires a description' do
  	blog = Blog.new(description: '')
  	blog.valid?
  	expect(blog.errors[:description].any?).to eq(true)
  end
  it 'has many posts' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post1 = blog.posts.create(title: 'This is a title', content: 'Content')
  	post2 = blog.posts.create(title: 'Another title', content: 'Content')
  	expect(blog.posts).to include(post1)
  	expect(blog.posts).to include(post2)
  end
  it 'deletes associated posts upon deletion' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	blog.posts.create(title: 'This is a title', content: 'Content')
  	expect {
  		blog.destroy
  	}.to change(Post, :count).by(-1)
  end
end

