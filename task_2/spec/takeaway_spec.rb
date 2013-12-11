require './lib/takeaway'

describe Takeaway do
  let(:takeaway){Takeaway.new}

  context "menu" do
    # no need for the test because if there's no menu,
    # other tests will fail
    it "should have a menu with dishes and prices" do
      expect(Takeaway::MENU).to eq ({:pizza=>8, :hamburger=>4.5, :cheeseburger=>5, :salad=>4, :fries=>2.5})
    end
  end

  context "ordering" do

    # these two tests make sense
    it "should allow ordering two pizzas and a salad" do
      order = {:pizza => 2, :salad => 1}
      allow(takeaway).to receive(:send_text)
      expect {takeaway.place_order(order, 20)}.not_to raise_error
      expect(takeaway).to have_received(:send_text).with("Your order is on the way")
    end

    it "should raise an error if the expected total does not match the actual total" do
      order = {:pizza => 2, :salad => 1}
      # you don't need to allow takeaway to receive send_test if an error is going to be thrown anyway      
      expect {takeaway.place_order(order, 21)}.to raise_error
    end


  end
end