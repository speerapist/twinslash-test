require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'email should be presence' do
      user = User.new(id: 1, password: 'sample').save
      expect(user).to eq(false)
    end

    it 'password should be presence' do
      user = User.new(
        id: 2,
        email: 'sample_email@gmail.com ',
        first_name: 'sample',
        last_name: 'sample').save
      expect(user).to eq(false)
    end

    it 'last_name should be presence' do
      user = User.new(
        id: 2,
        email: 'sample_email@gmail.com ',
        first_name: 'sample',
        password: 'sample').save
      expect(user).to eq(false)
    end

    it 'first_name should be presence' do
      user = User.new(
        id: 2,
        email: 'sample_email@gmail.com ',
        password: 'sample',
        last_name: 'sample').save
      expect(user).to eq(false)
    end

    it 'should be save with all attributes' do
      user = User.new(
        id: 3, email: 'sample_email@gmail.com',
        password: 'sample',
        first_name: 'sample',
        last_name: 'sample').save
      expect(user).to eq(true)
    end
  end
end