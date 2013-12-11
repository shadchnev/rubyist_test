class Array

  # 1. be careful with indentation
  # 2. Overall structure is correct, which is great
  # 3. However, the method should take an optional argument
  # 4. You are using a return on line 10 to reduce the number of iterations
  #    but an easier way would be to do
  #    self.slice(1..-1).each do
  # 5. You've got 80% there - not bad!
  def new_inject
    result = self.first
      self.each_with_index do |val , index| 
        return result if index+1 == self.count 
        result = yield result,self[index+1] 
      end
  end
end