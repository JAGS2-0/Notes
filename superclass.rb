class B < A
  include Floopable  #if you want to add a module to a file, you us keyword 'include'
  def multiply (n)
    n * 5
  end
end

class Doubler < B
  def multiply(n)
    super (n) * 2  # you can write 'super' here because the parent class of Doubler, B, also includes a multiply method.
  end              # this also looks like n * 5 * 2
end



module Floopable  #modules are not able to be turned into objects (.new)
  def something
    "This is a something module"
  end
end

