require 'rails_helper'

class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)
    @items << item_id
    
  end

  def empty?
    @items.empty?
  end

  def items
    @items
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
    it "加了相同種類的商品到購物車裡，購買項目不會增加，數量會改變" do
    #Arrange
    cart = Cart.new
    #Act
    3.times { cart.add_item(1) }
    2.times { cart.add_item(2) }
    2.times { cart.add_item(1) }
    #Assert
    expect(cart.items.count).to be 2
    end
  end
end
