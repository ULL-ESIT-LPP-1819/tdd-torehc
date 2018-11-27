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

      comparar = self.valor_energetico_kcal() <=> other.valor_energetico_kcal()

      if comparar == 0
        comparar = @nombre <=> other.nombre
      end

      return comparar

    end


  end
end