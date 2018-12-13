#require 'pry'
require_relative 'valor_nutricional'

class Individuo

  attr_reader :nombre, :apellido

  def initialize(nombre, apellido)
    @nombre, @apellido = nombre, apellido
  end

  def to_s
    "#{@nombre} #{@apellido}"
  end

end


class Paciente < Individuo

  include Comparable
  attr_reader :tratamiento_obesidad,:consulta, :estadoNutricional, :talla

  def initialize(nombre, apellido, tratamiento_obesidad=false, consulta=false, peso, altura, sexo, edad, circ_cintura, circ_cadera, talla)

    super(nombre, apellido)   #encadenamiento (chaining)

    @tratamiento_obesidad = tratamiento_obesidad
    @consulta = consulta
    @estadoNutricional = EstadoNutricional.new(peso, altura, sexo, edad, circ_cintura, circ_cadera)
    @talla = talla
  end

  def to_s
    s = "Paciente "
    s << super.to_s        #encadenamiento (chaining)
    s << " con tratamiento obesidad: #{@tratamiento_obesidad}"
    s
  end

  def peso_teorico_ideal
    return (talla - 150) * 0.75 + 50
  end

end


#binding.pry