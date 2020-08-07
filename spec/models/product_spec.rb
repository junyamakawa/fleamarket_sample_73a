require 'rails_helper'
describe Product do
  let(:user) {create(:user)}
  let(:image) {create(:image)}

  describe '#create' do
    it "画像がないと登録できないこと" do
      product = build(:product)
      product.valid?
      expect(product.errors[:src])
    end
    it "商品名がないと登録できないこと" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end
    it "商品名が40文字を超えると登録できないこと" do
      product = build(:product, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end
    it "商品の説明がないと登録できないこと" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end
    it "商品の説明が1000文字を超えると登録できないこと" do
      product = build(:product, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      product.valid?
      expect(product.errors[:description]).to include("は1000文字以内で入力してください")
    end
    it "商品の状態がないと登録できないこと" do
      product = build(:product, condition_id: nil)
      product.valid?
      expect(product.errors[:condition_id]).to include("を入力してください")
    end
    it "配送料の負担がないと登録できないこと" do
      product = build(:product, delivery_cost_id: nil)
      product.valid?
      expect(product.errors[:delivery_cost_id]).to include("を入力してください")
    end
    it "発送元の地域がないと登録できないこと" do
      product = build(:product, region_id: nil)
      product.valid?
      expect(product.errors[:region_id]).to include("を入力してください")
    end
    it "発送日までの日数がないと登録できないこと" do
      product = build(:product, preparation_day_id: nil)
      product.valid?
      expect(product.errors[:preparation_day_id]).to include("を入力してください")
    end
    it "販売価格がないと登録できないこと" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
    it "販売価格が300円未満であれば登録できないこと" do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
    it "販売価格が9999999円を超えると登録できないこと" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end