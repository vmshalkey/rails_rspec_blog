require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'requires an author' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.create(title: 'This is a title', content: 'Content')
  	message = post.messages.new(author: '')
  	message.valid?
  	expect(message.errors[:author].any?).to eq(true)
  end
  it 'requires a message' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.create(title: 'This is a title', content: 'Content')
  	message = post.messages.new(message: '')
  	message.valid?
  	expect(message.errors[:message].any?).to eq(true)
  end
  it 'belongs to a post' do
  	blog = Blog.create(name: 'Blog', description: 'A Blog')
  	post = blog.posts.create(title: 'This is a title', content: 'Content')
  	message = post.messages.create(author: 'Phil Jackson', message: '11 Rings')
  	expect(message.post).to eq(post)
  end
end
