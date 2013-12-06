require './lib/takeaway'

describe Takeaway do
  let(:takeaway){Takeaway.new}

  context "menu" do
    it "should have a menu with dishes and prices" do
      expect(Takeaway::MENU).to eq ({:pizza=>8, :hamburger=>4.5, :cheeseburger=>5, :salad=>4, :fries=>2.5})
    end
  end

  context "ordering" do

    it "should allow ordering two pizzas and a salad" do
      order = [{:pizza => 2}, {:salad => 1}]
      allow(takeaway).to receive(:send_text).with("Your order is on the way")
      expect {takeaway.place_order(order, 20)}.not_to raise_error
    end

  end
end