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

  end
end