class EstadoNutricional

  include Comparable
  attr_reader :peso, :altura, :sexo, :edad, :circ_cintura, :circ_cadera;

  def initialize (peso, altura, sexo, edad, circ_cintura, circ_cadera)
    @peso = peso
    @altura = altura
    @sexo = sexo
    @edad = edad
    @circ_cintura = circ_cintura
    @circ_cadera = circ_cadera
  end

  def IMC()
    return ((peso/(altura*altura)).round(2))
  end

  def porcentaje_grasa()
    return (1.2 * IMC() + 0.23 * edad - 10.8 * sexo - 5.4).round(2)
  end

  def RCC()
    return (circ_cintura / circ_cadera).round(2)
  end

  def pliegues_cutaneos(*p)
    return (p.inject{ |sum, el| sum + el }.to_f / p.size).round(2)
  end

  def riesgo_RCC(rcc=RCC())

    if sexo == 1
      #hombre
      if rcc <= 0.88
        return "Bajo"
      elsif rcc <= 0.95
        return "Moderado"
      elsif rcc <= 1.01
        return "Alto"
      else
        return "Muy Alto"
      end

    else
      #mujer
      if rcc <= 0.75
        return "Bajo"
      elsif rcc <= 0.82
        return "Moderado"
      else
        return "Alto"
      end

    end
  end

  def <=>(other) #Devuelve: 1 si self>other, 0 si self==other, -1 si self<other
    [self.peso, self.altura, self.sexo, self.edad, self.circ_cintura, self.circ_cadera] <=>
        [other.peso, other.altura, other.sexo, other.edad, other.circ_cintura, other.circ_cadera]
  end

end