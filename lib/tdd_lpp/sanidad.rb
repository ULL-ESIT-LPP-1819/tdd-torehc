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

  attr_reader :tratamiento_obesidad,:consulta

  def initialize(nombre, apellido, tratamiento_obesidad, consulta=false)
    super(nombre, apellido)   #encadenamiento (chaining)
    @tratamiento_obesidad = tratamiento_obesidad
    @consulta = consulta
  end

  def to_s
    s = "Paciente "
    s << super.to_s        #encadenamiento (chaining)
    s << " con tratamiento obesidad: #{@tratamiento_obesidad}"
    s
  end

end


