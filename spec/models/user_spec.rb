require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    let(:user) { User.new(first_name: 'Mickey', last_name: 'Mouse', email: 'mmouse@disney.com', password: '123456', password_confirmation: '123456') }

    it "is valid with valid attributes" do
      expect(user).to(be_valid)
    end

    # User must be created with a password and password_confirmation fields
    it "is not valid without a password" do
      user.password = nil
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'Password can\'t be blank'
    end

    it "is not valid without a password confirmation" do
      user.password_confirmation = nil
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'Password confirmation can\'t be blank'
    end

    # Password and confirmation need to match
    it "is not valid when password and confirmation do no match" do
      user.password = '123456'
      user.password_confirmation = '654312'
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(2)
      expect(user.errors.full_messages).to include 'Password confirmation doesn\'t match Password'
    end

    # Emails must be unique and should not be case sensitive
    it "is not valid to register with existing email" do
      user.save
      user_second = User.new(first_name: 'Mickey', last_name: 'Mouse', email: 'Mmouse@disney.com', password: '123456', password_confirmation: '123456')
      user_second.save
      expect(user_second).to be_invalid
      expect(user_second.errors.size).to eql(1)
      expect(user_second.errors.full_messages).to include 'Email has already been taken'
    end

    # Email should be required
    it "is not valid without a email" do
      user.email = nil
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'Email is invalid'
    end

    # First name should be required
    it "is not valid without first name" do
      user.first_name = nil
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'First name can\'t be blank'
    end

    # Last name should be required
    it "is not valid without last name" do
      user.last_name = nil
      user.save
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'Last name can\'t be blank'
    end

    # Password must have a minimum length
    it "is not valid when password is shorter than 6 characters" do
      user.password = '123'
      user.password_confirmation = '123'
      user.save
      puts user.errors.full_messages
      expect(user).to be_invalid
      expect(user.errors.size).to eql(1)
      expect(user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
