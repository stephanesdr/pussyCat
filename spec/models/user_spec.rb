require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = build(:user)
  end

  it "is valid with valids attributes" do
    expect(@user).to be_valid
  end

  context "associations" do

    describe "user" do
      it "should have_many orders" do
        order = Order.create(user: @user)
        expect(@user.orders.include?(order)).to eq(true)
      end

      it "should have one cart" do
        cart = Cart.create(user: @user)
        puts "this cart user is #{@user.cart.inspect}"

      end
    end



  context "public instance method" do

    it "shoud create a cart when an user is create attached to this user" do
      cart = Cart.create(user_id: @user.id)
       expect(@user.id).to eq(cart.user_id)
    end
  end

  end
end
