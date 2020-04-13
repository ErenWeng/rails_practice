require 'rails_helper'

class Cart
  def add_item(item_id)
  end

  def empty?
    false
  end
end


RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到購物車哩，然後購物車裡就有有東西" do
      #Arrange
      cart = Cart.new
      #Act
      cart.add_item(1)
      #Assert
      expect(cart.empty?).to be false
    end
  end

  describe "進階功能" do
    it "進階測試"
    #Arrange
    #Act
    #Assert
  end
end
