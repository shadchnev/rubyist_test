class Array

  def new_inject
    result = self.first
      self.each_with_index do |val , index| 
        return result if index+1 == self.count 
        result = yield result,self[index+1] 
      end
  end
end