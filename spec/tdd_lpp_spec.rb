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
  end

end
