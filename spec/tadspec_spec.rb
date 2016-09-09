require 'rspec'
require './tadspec.rb'
describe 'Metodos de Prueba' do
  it 'Deberia ser suit' do
    class Suite
    def testear_que_dice_bien
      puts"bien"
    end
    end
    expect(TADsPec.is_suite? Suite).to equal(true)
  end
  it 'Deberia pasar el test' do
    class Suite
      def testear_que_es_7
        7.deberia ser 7
      end
    end
    instancia = Suite.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_es_7).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
  it 'Deberia fallar el test' do
    class Suite
      def testear_que_2_mayor_a_3
        #7.deberia ser 8
        2.deberia ser mayor_a 3
        #7.deberia ser mayor_a 8
      end
    end
    instancia = Suite.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_2_mayor_a_3).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end
  it 'Deberia pasar el test' do
    class Suite
      def testear_que_2_menor_a_3
        #7.deberia ser 8
        2.deberia ser mayor_a 3
        #7.deberia ser mayor_a 8
      end
    end
    instancia = Suite.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_2_menor_a_3).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end
  it 'Deberia ser uno de esos' do
    class Ser_o_no_ser
      def testear_que_true
        22.deberia ser uno_de_estos [7, 22, "hola"]
      end
    end
    instancia = Ser_o_no_ser.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_true).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
  it 'No deberia ser uno de esos' do
    class Ser_o_no_ser
      def testear_que_true
        23.deberia ser uno_de_estos [7, 22, "hola"]
      end
    end
    instancia = Ser_o_no_ser.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_true).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end
  it 'Deberia ser todo' do
    class Persona
      @edad
      def initialize
        @lista = [1,2,3]
      end
      def set edad
        @edad = edad
      end
      def edad
        @edad
      end
      def viejo?
        @edad > 29
      end
    end
    class SuitePrueba

      def initialize
        @nico = Persona.new
        @nico.set 30
        @leandro = Persona.new
        @leandro.set 22

      end

      def testear_que_holis
        @nico.deberia ser_viejo    # pasa: Nico tiene edad 30. #@nico.viejo?.deberia ser true
        @leandro.deberia tener_nombre nil # pasa
        @leandro.deberia tener_edad mayor_a 20 # pasa
        @leandro.deberia tener_edad menor_a 25 # pasa
      end
    end
    instancia = SuitePrueba.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_holis).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
  it 'No deberia ser todo' do
    class Persona
      @edad
      def initialize
        @lista = [1,2,3]
      end
      def set edad
        @edad = edad
      end
      def edad
        @edad
      end
      def viejo?
        @edad > 29
      end
    end
    class SuitePrueba

      def initialize
        @nico = Persona.new
        @nico.set 30
        @leandro = Persona.new
        @leandro.set 22

      end

      def testear_que_holis
        @nico.deberia ser_viejo    # pasa: Nico tiene edad 30. #@nico.viejo?.deberia ser true
        @leandro.deberia tener_nombre 'a' # pasa
        @leandro.deberia tener_edad mayor_a 20 # pasa
        @leandro.deberia tener_edad menor_a 25 # pasa
      end
    end
    instancia = SuitePrueba.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_holis).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end
  it 'Deberia entender' do
    class SuitePrueba

      def testear_que_entiende_new
        Object.deberia entender :new
      end
    end
    instancia = SuitePrueba.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_entiende_new).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
  it 'No deberia entender' do
    class SuitePrueba

      def testear_que_no_entiende_new
        Object.deberia entender :pepe
      end
    end
    instancia = SuitePrueba.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_no_entiende_new).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end
  it 'Deberia Explotar' do
    class SuitePrueba

      def testear_que_explota
        procedimiento = Proc.new do 7/0 end
        procedimiento.deberia explotar_con ZeroDivisionError
      end
    end
    instancia = SuitePrueba.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_explota).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
  it 'No deberia Explotar' do
    class SuitePrueba2

      def testear_que_no_explota
        procedimiento = Proc.new do 7/1 end
        procedimiento.deberia explotar_con ZeroDivisionError
      end
    end
    instancia = SuitePrueba2.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_no_explota).paso_test?).to equal(false)
    TestInitializer.finalizar_tests
  end

  it 'Deberia estar mockeada' do
    class Numero
      def dameNumero
        0
      end
    end
      class SuiteMock
        def testear_que_mockea
          Numero.mockear(:dameNumero) do
            1
          end
          num = Numero.new
          num.dameNumero.deberia ser 1
        end
      end

    instancia = SuiteMock.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_mockea).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end

  it 'Deberia testearnos a nosotros' do
    class Prueba
      def testear_que_true
      7.deberia ser 7
      end
    end

    class Testeador
      def testear_que_testea_bien
      instancia = Prueba.new
      TestInitializer.inicializar_tests
      TestInitializer.agregar_metodos_a_suite instancia
      TADsPec.testear_metodo(instancia, :testear_que_true).paso_test?.deberia ser true

      end
    end
    instancia = Testeador.new
    TestInitializer.inicializar_tests
    TestInitializer.agregar_metodos_a_suite instancia
    expect(TADsPec.testear_metodo(instancia, :testear_que_testea_bien).paso_test?).to equal(true)
    TestInitializer.finalizar_tests
  end
end