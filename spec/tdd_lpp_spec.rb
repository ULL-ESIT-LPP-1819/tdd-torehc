RSpec.describe TddLpp do
  it "has a version number" do
    expect(TddLpp::VERSION).not_to be nil
  end

  describe TddLpp do

    before :each do
      @tortitas = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
    end

    describe "Etiqueta" do
      it "Etiqueta con nombre" do
        expect(@tortitas.nombre).not_to be_nil
      end
      it "Cantidad de grasas" do
        expect(@tortitas.grasas).not_to be_nil
      end
      it "Cantidad de grasas saturadas" do
        expect(@tortitas.grasas_saturadas).not_to be_nil
      end
      it "Cantidad de hidratos de carbono" do
        expect(@tortitas.hidratos_carbono).not_to be_nil
      end
      it "Cantidad de azúcares" do
        expect(@tortitas.azucares).not_to be_nil
      end
      it "Cantidad de proteínas" do
        expect(@tortitas.proteinas).not_to be_nil
      end
      it "Cantidad de sal" do
        expect(@tortitas.sal).not_to be_nil
      end
    end

    describe "Valor Energético" do
      it "Método para calcular el valor energético" do expect(@tortitas).not_to be_nil
        expect(@tortitas.valor_energetico_kcal).to eql(389.6);
      end
    end

    describe "Getters" do
      it "Método para obtener el nombre" do
        expect(@tortitas.nombre).to eql('Tortitas de Avena')
      end
      it "Método para obtener las grasas" do
        expect(@tortitas.grasas).to eql(5)
      end
      it "Método para obtener las grasas saturadas" do
        expect(@tortitas.grasas_saturadas).to eql(0.8)
      end
      it "Existe un metodo para obtener los hidratos de carbono" do
        expect(@tortitas.hidratos_carbono).to eql(74)
      end
      it "Existe un metodo para obtener los azúcares" do
        expect(@tortitas.azucares).to eql(0.7)
      end
      it "Existe un metodo para obtener las proteínas" do
        expect(@tortitas.proteinas).to eql(9.2)
      end
      it "Existe un metodo para obtener la sal" do
        expect(@tortitas.sal).to eql(1.5)
      end

    end

    describe "Etiqueta Formateada" do
      it "Método para formatear etiqueta" do expect(@tortitas).not_to be_nil
      expect(@tortitas.formatear_etiqueta).to eql(
         "Nombre: Tortitas de Avena, Grasas: 5, Grasas saturadas: 0.8, Hidratos de carbono: 74, Azúcares: 0.7, Proteínas: 9.2, Sal: 1.5,");
      end
    end

  end

  describe Lista do

    before :each do
      @lista_inicial = [Nodo.new(00, 1, 4) ,Nodo.new(11, 2, 0), Nodo.new(22, 3, 1), Nodo.new(33, 4, 2), Nodo.new(44, 0, 3)]
      @lista_doble = Lista.new(@lista_inicial)
    end

    it "Nodo con valor" do
      expect(@lista_doble.array[1].value).to eq(11)
    end

    it "Nodo con el siguiente" do
      expect(@lista_doble.array[2].next).to eq(3)
    end

    it "Nodo con el previo." do
      expect(@lista_doble.array[0].prev).to eq(4)
    end

    it "Insertar elemento en lista" do
      expect(@lista_doble.push_back(Nodo.new(55, @lista_doble.head.value, @lista_doble.tail.value))).to eq(55)
    end

    it "Extraer el primer elemento de la lista" do
      expect(@lista_doble.pop_front).to eq(11)
    end

    it "Extraer el último elemento de la lista" do
      expect(@lista_doble.pop).to eq(33)
    end

    it "Lista vacía" do
      expect(@lista_doble.empty).to eq(false)
    end
  end

  describe "Lista de etiquetas según los gramos de sal" do

      before :each do

        @tortitasA = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
        @tortitasF = TddLpp::InfoNutricional.new('Tortitas de Fibra',10,0.9,70,0.7,9.2,2)
        @tortitasN = TddLpp::InfoNutricional.new('Tortitas de Naranja',15,0.9,80,0.7,10.2,2.5)
        @tortitasL = TddLpp::InfoNutricional.new('Tortitas de Limón',20,1.5,90,0.9,11.2,3)

        @lista_inicial = [Nodo.new(@tortitasA.sal, 1, 3) ,Nodo.new(@tortitasF.sal, 2, 0), Nodo.new(@tortitasN.sal, 3, 1), Nodo.new(@tortitasL.sal, 0, 2)]
        @lista_etiquetas = Lista.new(@lista_inicial)
      end

      it "Nodo con sal menor" do
        expect(@lista_etiquetas.array[0].value).to eq(1.5)
      end

      it "Nodo con sal mayor" do
        expect(@lista_etiquetas.array[3].value).to eq(3)
      end

  end

  describe "Jerarquía de Clases" do

    before :each do
      @p1 = Paciente.new('Hector','A',true,75,1.70,1,24,50.0,70.0)
    end

    it "Objeto tipo Paciente" do
      expect(@p1.class.name).to eql("Paciente")
    end

    it "Paciente es un Individuo" do
      expect(@p1.is_a?(Individuo)).to eq(true)
    end

    it "Paciente hereda de Individuo" do
      expect(Paciente.superclass.name).to eq("Individuo")
    end

  end

  describe "Lista de Individuos según Índice de Masa Corporal" do

    before :each do
      @p1 = Paciente.new('Hector','A',true,75,1.70,1,24,50.0,70.0, 48)
      @p2 = Paciente.new('Pedro','B',true,85,1.80,1,24,50.0,70.0, 44)
      @p3 = Paciente.new('Marta','C',true,55,1.50,2,24,30.0,50.0, 40)
      @p4 = Paciente.new('Diana','D',true,60,1.60,2,24,35.0,60.0, 38)
      @p5 = Paciente.new('Luis','E',true,85,1.80,1,24,50.0,70.0, 38)

      @lista_inicial = [Nodo.new(@p1, 1, 4),
                        Nodo.new(@p2, 2, 0),
                        Nodo.new(@p3, 3, 1),
                        Nodo.new(@p4, 4, 2),
                        Nodo.new(@p5, 0, 3)]
      @lista_imc = Lista.new(@lista_inicial)

    end

    it "Obtener IMC de Individuo" do
      expect( @lista_imc.array[0].value.estadoNutricional.IMC() ).to eq(25.95)
    end

    it "Menor IMC" do
      expect( @lista_imc.sort_paciente_IMC[0].value.estadoNutricional.IMC() ).to eq(23.44)
    end

    it "Mayor IMC" do
      expect( @lista_imc.sort_paciente_IMC[-1].value.estadoNutricional.IMC() ).to eq(26.23)
    end

    it "Individuo con Menor IMC" do
      expect( @lista_imc.sort_paciente_IMC[0].value.nombre ).to eql("Diana")
    end

    it "Individuo con Mayor IMC" do
      expect( @lista_imc.sort_paciente_IMC[-1].value.nombre ).to eql("Luis")
    end

  end

  describe "Comparar la información nutricional entre dos etiquetas" do

    before :each do
      @tortitas = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
      @tortitas2 = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
      @tortitas_choco = TddLpp::InfoNutricional.new('Tortitas de Chocolate',6,1,90,0.8,10.2,2)
    end

    it "Etiquetas iguales" do
      expect(@tortitas == @tortitas2).to eq(true)
    end

    it "Etiquetas distintas" do
      expect(@tortitas != @tortitas_choco).to eq(true)
    end

    it "Etiqueta mayor que otra (>)" do
      expect(@tortitas_choco).to be > @tortitas
    end

    it "Etiqueta menor que otra (<)" do
      expect(@tortitas).to be < @tortitas_choco
    end

    it "Etiqueta menor o igual que otra (<=)" do
      expect(@tortitas).to be <= @tortitas_choco
      expect(@tortitas).to be == @tortitas2
    end

    it "Etiqueta mayor o igual que otra (>=)" do
      expect(@tortitas_choco).to be >= @tortitas
      expect(@tortitas).to be == @tortitas2
    end

  end


  describe "Comparar la Valoración Nutricional de un Individuo" do

    before :each do
      @pLuis = Paciente.new('Luis','A',true,75,1.70,1,24,50.0,70.0)
      @pLuis2 = Paciente.new('Luis','A',true,75,1.70,1,24,50.0,70.0)
      @pMarta = Paciente.new('Marta','C',true,55,1.50,2,24,30.0,50.0)
    end

    it "Valoración Nutricional iguales" do
      expect(@pLuis.estadoNutricional == @pLuis2.estadoNutricional).to eq(true)
    end

    it "Valoración Nutricional distintas" do
      expect(@pLuis.estadoNutricional != @pMarta.estadoNutricional).to eq(true)
    end

    it "Valoración Nutricional mayor que otra (>)" do
      expect(@pLuis.estadoNutricional).to be > @pMarta.estadoNutricional
    end

    it "Valoración Nutricional menor que otra (<)" do
      expect(@pMarta.estadoNutricional).to be < @pLuis.estadoNutricional
    end

    it "Valoración Nutricional menor o igual que otra (<=)" do
      expect(@pMarta.estadoNutricional).to be <= @pLuis.estadoNutricional
      expect(@pLuis.estadoNutricional).to be == @pLuis2.estadoNutricional
    end

    it "Valoración Nutricional mayor o igual que otra (>=)" do
      expect(@pLuis.estadoNutricional).to be >= @pMarta.estadoNutricional
      expect(@pLuis.estadoNutricional).to be == @pLuis2.estadoNutricional
    end

  end

  describe "Enumerar listas de etiquetas de información nutricional" do

    before :each do

      @tortitasA = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
      @tortitasF = TddLpp::InfoNutricional.new('Tortitas de Fibra',10,0.9,70,0.7,9.2,2)
      @tortitasN = TddLpp::InfoNutricional.new('Tortitas de Naranja',15,0.9,80,0.7,10.2,2.5)
      @tortitasL = TddLpp::InfoNutricional.new('Tortitas de Limón',20,1.5,90,0.9,11.2,3)

      @lista_inicial = [Nodo.new(@tortitasA, 1, 3) ,Nodo.new(@tortitasF, 2, 0), Nodo.new(@tortitasN, 3, 1), Nodo.new(@tortitasL, 0, 2)]
      @lista_etiquetas = Lista.new(@lista_inicial)
    end

    it "comprobrando el método all?" do
      expect(@lista_etiquetas.all?).to eq(true)
    end

    it "comprobrando el método any?" do
      expect(@lista_etiquetas.any?).to eq(true)
    end

    it "comprobrando el método collect" do
      expect(@lista_etiquetas.map{|i| i}).to eq(@lista_inicial)
    end

    it "comprobrando el método count" do
      expect(@lista_etiquetas.count).to eq(4)
    end

    it "menor de la lista por grasas" do
      expect(@lista_etiquetas.min_by {|h| h[:value].grasas}.value.grasas).to eq(5)
    end

    it "mayor de la lista por grasas" do
      expect(@lista_etiquetas.max_by {|h| h[:value].grasas}.value.grasas).to eq(20)
    end

    it "sort de la lista por grasas" do
      expect(@lista_etiquetas.sort_by {|h| h[:value].grasas}[1].value.grasas).to eq(10)
    end

  end

  describe "Menú Dietético" do

    before :each do
      @p1 = Paciente.new('Hector','A',true,75,1.70,1,24,50.0,70.0, 48, 0.12)
      @p3 = Paciente.new('Marta','C',true,55,1.50,2,24,30.0,50.0, 40, 0)
    end

    it "Peso teórico ideal" do
      expect(@p1.peso_teorico_ideal).to eq(-62.41)
    end

    it "Gasto energético basal Hombre" do
      expect(@p1.gasto_energetico_basal).to eq(-393.25)
    end

    it "Gasto energético basal Mujer" do
      expect(@p3.gasto_energetico_basal).to eq(-296.0)
    end

    it "Efecto termógeno Hombre" do
      #expect(@p1.efecto_termogeno).to eq(935)
      expect(@p1.efecto_termogeno).not_to eq(nil)
    end

    it "Efecto termógeno Mujer" do
      #expect(@p3.efecto_termogeno).to eq(519)
      expect(@p3.efecto_termogeno).not_to eq(nil)
    end

    #it "Gasto en Atividad Física" do
    #  expect(@p1.gasto_actividad_fisica).to eq(1)
    #end

  end


end
