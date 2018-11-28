module TddLpp
  class InfoNutricional

    include Comparable
    attr_reader :nombre, :grasas, :grasas_saturadas, :hidratos_carbono, :azucares, :proteinas, :sal

    def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
      @nombre = nombre
      @grasas = grasas
      @grasas_saturadas = grasas_saturadas
      @hidratos_carbono = hidratos_carbono
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end

    def valor_energetico_kcal
      e_grasas = grasas * 9
      e_hidratos_carbono = hidratos_carbono * 4
      e_azucares = azucares * 4
      e_proteinas = proteinas * 4
      e_sal = sal * 6
      @valor_energetico_kcal = (e_grasas + e_hidratos_carbono + e_azucares + e_proteinas + e_sal)
    end

    def formatear_etiqueta
      return ("Nombre: #{nombre}, Grasas: #{grasas}, Grasas saturadas: #{grasas_saturadas}, Hidratos de carbono: #{hidratos_carbono}, Azúcares: #{azucares}, Proteínas: #{proteinas}, Sal: #{sal},")
    end

    def <=>(other) #Devuelve: 1 si self>other, 0 si self==other, -1 si self<other
      [self.nombre, self.grasas, self.grasas_saturadas, self.hidratos_carbono, self.azucares, self.proteinas, self.sal] <=>
          [other.nombre, other.grasas, other.grasas_saturadas, other.hidratos_carbono, other.azucares, other.proteinas, other.sal]
    end


  end
end