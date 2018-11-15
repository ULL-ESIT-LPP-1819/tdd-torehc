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
"""
  def push_back(objeto_nodo)
    @array << objeto_nodo
    @array[0].prev = @array[-1].value
    @array[-2].next = @array[-1].value
    @tail = objeto_nodo
    return tail.value
  end
"""
end