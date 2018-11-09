module TddLpp
  class InfoNutricional

    def initialize(nombre, grasas, grasas_saturadas, hidratos_carbono, azucares, proteinas, sal)
      @nombre = nombre
      @grasas = grasas
      @grasas_saturadas = grasas_saturadas
      @hidratos_carbono = hidratos_carbono
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end

    def nombre
      @nombre
    end

    def grasas
      @grasas
    end

    def grasas_saturadas
      @grasas_saturadas
    end

    def hidratos_carbono
      @hidratos_carbono
    end

    def azucares
      @azucares
    end

    def proteinas
      @proteinas
    end

    def sal
      @sal
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

  end
end