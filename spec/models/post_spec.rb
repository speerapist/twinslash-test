require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests' do
    User.create(id: 1, email: 'sample@gmail.com', password: 'sample')
    PostType.create(id: 1, name: 'sample')

    it 'title should be presence' do
      post = Post.new(content: 'Sample', user_id: 1, post_type_id: 1).save
      expect(post).to eq(false)
    end

    it 'header length must be no more than 100' do
      post = Post.new(title: 's' * 101, content: 'Sample', user_id: 1, post_type_id: 1).save
      expect(post).to eq(false)
    end

    it 'content should be presence' do
      post = Post.new(title: 'Sample', user_id: 1, post_type_id: 1).save
      expect(post).to eq(false)
    end

    it 'user_id should be presence' do
      post = Post.new(title: 'Sample', content: 'Sample', post_type_id: 1).save
      expect(post).to eq(false)
    end

    it 'post_type_id should be presence' do
      post = Post.new(title: 'Sample', content: 'Sample', user_id: 1).save
      expect(post).to eq(false)
    end

    it 'default status test' do
      post = Post.new(title: 'Sample', content: 'Sample', user_id: 1, post_type_id: 1)
      expect(post.status).to eq('draft')
    end

    it 'should save successfully' do
      post = Post.new(title: 'Sample', content: 'Sample', user_id: 1, post_type_id: 1, status: 'new_post').save
      expect(post).to eq(true)
    end

    it 'should delete successfully' do
      post = Post.new(title: 'Sample', content: 'Sample', user_id: 1, post_type_id: 1)
      post.destroy
      -> { post.reload }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
