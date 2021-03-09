require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it "will not be created if password and password_confirmation fields are not the same" do
      @user = User.new(password: "thisIsATest1234", password_confirmation: "thisIsATest", email: "jsmith@email.com", first_name: "John", last_name: "Smith")
      expect(@user).to_not be_valid
    end

    it "will not create user without valid email" do
      @user = User.new(password: "thisIsATest1234", password_confirmation: "thisIsATest", first_name: "John", last_name: "Smith")
      expect(@user).to_not be_valid
    end

    it "will not create user if password is less than 6 characters" do
      @user = User.new(password: "12345", password_confirmation: "12345", email: "jsmith@email.com", first_name: "John", last_name: "Smith")
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

  end

end
