require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new } #let是一個方法等同下面的方法，把cart變成一個方法，而且有記憶功能
  describe "基本功能" do

    # def cart
    #   @cart ||= Cart.new # ruby memorization記憶模式
    # end

    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      # cart = Cart.new
      cart.add_item(1)
      # expect(cart.empty?).to be false
      expect(cart).not_to be_empty
    end

    it "加了相同種類的商品到購物車裡，購買項目不會增加，數量會改變" do
      # cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "商品可以放到購物車哩，也可以在拿出來 " do
      #Arrange
      # cart = Cart.new

      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)
      # i2 = cat1.item.create
      #Faker gem 的 FactoryBot 幫我們做好分類了
      #Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }
      #Assert
      expect(cart.items.first.item).to be_a Item  #Item是什麼
      expect(cart.items.first.item.price).to be i1.price
    end

    it "可以計算整台購物車的消費金額" do
      #Arrange
      # cart = Cart.new

      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)
      # i2 = cat1.item.create
      #Faker gem 的 FactoryBot 幫我們做好分類了
      #Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }
      #Assert
      expect(cart.total).to be 350
    end

    it "特別活動可搭配折扣" do
      #Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)

      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      t = Time.local(2008, 4, 1, 10, 5, 0)
      Timecop.travel(t)
      #Assert
      expect(cart.total).to be 35.0
    end

  end

  describe "進階功能" do
    it "可以將購物車內容轉換成 Hash" do
    # cart = Cart.new

    i1 = FactoryBot.create(:item)
    i2 = FactoryBot.create(:item)

    3.times { cart.add_item(i1.id) }
    2.times { cart.add_item(i2.id) }


    expect(cart.to_hash).to eq cart_hash
    end

    it "Hash 還原成購物車" do

      cart = Cart.from_hash(cart_hash)
      #也可以使用實體方法，類別方法要記得在前面加self

      expect(cart.items.count).to be 2

    end

    private
    def cart_hash
      result = {
        "items" => [
          { "item_id" => 1, "quantity" => 3 },
          { "item_id" => 2, "quantity" => 2 }
        ]
      }
    end
  end
end
