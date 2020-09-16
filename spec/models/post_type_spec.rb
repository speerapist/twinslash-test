require 'rails_helper'

RSpec.describe PostType, type: :model do
  context 'validation tests' do
  	it 'should save successfully' do
  	  post_type = PostType.new(name: 'adel').save
      expect(post_type).to eq(true)
    end

    it 'should delete successfully' do
  	  post_type = PostType.new(name: 'adel')
      post_type.destroy
      lambda { post_type.reload }.should raise_error(ActiveRecord::RecordNotFound)
    end

    it 'ensures ad_type name is unique' do
      post_type = PostType.create(name: 'sample')
      expect(post_type).to_not be_valid
    end

    it 'name should be presence' do
      post_type = PostType.new.save
      expect(post_type).to eq(false)
    end
  end
end