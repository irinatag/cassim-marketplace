require 'rails_helper'

describe User do
  describe 'validations' do
    it 'requires an email' do
      user = User.new(password: 'password', password_confirmation: 'password')
      user.save

      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'requires password and password confirmation to match' do
      user = User.new(email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password1')
      user.save

      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'user can\'t register with same email' do
      User.create(
      email: 'test@test.com',
      password: 'password',
      password_confirmation: 'password')

      user = User.new(email:'test@test.com', password: 'password', password_confirmation: 'password')
      user.save

      expect(user.errors[:email]).to include("has already been taken")
    end

  end

end
