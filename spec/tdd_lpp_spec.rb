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


end
