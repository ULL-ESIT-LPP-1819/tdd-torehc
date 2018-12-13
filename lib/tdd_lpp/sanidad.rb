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

  attr_reader :tratamiento_obesidad,:consulta, :estadoNutricional, :talla, :sexo, :edad, :peso

  def initialize(nombre, apellido, tratamiento_obesidad=false, consulta=false, peso, altura, sexo, edad, circ_cintura, circ_cadera, talla)

    super(nombre, apellido)   #encadenamiento (chaining)

    @tratamiento_obesidad = tratamiento_obesidad
    @consulta = consulta
    @estadoNutricional = EstadoNutricional.new(peso, altura, sexo, edad, circ_cintura, circ_cadera)
    @talla = talla
    @sexo = sexo
    @edad = edad
    @peso = peso

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

  #Calcular el gasto energético en estado de reposo
  def gasto_energetico_basal
    if sexo == 1 #Es un Hombre
      return (10 * peso) + (6.25 * talla) - (5 * edad) + 5
    else #Es una mujer
      return (10 * peso) + (6.25 * talla) - (5 * edad) - 161
    end
  end

  def efecto_termogeno
    return gasto_energetico_basal * 0,10
  end

end


#binding.pry