require './lib/array.rb'

describe Array do 

  context "inject method with block" do
    it "should produce a sum when given an array of integers" do
      original_method = [1,2,3,4].inject { |result, element| result + element}
      expect([1,2,3,4].new_inject { |result, element| result + element}).to eq original_method
    end

    it "should be able to multiply each element of array by the result of multiplying the previous two elements" do
      original_method = [1,2,3,4].inject([]) {|result, element| result * element} 
    end


    it "should be able to find the longest word in an array" do
      original_method = ["Makers", "Academy", "Code"].inject {|result, word| result.length > word.length ? result : word }
      expect(["Makers", "Academy", "Code"].new_inject {|result, word| result.length > word.length ? result : word }).to eq original_method
    end

  end 
end