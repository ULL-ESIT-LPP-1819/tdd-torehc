# create a Struct with :value, :next and :prev
Nodo = Struct.new(:value, :next, :prev)

# Clase Lista
#
class Lista

  include Enumerable
  # Atributos con acceso
  attr_accessor :array, :head, :tail

  # Inicialización de la clase
  # @param [vector] Array de objetos para la lista
  def initialize(vector)
    @array = vector
    @head = @array[0]
    @tail = @array[-1]
  end

  # Añadir elemento al final de la lista
  # @param [objeto_nodo] Objeto para introducir
  def push_back(objeto_nodo)
    @array << objeto_nodo
    @array[0].prev = @array[-1].value
    @array[-2].next = @array[-1].value
    @tail = objeto_nodo
    return tail.value
  end

  # Sacar elemento del principio
  def pop_front
    @array[-1].next = @array[1].value
    @array[1].prev = @array[-1].value
    @array.shift
    @head = @array[0]
    @tail = @array[-1]
    return @head.value
  end

  # Sacar elemento
  def pop
    @array[-2].next = @array[0].value
    @array[0].prev = @array[-2].value
    @array.pop
    @head = @array[0]
    @tail = @array[-1]
    return @tail.value
  end

  # Comprobar si la lista está vacía
  # @return [bool] lista vacía
  def empty
    return @array.empty?
  end

  # Ordena con sort los pacientes por su IMC
  # @return [IMC] Devuelve el IMC mínimo
  def sort_paciente_IMC
    return @array.sort_by { |h| h.value.estadoNutricional.IMC() }
  end

  # Método each para Enumerable
  def each(&block)
    @array.each(&block)
  end

end