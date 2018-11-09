RSpec.describe TddLpp do
  it "has a version number" do
    expect(TddLpp::VERSION).not_to be nil
  end

  before :each do
    @tortitas = TddLpp::InfoNutricional.new('Tortitas de Avena',5,0.8,74,0.7,9.2,1.5)
  end

  describe TddLpp do
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

end
