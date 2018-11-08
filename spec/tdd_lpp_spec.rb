RSpec.describe TddLpp do
  it "has a version number" do
    expect(TddLpp::VERSION).not_to be nil
  end

  before :each do
    @tortitas = TddLpp::InfoNutricional.new('Tortitas de Avena')
  end

  describe TddLpp do
    describe "Etiqueta" do
      it "Etiqueta con nombre" do
        expect(@tortitas.nombre).not_to be_nil
      end
    end
  end

end
