require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'requires a title to be at least 7 characters long' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.new(title: 'Bro')
  	post.valid?
  	expect(post.errors[:title].any?).to eq(true)
  end
  it 'requires content' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.new(content: '')
  	post.valid?
  	expect(post.errors[:content].any?).to eq(true)
  end
  it 'belongs to a blog' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.create(title: 'This is a title', content: 'Content')
  	expect(post.blog).to eq(blog)
  end
  it 'has many messages' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.create(title: 'This is a title', content: 'Content')
  	message = post.messages.create(author: 'Phil Jackson', message: '11 Rings')
  	expect(post.messages).to include(message)
  end
end
