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

  def push_back(objeto_nodo)
    @array << objeto_nodo
    @array[0].prev = @array[-1].value
    @array[-2].next = @array[-1].value
    @tail = objeto_nodo
    return tail.value
  end

  def pop_front
    @array[-1].next = @array[1].value
    @array[1].prev = @array[-1].value
    @array.shift
    @head = @array[0]
    @tail = @array[-1]
    return @head.value
  end

  def pop
    @array[-2].next = @array[0].value
    @array[0].prev = @array[-2].value
    @array.pop
    @head = @array[0]
    @tail = @array[-1]
    return @tail.value
  end

  def empty
    return @array.empty?
  end

  def sort
    return @array.sort_by { |h| h[:value] }
  end

  def sort_min
    return @array.sort_by{ |h| h[:value] }[0]
  end

  def sort_max
    return @array.sort_by { |h| h[:value] }[-1]
  end


end