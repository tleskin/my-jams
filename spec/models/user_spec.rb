require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.new(first_name: 'Josh',
                      last_name: 'Cheek',
                      username: 'jcheek',
                      password: 'password',
                      password_confirmation: 'password')}

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a first_name' do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a last_name' do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password_confirmation' do
    user.password_confirmation = nil
    expect(user).to_not be_valid
  end

  it 'does not allow a username to be chosen twice' do
    valid_attributes = {first_name: 'Josh',
                        last_name: 'Cheek',
                        username: 'jcheek',
                        password: 'password',
                        password_confirmation: 'password'}

    User.create(valid_attributes)
    expect{raise "Username has already been taken"}.to raise_error
  end

end
