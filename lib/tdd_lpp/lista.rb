# create a Struct with :value, :next and :prev
Nodo = Struct.new(:value, :next, :prev)

class Lista

  include Enumerable
  attr_accessor :array, :head, :tail

  def initialize(vector)

    @array = vector
    @head = @array[0]
    @tail = @array[-1]
  end

end