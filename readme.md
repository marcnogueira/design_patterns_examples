# ![](readme/design%20patterns%20titulo.jpg)
## Introdução
Inicialmente esse material foi criado para meus próprios estudos, como fonte de referência rápida sobre os Padrões de Projeto com exemplos de aplicação em Ruby. Com as adições dos exemplos de código resolvi criar  esse repositório público, para facilitar a vida de outras pessoas assim como eu sentem falta de algum material adaptado para essa linguagem. 
Além do material do ReadMe, irão encontrar alguns exemplos práticos de código dentro da pasta de exemplos, todos com cobertura de testes com Rspec.
Sintam-se a vontade para fazer suas próprias considerações, ou criar seus próprios exemplos de código para rechear ainda mais esse material.
## O conceito
Design patterns, ou padrões de projeto, são soluções reutilizáveis para problemas comuns de design de software que surgem durante o desenvolvimento de sistemas de software. Eles são abordagens testadas e comprovadas para lidar com desafios de design específicos e fornecem diretrizes sobre como organizar, estruturar e relacionar componentes de software para alcançar uma arquitetura eficaz e flexível.

Os design patterns não são códigos prontos para uso, mas sim modelos conceituais que descrevem a estrutura e as interações entre objetos e componentes de software. Eles são uma forma de documentar as melhores práticas e soluções bem-sucedidas que a comunidade de desenvolvimento de software identificou ao longo do tempo.

Os benefícios dos design patterns incluem:

* **Reutilização de Soluções**: Design patterns fornecem soluções testadas e comprovadas para problemas recorrentes, economizando tempo e esforço.
* **Comunicação Eficiente**: Eles estabelecem uma linguagem comum que os desenvolvedores podem usar para comunicar soluções de design complexas de maneira mais eficaz.
* **Manutenibilidade**: Padrões de projeto facilitam a manutenção do código, uma vez que as soluções estão estruturadas de forma clara e organizada.
* **Flexibilidade e Extensibilidade**: Eles promovem a flexibilidade e a extensibilidade do software, permitindo que novas funcionalidades sejam adicionadas com menos impacto nas partes existentes do sistema.

Alguns exemplos de design patterns amplamente conhecidos incluem o Singleton, o Observer, o Factory Method, o Strategy e o Adapter, entre outros. Cada padrão aborda um conjunto específico de problemas e fornece uma abordagem de resolução de problemas comprovada.
No geral, os design patterns são valiosos para desenvolvedores de software, pois fornecem um conjunto de ferramentas conceituais para criar software mais robusto, flexível e fácil de manter. Eles são uma parte importante do conhecimento fundamental em engenharia de software e são amplamente utilizados na indústria de desenvolvimento de software.


## Principais Tipos (Famílias: Criacionais, Estruturais e Comportamentais)
### Singleton
“Classe instanciada uma única vez em toda a aplicação.”

O Singleton é um padrão de projeto de criação que garante que uma classe tenha apenas uma instância e fornece um ponto de acesso global para essa instância. Isso é útil quando você deseja controlar estritamente como uma única instância de uma classe é criada e compartilhada em toda a aplicação. Aqui está um exemplo simples de como implementar um Singleton em Ruby:
```ruby
class SingletonExample
  @instance = nil

  private_class_method :new

  def self.instance
    @instance ||= new
  end

  def some_method
    puts "This is an instance method of the Singleton class."
  end
end
```

Neste exemplo:

* A classe SingletonExample tem um método privado de classe new, que impede a criação de instâncias da classe a partir de fora da classe.
* O método instance é definido como um método de classe público. Este método cria uma instância da classe se ainda não existir (usando a variável de classe @instance) ou retorna a instância já existente.
* A classe SingletonExample contém um método chamado some_method, que é apenas um exemplo de um método que a instância da classe pode ter.

Agora, você pode usar o Singleton da seguinte maneira:
```
instance1 = SingletonExample.instance
instance2 = SingletonExample.instance

puts instance1 == instance2 # Deve imprimir "true"

instance1.some_method # Deve chamar o método some_method na instância
```

Neste exemplo, instance1 e instance2 são ambas referências à mesma instância da classe SingletonExample, garantindo que apenas uma instância seja criada e compartilhada em toda a aplicação. Isso é útil em situações onde você deseja ter um único ponto de acesso global a um recurso ou configuração, como um registro de log ou uma conexão de banco de dados, evitando múltiplas instâncias não necessárias.


### Template Method
“Classes abstratas e subclasses (solid)”

O padrão de projeto Template Method é um padrão comportamental que define a estrutura de um algoritmo, permitindo que suas etapas sejam implementadas por subclasses. Ele é útil quando você tem um algoritmo comum com algumas variações nas etapas, e você deseja permitir que as subclasses forneçam implementações específicas para essas etapas.
Aqui está um exemplo em Ruby que demonstra o padrão de projeto Template Method:
```ruby
class AbstractTemplate
  def template_method
    step_1
    step_2
    step_3
  end

  def step_1
    raise NotImplementedError, "Subclasses must implement step_1"
  end

  def step_2
    raise NotImplementedError, "Subclasses must implement step_2"
  end

  def step_3
    raise NotImplementedError, "Subclasses must implement step_3"
  end
end

class ConcreteTemplateA < AbstractTemplate
  def step_1
    puts "ConcreteTemplateA - Step 1"
  end

  def step_2
    puts "ConcreteTemplateA - Step 2"
  end

  def step_3
    puts "ConcreteTemplateA - Step 3"
  end
end

class ConcreteTemplateB < AbstractTemplate
  def step_1
    puts "ConcreteTemplateB - Custom Step 1"
  end
end
```

Neste exemplo:

* AbstractTemplate é a classe abstrata que define o algoritmo em três etapas usando o método template_method. Cada uma das etapas é definida como métodos abstratos (step_1, step_2, step_3) que devem ser implementados pelas subclasses.
* ConcreteTemplateA é uma das subclasses que herda de AbstractTemplate e fornece implementações para todas as três etapas. Isso significa que ele segue o algoritmo do template, mas com implementações específicas.
* ConcreteTemplateB é outra subclasse que herda de AbstractTemplate, mas fornece uma implementação personalizada apenas para step_1. As etapas step_2 e step_3 não são implementadas nesta subclasse, o que significa que elas usarão as implementações padrão definidas na classe abstrata.

Aqui está como você pode usar essas classes:
```rubytemplate_a = ConcreteTemplateA.new
template_a = ConcreteTemplateA.new
template_a.template_method

template_b = ConcreteTemplateB.new
template_b.template_method
```
Quando você chama template_method em uma instância de ConcreteTemplateA, ele executará o algoritmo definido no template com as implementações específicas de ConcreteTemplateA. Por outro lado, quando você chama template_method em uma instância de ConcreteTemplateB, ele usará a implementação personalizada de step_1 de ConcreteTemplateB e as implementações padrão de step_2 e step_3 da classe abstrata.
Isso ilustra como o padrão de projeto Template Method permite que você defina a estrutura de um algoritmo com pontos de extensão personalizados em subclasses.

### Observer
“Observar estados de um objeto, que afete o estado de um segundo objeto.”

O padrão Observer é um padrão de projeto comportamental que define uma relação de um-para-muitos entre objetos, de modo que quando um objeto (o "sujeito") muda de estado, todos os seus observadores são notificados e atualizados automaticamente. Isso é útil quando você tem objetos que precisam reagir a mudanças em outros objetos sem acoplamento direto entre eles. Vou fornecer um exemplo em Ruby que demonstra o padrão Observer:
```ruby
# Subject (Sujeito): O objeto que está sendo observado.
class WeatherStation
  attr_accessor :temperature
  attr_reader :observers

  def initialize
    @observers = []
    @temperature = 0
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def update_temperature(temperature)
    @temperature = temperature
    notify_observers
  end

  def notify_observers
    @observers.each { |observer| observer.update(self) }
  end
end

# Observer (Observador): Os objetos que desejam ser notificados sobre mudanças no sujeito.
class TemperatureDisplay
  def update(weather_station)
    puts "A temperatura atual é #{weather_station.temperature}°C"
  end
end

class PhoneApp
  def update(weather_station)
    puts "Atualização do aplicativo: A temperatura mudou para #{weather_station.temperature}°C"
  end
end

# Criando instâncias
weather_station = WeatherStation.new
display_observer = TemperatureDisplay.new
app_observer = PhoneApp.new

# Registrando observadores
weather_station.add_observer(display_observer)
weather_station.add_observer(app_observer)

# Simulando uma mudança na temperatura
weather_station.update_temperature(25)
```

Neste exemplo:

* WeatherStation é o sujeito que mantém a temperatura atual. Ele tem métodos para adicionar, remover e notificar observadores.
* TemperatureDisplay e PhoneApp são observadores que desejam ser notificados sobre mudanças na temperatura. Eles implementam um método update que é chamado quando o sujeito notifica uma mudança.
* As instâncias de TemperatureDisplay e PhoneApp são registradas como observadores da estação meteorológica.
* Quando a temperatura na estação meteorológica muda (simulada por update_temperature), os observadores são notificados e seus métodos update são chamados.

Isso demonstra como o padrão Observer permite que objetos (observadores) se inscrevam para receber notificações de mudanças em outro objeto (sujeito) sem acoplamento direto. Isso torna o código mais flexível e permite que você estenda a funcionalidade de maneira modular, adicionando ou removendo observadores conforme necessário.

### Adapter
“Ajuda a duas interfaces incompatíveis a trabalhar em conjunto.”

O padrão Adapter é um padrão de projeto estrutural que permite que objetos com interfaces incompatíveis trabalhem juntos. Ele é útil quando você deseja que um objeto funcione com outro objeto que tenha uma interface diferente. Vou fornecer um exemplo em Ruby que demonstra o padrão Adapter:
Imagine que temos uma classe OldSystem com um método legacy_method que precisa ser usado por um novo sistema, mas a interface do novo sistema espera um método chamado new_method. Vamos criar um adaptador para que o novo sistema possa usar o método legacy_method da classe OldSystem.
```ruby
# Classe existente (incompatível com a nova interface)
class OldSystem
  def legacy_method
    "Método legado está funcionando."
  end
end

# Interface esperada pelo novo sistema
class NewSystem
  def new_method
    "Método novo está funcionando."
  end
end

# Adaptador para permitir que OldSystem funcione com NewSystem
class Adapter
  def initialize(old_system)
    @old_system = old_system
  end

  def new_method
    @old_system.legacy_method
  end
end

# Criar instâncias
old_system = OldSystem.new
adapter = Adapter.new(old_system)
new_system = NewSystem.new

# Usar o adaptador para chamar o método novo da interface do novo sistema
result = new_system.new_method
puts result

# Usar o adaptador para chamar o método legado da interface do sistema antigo
legacy_result = adapter.new_method
puts legacy_result
```

Neste exemplo:

* OldSystem é a classe existente que possui o método legacy_method, que é incompatível com a nova interface NewSystem.
* NewSystem é a interface esperada pelo novo sistema, que possui o método new_method.
* Adapter é uma classe adaptadora que recebe uma instância de OldSystem no construtor e implementa o método new_method da interface NewSystem chamando o método legacy_method da instância de OldSystem. Isso permite que OldSystem funcione com a nova interface sem modificar o código original.
* Usando o adaptador, podemos chamar o método new_method da interface do novo sistema e também o método legacy_method da interface do sistema antigo.

O padrão Adapter é útil quando você precisa integrar sistemas existentes com interfaces incompatíveis ou quando deseja criar uma camada de adaptação para permitir que diferentes partes do sistema trabalhem juntas. Isso ajuda a evitar a necessidade de modificar o código existente e a garantir que os sistemas possam colaborar de maneira eficaz.

### Builder
“Cria objetos complexos que são difíceis de configurar.”

O padrão de projeto Builder é um padrão de projeto de criação que separa a construção de um objeto complexo de sua representação, permitindo a criação de objetos com diferentes características sem expor os detalhes complexos de construção. É útil quando você tem objetos com muitos parâmetros de configuração ou quando deseja criar um objeto em etapas. Aqui está um exemplo em Ruby que demonstra o padrão Builder:
```ruby
# Classe que representa um objeto complexo
class Product
  attr_accessor :part1, :part2, :part3

  def initialize
    @part1 = nil
    @part2 = nil
    @part3 = nil
  end

  def display
    puts "Part 1: #{@part1}"
    puts "Part 2: #{@part2}"
    puts "Part 3: #{@part3}"
  end
end

# Builder abstrato
class Builder
  def build_part1
    raise NotImplementedError, "Subclasses must implement build_part1"
  end

  def build_part2
    raise NotImplementedError, "Subclasses must implement build_part2"
  end

  def build_part3
    raise NotImplementedError, "Subclasses must implement build_part3"
  end
end

# ConcretoBuilder que implementa a construção específica
class ConcreteBuilder < Builder
  def initialize
    @product = Product.new
  end

  def build_part1
    @product.part1 = "Part 1"
  end

  def build_part2
    @product.part2 = "Part 2"
  end

  def build_part3
    @product.part3 = "Part 3"
  end

  def get_product
    @product
  end
end

# Diretor que cria o objeto complexo usando o Builder
class Director
  def construct(builder)
    builder.build_part1
    builder.build_part2
    builder.build_part3
  end
end

# Uso do padrão Builder
builder = ConcreteBuilder.new
director = Director.new

director.construct(builder)
product = builder.get_product

product.display
```

Neste exemplo:

* Product é a classe que representa o objeto complexo que desejamos construir. Ela possui várias partes (part1, part2, part3) que precisam ser configuradas.
* Builder é a classe abstrata que define os métodos para construir as partes do objeto complexo. As subclasses do Builder implementarão esses métodos de acordo com a lógica específica de construção.
* ConcreteBuilder é uma implementação específica do Builder que cria um objeto Product. Ele implementa os métodos para construir as partes do objeto Product de acordo com a lógica desejada.
* Director é responsável por orquestrar o processo de construção usando um Builder. Ele chama os métodos do Builder para criar o objeto complexo.
* O código final demonstra a criação de um objeto Product por meio da combinação de um ConcreteBuilder e um Director. O objeto Product é criado passo a passo, e as partes são configuradas conforme a necessidade.

O padrão Builder é útil quando você tem objetos complexos com muitas opções de configuração e permite a criação flexível de objetos complexos de forma organizada e legível. Também permite a criação de diferentes variantes do objeto complexo usando construtores diferentes, sem a necessidade de modificar a classe principal do objeto.

### Command
“Performa uma tarefa específica sem ter qualquer informação do recebedor da requisição.”

O padrão de projeto Command é um padrão de projeto comportamental que encapsula uma solicitação como um objeto, permitindo que você parametrize clientes com solicitações, enfileire solicitações ou registre solicitações e forneça suporte a operações desfazer. Ele é útil quando você deseja desacoplar quem emite uma solicitação de quem a executa.
Aqui está um exemplo em Ruby que demonstra o padrão Command:
```ruby
# Receiver (Destinatário): A classe que realiza a ação real.
class Light
  def turn_on
    puts "Luz ligada."
  end

  def turn_off
    puts "Luz desligada."
  end
end

# Command (Comando): Define uma interface para todos os comandos concretos.
class Command
  def execute
    raise NotImplementedError, "Subclasses must implement execute"
  end
end

# ConcreteCommand (Comando Concreto): Implementa um comando concreto usando um Receiver.
class TurnOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_on
  end
end

class TurnOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.turn_off
  end
end

# Invoker (Executor): Invoca comandos sem conhecer os detalhes do Receiver.
class RemoteControl
  def initialize
    @commands = {}
  end

  def add_command(name, command)
    @commands[name] = command
  end

  def press_button(name)
    command = @commands[name]
    if command
      command.execute
    else
      puts "Botão não configurado."
    end
  end
end

# Uso do padrão Command
light = Light.new
turn_on = TurnOnCommand.new(light)
turn_off = TurnOffCommand.new(light)

remote = RemoteControl.new
remote.add_command("ligar", turn_on)
remote.add_command("desligar", turn_off)

remote.press_button("ligar")   # Aciona o comando de ligar a luz
remote.press_button("desligar") # Aciona o comando de desligar a luz
remote.press_button("pausar")   # Botão não configurado
```

Neste exemplo:

* Light é a classe que realiza a ação real, que é ligar e desligar a luz.
* Command é a classe abstrata que define a interface para todos os comandos concretos.
* TurnOnCommand e TurnOffCommand são comandos concretos que implementam a interface Command. Eles são responsáveis por chamar os métodos turn_on e turn_off do objeto Light.
* RemoteControl é o invocador que armazena os comandos e executa-os sem conhecer os detalhes do Receiver. Ele usa os comandos para ligar ou desligar a luz, e também trata botões não configurados.

O padrão Command permite encapsular solicitações como objetos, fornecendo um nível de interação entre objetos que emitem solicitações e os objetos que as executam. Isso torna o sistema mais flexível e extensível, permitindo que você adicione facilmente novos comandos e evite a necessidade de modificar o código do cliente sempre que desejar adicionar uma nova funcionalidade.

### Decorator
“Varia a responsabilidade de um objeto adicionando algum recurso.”

O padrão de projeto Decorator é um padrão de projeto estrutural que permite adicionar comportamento adicional a objetos individuais, dinamicamente, sem afetar a estrutura da classe subjacente. Ele envolve a criação de uma série de classes decoradoras que são aninhadas e envolvem o objeto original. Cada decorador adiciona responsabilidades ou funcionalidades específicas sem alterar o objeto base. Aqui está um exemplo em Ruby que demonstra o padrão Decorator:
```ruby
# Component (Componente): Define uma interface para os objetos que podem ser decorados.
class Coffee
  def cost
    5
  end

  def description
    "Café simples"
  end
end

# Decorator (Decorador): Mantém uma referência para um objeto Component e define uma interface compatível.
class CoffeeDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost
  end

  def description
    @coffee.description
  end
end

# ConcreteDecorator (Decorador Concreto): Adiciona funcionalidade específica ao objeto Component.
class MilkDecorator < CoffeeDecorator
  def cost
    @coffee.cost + 2
  end

  def description
    @coffee.description + ", com leite"
  end
end

class SugarDecorator < CoffeeDecorator
  def cost
    @coffee.cost + 1
  end

  def description
    @coffee.description + ", com açúcar"
  end
end

# Uso do padrão Decorator
simple_coffee = Coffee.new
puts "Café simples custa #{simple_coffee.cost} reais. Descrição: #{simple_coffee.description}"

milk_coffee = MilkDecorator.new(simple_coffee)
puts "Café com leite custa #{milk_coffee.cost} reais. Descrição: #{milk_coffee.description}"

sugar_milk_coffee = SugarDecorator.new(milk_coffee)
puts "Café com leite e açúcar custa #{sugar_milk_coffee.cost} reais. Descrição: #{sugar_milk_coffee.description}"
```
Neste exemplo:

* Coffee é a classe que representa o componente base. Ela define métodos cost (custo) e description (descrição).
* CoffeeDecorator é a classe decoradora abstrata que mantém uma referência para um objeto Coffee. Ela também implementa os métodos cost e description da interface Component.
* MilkDecorator e SugarDecorator são decoradores concretos que herdam de CoffeeDecorator e adicionam funcionalidades específicas, como adicionar leite ou açúcar ao café. Eles substituem os métodos cost e description para adicionar o custo e a descrição dos ingredientes extras.
* O código final demonstra como criar uma sequência de decoradores para adicionar funcionalidades extras a um café simples. Os decoradores podem ser aninhados de forma flexível para criar diferentes combinações de funcionalidades.

O padrão Decorator é útil quando você precisa adicionar funcionalidades a objetos individualmente e de maneira flexível, sem criar uma hierarquia de subclasses complicada. Ele segue o princípio aberto/fechado do SOLID (Open/Closed Principle), que permite estender o comportamento sem modificar o código existente. Isso torna o código mais modular e fácil de manter.

### Factory
“Cria objetos sem ter que especificar a classe do objeto que irá ser criado.”

O padrão de projeto Factory é um padrão de criação que fornece uma interface para criar objetos em uma superclasse, mas permite que as subclasses alterem o tipo de objetos que serão criados. Ele é útil quando você deseja criar objetos com uma interface comum, mas com comportamentos específicos implementados por subclasses. Vou fornecer um exemplo em Ruby que demonstra o padrão Factory:
```ruby
# Classe Product (Produto): Representa o produto comum que pode ser criado por diferentes fábricas.
class Product
  def initialize(name)
    @name = name
  end

  def description
    "Produto: #{@name}"
  end
end

# Factory (Fábrica): Define a interface para a criação de produtos.
class ProductFactory
  def create_product(name)
    raise NotImplementedError, "As subclasses devem implementar o método create_product."
  end
end

# ConcreteFactory (Fábrica Concreta): Implementa a criação de um tipo específico de produto.
class ConcreteProductFactoryA < ProductFactory
  def create_product(name)
    Product.new("Tipo A - #{name}")
  end
end

class ConcreteProductFactoryB < ProductFactory
  def create_product(name)
    Product.new("Tipo B - #{name}")
  end
end

# Uso do padrão Factory
factory_a = ConcreteProductFactoryA.new
product_a = factory_a.create_product("Produto A")
puts product_a.description

factory_b = ConcreteProductFactoryB.new
product_b = factory_b.create_product("Produto B")
puts product_b.description
```

Neste exemplo:

* Product é a classe que representa o produto comum que pode ser criado por diferentes fábricas. Ela possui um método description para descrever o produto.
* ProductFactory é a classe abstrata que define a interface para a criação de produtos. Subclasses de ProductFactory implementarão o método create_product.
* ConcreteProductFactoryA e ConcreteProductFactoryB são fábricas concretas que herdam de ProductFactory e implementam o método create_product para criar produtos específicos.
* No uso do padrão Factory, duas fábricas concretas (ConcreteProductFactoryA e ConcreteProductFactoryB) são criadas e usadas para criar produtos com comportamentos específicos. O cliente (o código que utiliza as fábricas) chama o método create_product na fábrica apropriada para criar os produtos.

O padrão Factory é útil quando você deseja criar objetos com uma interface comum, mas com diferentes implementações específicas. Ele permite que o código do cliente trabalhe com a interface comum, sem se preocupar com os detalhes da criação de objetos. Isso torna o sistema mais flexível e extensível, pois você pode adicionar novas fábricas para criar diferentes tipos de produtos sem modificar o código existente.

### Interpreter
“Fornece uma linguagem especializada para resolver um problema bem definido de um domínio conhecido.”

O padrão de projeto Interpreter é um padrão de projeto comportamental que é usado para definir a gramática da linguagem e interpretar sentenças em uma linguagem específica. Ele é útil quando você deseja criar um interpretador para uma linguagem personalizada ou ao lidar com expressões regulares, análise de linguagem natural ou outras formas de análise textual. No entanto, a implementação desse padrão pode ser complexa e não é muito comum no desenvolvimento de aplicativos convencionais. Vou fornecer um exemplo simplificado em Ruby que demonstra o conceito do padrão Interpreter:
Neste exemplo, vamos criar um interpretador simples para avaliar expressões aritméticas básicas, como adição e subtração.
```ruby
# Context (Contexto): Define o contexto da interpretação, mantendo informações relevantes.
class Context
  attr_accessor :input, :output

  def initialize(input)
    @input = input
    @output = 0
  end
end

# AbstractExpression (Expressão Abstrata): Define a interface para a interpretação das expressões.
class AbstractExpression
  def interpret(context)
    raise NotImplementedError, "Subclasses devem implementar o método interpret."
  end
end

# TerminalExpression (Expressão Terminal): Implementa a interpretação de valores simples.
class TerminalExpression < AbstractExpression
  def interpret(context)
    context.output = context.input.to_i
  end
end

# NonTerminalExpression (Expressão Não Terminal): Implementa a interpretação de operações aritméticas.
class AddExpression < AbstractExpression
  def interpret(context)
    context.output += context.input
  end
end

class SubtractExpression < AbstractExpression
  def interpret(context)
    context.output -= context.input
  end
end

# Uso do padrão Interpreter
context = Context.new(10)

expression1 = TerminalExpression.new
expression2 = AddExpression.new
expression3 = TerminalExpression.new
expression4 = SubtractExpression.new
expression5 = TerminalExpression.new

expressions = [expression1, expression2, expression3, expression4, expression5]

expressions.each { |expression| expression.interpret(context) }

puts "Resultado: #{context.output}"
```

Neste exemplo:

* Context mantém as informações relevantes para a interpretação, como a entrada e a saída.
* AbstractExpression é a classe abstrata que define a interface para a interpretação de expressões.
* TerminalExpression e NonTerminalExpression são subclasses de AbstractExpression que implementam a interpretação de valores simples e operações aritméticas, respectivamente.
* No uso do padrão Interpreter, as expressões são organizadas em uma sequência e interpretadas uma a uma usando o contexto. A interpretação ocorre conforme a sequência das expressões, permitindo que expressões aritméticas sejam avaliadas.

Este é um exemplo simplificado do padrão Interpreter. Em implementações mais complexas, o padrão Interpreter pode ser usado para interpretar expressões em uma linguagem personalizada ou para construir analisadores mais elaborados.

### Iterator
“Fornece uma maneira de acessar uma coleção de sub objetos sem expor a representação subjacente.”

O padrão de projeto Iterator é um padrão de projeto comportamental que fornece uma maneira de acessar os elementos de um objeto agregado (como uma lista ou coleção) de maneira sequencial, sem expor sua representação interna. O Iterator permite que você percorra os elementos de uma coleção sem se preocupar com os detalhes de como essa coleção é implementada. Vou fornecer um exemplo em Ruby que demonstra o padrão Iterator:
```ruby
# Aggregate (Agregado): Define a interface para criar um objeto iterador.
class Aggregate
  def create_iterator
    raise NotImplementedError, "Subclasses devem implementar o método create_iterator."
  end
end

# ConcreteAggregate (Agregado Concreto): Implementa a interface de criação de um objeto iterador.
class ConcreteAggregate
  attr_reader :data

  def initialize
    @data = []
  end

  def <<(item)
    @data << item
  end

  def create_iterator
    Iterator.new(self)
  end
end

# Iterator (Iterador): Define a interface para acessar e percorrer os elementos.
class Iterator
  def initialize(aggregate)
    @aggregate = aggregate
    @index = 0
  end

  def first
    @index = 0
  end

  def next
    @index += 1
  end

  def current_item
    @aggregate.data[@index]
  end

  def is_done
    @index >= @aggregate.data.length
  end
end

# Uso do padrão Iterator
aggregate = ConcreteAggregate.new
aggregate << "Item 1"
aggregate << "Item 2"
aggregate << "Item 3"

iterator = aggregate.create_iterator

while !iterator.is_done
  puts "Elemento atual: #{iterator.current_item}"
  iterator.next
end
```

Neste exemplo:

* Aggregate é a classe abstrata que define a interface para criar um objeto iterador.
* ConcreteAggregate é uma implementação concreta do agregado. Ele armazena os elementos em um array e implementa o método create_iterator para criar um objeto Iterator.
* Iterator é a classe que define a interface para acessar e percorrer os elementos do agregado. Ele mantém uma referência ao agregado e controla o índice de acesso aos elementos.
* No uso do padrão Iterator, a agregação (neste caso, ConcreteAggregate) cria um iterador (neste caso, Iterator). O iterador é usado para percorrer os elementos da agregação sem expor os detalhes de sua implementação interna.
* O loop while é usado para percorrer os elementos do agregado usando o iterador. O iterador controla o acesso e a iteração pelos elementos.

O padrão Iterator é útil quando você deseja separar o acesso aos elementos de uma coleção de sua implementação interna. Isso torna o código mais flexível e permite que você acesse os elementos de maneira sequencial, independentemente da estrutura subjacente da coleção. É comumente usado em Ruby ao trabalhar com coleções, como arrays e listas, onde você deseja percorrer os elementos sem se preocupar com os detalhes de sua representação interna.


### Proxy
“Nos dá um pouco mais de controle sobre como e onde nós acessamos um certo objeto.”

O padrão de projeto Proxy é um padrão de projeto estrutural que fornece um substituto ou representante para outro objeto para controlar o acesso a ele. Isso é útil quando você deseja adicionar uma camada de controle sobre o acesso a um objeto, como adicionar lógica de cache, restrições de acesso, carregamento preguiçoso ou monitoramento. Vou fornecer um exemplo em Ruby que demonstra o padrão Proxy:
Neste exemplo, criaremos um proxy para um objeto Image para carregar uma imagem apenas quando ela for realmente necessária, economizando recursos.
```ruby
# Subject (Assunto): Define a interface do objeto real e do proxy.
class Image
  def display
    raise NotImplementedError, "Subclasses devem implementar o método display."
  end
end

# RealSubject (Assunto Real): Implementa o objeto real que o proxy representa.
class RealImage < Image
  def initialize(filename)
    @filename = filename
    load_image
  end

  def display
    puts "Exibindo imagem: #{@filename}"
  end

  private

  def load_image
    puts "Carregando imagem: #{@filename}"
    # Simula o carregamento de uma imagem.
  end
end

# Proxy (Proxy): Mantém uma referência ao objeto real e fornece uma interface idêntica.
class ImageProxy < Image
  def initialize(filename)
    @filename = filename
    @real_image = nil
  end

  def display
    load_real_image unless @real_image
    @real_image.display
  end

  private

  def load_real_image
    @real_image = RealImage.new(@filename)
  end
end

# Uso do padrão Proxy
image = ImageProxy.new("sample.jpg")

# A imagem não é carregada até que seja realmente necessária.
image.display

# Quando a imagem é exibida pela primeira vez, ela é carregada.
image.display
```

Neste exemplo:

* Image é a classe abstrata que define a interface para o objeto real e o proxy.
* RealImage é o objeto real que implementa a exibição de imagens. Ele carrega a imagem do disco quando é instanciado.
* ImageProxy é o proxy que mantém uma referência ao objeto real (RealImage). Ele controla o acesso ao objeto real e carrega a imagem apenas quando necessário.
* No uso do padrão Proxy, a imagem não é carregada até que seja solicitada para exibição. O proxy carrega o objeto real (RealImage) apenas quando a exibição é chamada pela primeira vez.

O padrão Proxy é útil em situações em que você deseja adicionar uma camada de controle sobre o acesso a um objeto, como adiar a criação de objetos caros, implementar lógica de cache, monitorar o acesso ou restringir o acesso a certos usuários. Ele permite a implementação de comportamentos adicionais sem modificar a classe do objeto real, tornando o código mais flexível e escalável.


### Strategy
“Varia parte de um algoritmo em tempo de execução.”

O padrão de projeto Strategy é um padrão de projeto comportamental que permite definir uma família de algoritmos, encapsulá-los e torná-los intercambiáveis. Isso permite que o cliente escolha o algoritmo a ser usado em tempo de execução, sem alterar a classe do contexto. Aqui está um exemplo em Ruby que demonstra o padrão Strategy:
Neste exemplo, consideraremos um sistema de cálculo de impostos com diferentes estratégias de cálculo de impostos (imposto sobre vendas, imposto sobre valor agregado, etc.) que podem ser aplicadas a diferentes produtos.
```ruby
# Strategy (Estratégia): Define a interface para todas as estratégias de cálculo de impostos.
class TaxStrategy
  def calculate_tax(product_price)
    raise NotImplementedError, "Subclasses devem implementar o método calculate_tax."
  end
end

# ConcreteStrategy (Estratégia Concreta): Implementa uma estratégia específica de cálculo de impostos.
class SalesTax < TaxStrategy
  def calculate_tax(product_price)
    product_price * 0.1 # Imposto sobre vendas de 10%
  end
end

class VAT < TaxStrategy
  def calculate_tax(product_price)
    product_price * 0.2 # Imposto sobre valor agregado de 20%
  end
end

# Context (Contexto): Mantém uma referência a uma estratégia de cálculo de impostos e a utiliza.
class TaxCalculator
  def initialize(tax_strategy)
    @tax_strategy = tax_strategy
  end

  def calculate(product_price)
    @tax_strategy.calculate_tax(product_price)
  end
end

# Uso do padrão Strategy
product_price = 100.0

# Calcula o imposto sobre vendas
sales_tax_calculator = TaxCalculator.new(SalesTax.new)
sales_tax = sales_tax_calculator.calculate(product_price)
puts "Imposto sobre vendas: #{sales_tax}"

# Calcula o imposto sobre valor agregado
vat_calculator = TaxCalculator.new(VAT.new)
vat = vat_calculator.calculate(product_price)
puts "Imposto sobre valor agregado: #{vat}"
```

Neste exemplo:

* TaxStrategy é a classe abstrata que define a interface para todas as estratégias de cálculo de impostos. Ela declara o método calculate_tax que deve ser implementado pelas estratégias concretas.
* SalesTax e VAT são estratégias concretas que implementam estratégias específicas de cálculo de impostos, como o imposto sobre vendas e o imposto sobre valor agregado. Cada uma implementa o método calculate_tax de acordo com a lógica específica do imposto.
* TaxCalculator é o contexto que mantém uma referência a uma estratégia de cálculo de impostos e a utiliza para calcular o imposto com base no preço do produto.
* No uso do padrão Strategy, criamos instâncias de TaxCalculator com diferentes estratégias de cálculo de impostos e calculamos os impostos com base no preço do produto. O cliente pode escolher qual estratégia de cálculo de impostos usar em tempo de execução, sem modificar o código do contexto.

O padrão Strategy é útil quando você tem várias maneiras de executar uma tarefa e deseja permitir que o cliente escolha a estratégia apropriada com base em suas necessidades. Ele ajuda a evitar a duplicação de código, torna o código mais flexível e facilita a adição de novas estratégias no futuro.

### Chain of Responsibility
O padrão de projeto Chain of Responsibility é um padrão comportamental que permite que você passe solicitações por uma cadeia de manipuladores. Cada manipulador decide se deve processar a solicitação ou passá-la para o próximo manipulador na cadeia. Isso é útil quando você deseja desacoplar o remetente de uma solicitação do receptor e permitir que vários objetos processem a solicitação. Aqui está um exemplo em Ruby que demonstra o padrão Chain of Responsibility:
Neste exemplo, criaremos uma cadeia de manipuladores para aprovar solicitações de compra com base em seu valor.
```ruby
# Handler (Manipulador): Define a interface para os manipuladores e contém uma referência ao próximo manipulador na cadeia.
class PurchaseApprover
  attr_writer :next_approver

  def approve(purchase)
    if can_approve?(purchase)
      puts "#{self.class.name} aprovou a compra de #{purchase.amount} reais."
    elsif @next_approver
      @next_approver.approve(purchase)
    else
      puts "Nenhum manipulador pôde aprovar a compra de #{purchase.amount} reais."
    end
  end

  def can_approve?(purchase)
    raise NotImplementedError, "Subclasses devem implementar o método can_approve?."
  end
end

# ConcreteHandler (Manipulador Concreto): Implementa a lógica de aprovação específica.
class ManagerApprover < PurchaseApprover
  def can_approve?(purchase)
    purchase.amount <= 1000
  end
end

class DirectorApprover < PurchaseApprover
  def can_approve?(purchase)
    purchase.amount <= 5000
  end
end

class CEOApprover < PurchaseApprover
  def can_approve?(purchase)
    true
  end
end

# Request (Solicitação): Representa a solicitação a ser aprovada.
class Purchase
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end
end

# Uso do padrão Chain of Responsibility
manager = ManagerApprover.new
director = DirectorApprover.new
ceo = CEOApprover.new

manager.next_approver = director
director.next_approver = ceo

p1 = Purchase.new(800)
p2 = Purchase.new(3500)
p3 = Purchase.new(10000)

manager.approve(p1)
manager.approve(p2)
manager.approve(p3)
```

Neste exemplo:

* PurchaseApprover é a classe abstrata que define a interface para os manipuladores e contém uma referência ao próximo manipulador na cadeia. Ela também define o método approve, que decide se pode aprovar a compra ou passá-la para o próximo manipulador.
* ManagerApprover, DirectorApprover e CEOApprover são manipuladores concretos que implementam a lógica de aprovação específica. Cada um implementa o método can_approve? para decidir se pode aprovar a compra com base em seu valor.
* No uso do padrão Chain of Responsibility, criamos uma cadeia de manipuladores encadeados. O gerente, diretor e CEO são conectados em ordem, e a solicitação é passada ao longo da cadeia até que seja aprovada ou rejeitada por um manipulador.
* As solicitações de compra (p1, p2 e p3) são processadas pela cadeia de manipuladores. O primeiro manipulador apropriado aprova a compra, ou a solicitação é rejeitada se nenhum manipulador puder aprová-la.

O padrão Chain of Responsibility é útil quando você deseja desacoplar o remetente de uma solicitação de seus receptores e permitir que vários objetos processem a solicitação, com cada manipulador decidindo se pode ou não aprovar a solicitação. Ele facilita a adição ou remoção de manipuladores sem afetar o código do cliente e permite uma lógica de aprovação flexível.

### State
O padrão de projeto State é um padrão comportamental que permite que um objeto altere seu comportamento quando seu estado interno muda. Ele é útil quando um objeto precisa se comportar de maneiras diferentes em diferentes estados e quando você deseja evitar uma grande quantidade de condicionais em seu código. Vou fornecer um exemplo em Ruby que demonstra o padrão State:
Neste exemplo, criaremos um simulador de pedido online que passa por vários estados, como pedido feito, pedido pago e pedido enviado.
```ruby
# Context (Contexto): Mantém uma referência para um objeto State e delega a ele o comportamento específico.
class Order
  attr_accessor :state

  def initialize
    @state = OrderPlacedState.new
  end

  def process
    @state.process(self)
  end
end

# State (Estado): Define uma interface para encapsular o comportamento associado a um estado.
class OrderState
  def process(order)
    raise NotImplementedError, "Subclasses devem implementar o método process."
  end
end

# ConcreteState (Estado Concreto): Implementa o comportamento associado a um estado específico.
class OrderPlacedState < OrderState
  def process(order)
    puts "Pedido colocado. Aguardando pagamento."
    order.state = PaymentReceivedState.new
  end
end

class PaymentReceivedState < OrderState
  def process(order)
    puts "Pagamento recebido. Preparando para envio."
    order.state = OrderShippedState.new
  end
end

class OrderShippedState < OrderState
  def process(order)
    puts "Pedido enviado. Entrega em andamento."
    order.state = OrderDeliveredState.new
  end
end

class OrderDeliveredState < OrderState
  def process(order)
    puts "Pedido entregue com sucesso."
  end
end

# Uso do padrão State
order = Order.new

order.process
order.process
order.process
order.process
```

Neste exemplo:

* Order é o contexto que mantém uma referência para um objeto OrderState e delega a ele o comportamento específico. Inicialmente, o pedido é colocado em OrderPlacedState.
* OrderState é a classe abstrata que define a interface para encapsular o comportamento associado a um estado.
* OrderPlacedState, PaymentReceivedState, OrderShippedState e OrderDeliveredState são estados concretos que implementam o comportamento associado a estados específicos. Cada estado altera o estado do pedido para o próximo passo no processo.
* No uso do padrão State, o pedido passa por uma sequência de estados à medida que é processado. Cada estado é responsável por definir o próximo estado com base no progresso do pedido.

O padrão State é útil quando um objeto precisa se comportar de maneiras diferentes em diferentes estados e quando você deseja evitar condicionais complexos para gerenciar o comportamento do objeto. Ele promove um código mais modular, flexível e extensível, pois permite adicionar novos estados e comportamentos sem afetar o código existente.


## Gang of Four (GOF)
O termo "Gang of Four" (GoF) refere-se a um grupo de quatro autores renomados na área de ciência da computação que escreveram o livro "Design Patterns: Elements of Reusable Object-Oriented Software". O livro foi publicado em 1994 e teve um impacto significativo na comunidade de desenvolvedores de software, tornando-se uma referência essencial para o design de software orientado a objetos. Os quatro autores, muitas vezes referidos como a "Gang of Four," são:

* **Erich Gamma**: É conhecido por seu trabalho no desenvolvimento do Eclipse IDE e pelo desenvolvimento do padrão de projeto Singleton, entre outros.
* **Richard Helm**: Contribuiu para a criação de padrões de projeto, como o Factory Method e o Abstract Factory.
* **Ralph Johnson**: Foi um dos colaboradores ativos na definição dos padrões de projeto, como o Composite e o Observer.
* **John Vlissides**: Fez contribuições importantes para a identificação de padrões, incluindo o padrão de projeto Chain of Responsibility e o padrão de projeto State.

O livro "Design Patterns: Elements of Reusable Object-Oriented Software" é amplamente reconhecido por introduzir 23 padrões de projeto, que são soluções para problemas comuns de design de software. Os padrões de projeto fornecidos no livro são categorizados em três grupos principais:

* **Padrões de Criação**: Tratam da criação de objetos, ajudando a isolar o sistema dos detalhes de como os objetos são criados, compostos e representados. Exemplos incluem o Factory Method, Abstract Factory, Singleton e Prototype.
* **Padrões Estruturais**: Lidam com a composição de classes ou objetos para formar estruturas maiores. Eles ajudam a criar relações entre objetos de forma flexível e eficiente. Exemplos incluem o Adapter, Composite, Proxy e Bridge.
* **Padrões Comportamentais**: Fornecem maneiras de definir a comunicação entre objetos de forma flexível. Eles ajudam a garantir que os objetos possam cooperar de maneira eficiente e reutilizável. Exemplos incluem o Observer, Strategy, Command e State.

![](readme/Design%20Patterns.png)

O livro "Design Patterns" é frequentemente citado como uma leitura obrigatória para qualquer desenvolvedor de software que deseja compreender melhor a orientação a objetos e a criação de sistemas de software robustos e reutilizáveis. Ele fornece exemplos de código em C++ e Smalltalk, mas os conceitos e princípios dos padrões de projeto são amplamente aplicáveis a muitas linguagens de programação, incluindo Ruby.
O legado dos "Gang of Four" e seu livro é duradouro, e os padrões de projeto apresentados no livro continuam a ser uma referência essencial para o desenvolvimento de software orientado a objetos. Eles ajudaram a estabelecer uma linguagem comum para discutir e projetar sistemas de software e promoveram a reutilização e a manutenibilidade do código em toda a indústria de desenvolvimento de software.


## Patterns para Ruby
### Convenção sobre configuração
O padrão "Convenção sobre Configuração" (ou "Convention over Configuration"), frequentemente abreviado como "CoC" ou "Conc" e também conhecido como "Zero Configuration," é um princípio de design de software que enfatiza a redução da necessidade de configuração manual e torna as escolhas sensíveis às convenções predefinidas. Em Ruby, isso é muitas vezes associado ao framework Ruby on Rails, que segue fortemente esse princípio.
A ideia por trás do CoC é que muitas vezes as configurações em um aplicativo são repetitivas e previsíveis. Portanto, em vez de forçar os desenvolvedores a especificar cada detalhe de configuração, o framework ou biblioteca assume certas convenções padrão que cobrem a maioria dos casos de uso comuns. Isso leva a uma maior produtividade e a menos código repetitivo.
No contexto do Ruby on Rails, algumas convenções sobre configuração incluem:
* **Estrutura de Diretórios**: O Rails possui uma estrutura de diretórios bem definida, onde os modelos estão em um diretório, as visualizações em outro, os controladores em outro, etc. Essa estrutura predefinida ajuda a organizar o código de maneira consistente.
* **Nomes de Classes e Tabelas**: Rails segue a convenção de nomear classes de modelo no singular e as tabelas no plural. Por exemplo, se você tem um modelo Book, o Rails espera que a tabela seja chamada books. Isso elimina a necessidade de configurar manualmente essa correspondência.
* **Roteamento Automático**: O Rails usa convenções de nomenclatura para gerar rotas automaticamente. Por exemplo, ao criar um controlador BooksController, você não precisa definir manualmente todas as rotas CRUD (create, read, update, delete) para livros. O Rails gera automaticamente as rotas necessárias com base no nome do controlador.
* **Infraestrutura de Banco de Dados**: Rails utiliza as convenções de ActiveRecord para mapear objetos Ruby para tabelas de banco de dados. Isso significa que, se você seguir as convenções de nomenclatura, a maior parte do mapeamento entre objetos e tabelas é configurada automaticamente.
* **Convenções de Nome de Arquivos e Classes**: Rails espera que os arquivos e classes sigam convenções de nome, facilitando a localização e carregamento automático de código.
* **Helpers e Partials**: Rails fornece helpers e partials (trechos reutilizáveis de visualização) que são automaticamente disponíveis e carregados, seguindo as convenções.
* **Testes e Fixtures**: O Rails fornece convenções para estruturar testes e fixtures, o que torna mais fácil escrever e executar testes.

No geral, o padrão CoC em Ruby e no framework Rails permite que os desenvolvedores se concentrem mais na lógica de negócios de seus aplicativos em vez de configurar todos os detalhes técnicos. Isso leva a um código mais limpo, menos código repetitivo e uma maior produtividade, tornando Ruby on Rails um framework popular para o desenvolvimento web.

### Domain Specific Language (DSL)
O padrão de projeto "Domain-Specific Language" (DSL), que pode ser traduzido como "Linguagem Específica de Domínio," não é estritamente um padrão de projeto no mesmo sentido que o Singleton ou o Observer. Em vez disso, ele se refere a uma abordagem para criar uma linguagem de programação ou uma sintaxe específica para resolver problemas em um domínio de aplicação particular.
Em Ruby, a flexibilidade e a expressividade da linguagem tornam relativamente fácil criar DSLs para atender às necessidades específicas de domínio de seu aplicativo. As DSLs são frequentemente usadas para simplificar tarefas complexas em um domínio específico e tornar o código mais legível e intuitivo.
Aqui estão algumas características de DSLs em Ruby:
* **Expressividade**: Ruby é conhecido por sua sintaxe flexível e legível, o que facilita a criação de DSLs que se parecem com linguagens naturais. Isso torna o código mais fácil de entender e escrever.
* **Metaprogramação**: Ruby oferece recursos avançados de metaprogramação, como definição de métodos dinamicamente, criação de classes e módulos, e manipulação de objetos. Essas capacidades são frequentemente usadas na criação de DSLs.
* **Blocos e Lambdas**: Blocos e lambdas em Ruby são frequentemente usados para criar DSLs. Eles permitem que você defina uma sintaxe mais concisa e específica para uma tarefa particular.
* **Chaining Methods**: O encadeamento de métodos (method chaining) é uma técnica frequentemente usada em DSLs para criar uma sequência de chamadas de métodos que se assemelham a uma linguagem natural.
* **Configuração Declarativa**: Muitas DSLs em Ruby são usadas para configurar ou descrever configurações de aplicativos ou objetos de uma maneira declarativa.

Aqui está um exemplo simples de uma DSL em Ruby para configuração declarativa:
```ruby
class Configuration
  attr_accessor :setting1, :setting2

  def initialize
    @setting1 = 'default_setting1'
    @setting2 = 'default_setting2'
  end
end

class MyDSL
  def initialize
    @configuration = Configuration.new
  end

  def setting1(value)
    @configuration.setting1 = value
  end

  def setting2(value)
    @configuration.setting2 = value
  end

  def get_configuration
    @configuration
  end
end

dsl = MyDSL.new
dsl.setting1('custom_setting1')
dsl.setting2('custom_setting2')

configuration = dsl.get_configuration
puts "Setting 1: #{configuration.setting1}"
puts "Setting 2: #{configuration.setting2}"

```
Neste exemplo, a classe MyDSL permite configurar as configurações setting1 e setting2 de um objeto de configuração Configuration de uma maneira declarativa, tornando-o uma DSL simples para configuração de aplicativos.
Em resumo, as DSLs em Ruby são uma maneira poderosa de criar uma sintaxe específica para um domínio particular e simplificar tarefas complexas, tornando o código mais legível e expressivo. A flexibilidade de Ruby e suas capacidades de metaprogramação tornam a criação de DSLs uma abordagem útil para muitos problemas de domínio.

#### MetaProgramming
A metaprogramação em Ruby é uma técnica poderosa que permite escrever código que modifica ou gera código em tempo de execução. Ruby oferece suporte robusto à metaprogramação, tornando-o um idioma popular para essa abordagem. Várias bibliotecas e frameworks, como Ruby on Rails, fazem uso extensivo da metaprogramação.
A metaprogramação em Ruby é baseada em conceitos como reflexão, monkey patching e avaliação dinâmica de código. Alguns dos principais recursos que tornam a metaprogramação em Ruby eficaz incluem:
* **Reflexão**: Ruby permite que você examine as características e estruturas de classes, módulos e objetos em tempo de execução. Isso inclui a introspecção, que permite obter informações sobre uma classe ou objeto, e a capacidade de manipular métodos, variáveis de instância e constantes.
* **Monkey Patching**: Ruby permite abrir classes e módulos existentes e adicionar ou modificar métodos e comportamento. Isso é conhecido como "monkey patching" e é frequentemente usado para estender ou modificar funcionalidades de bibliotecas existentes.
* **Avaliação Dinâmica de Código**: Ruby permite a avaliação dinâmica de código em tempo de execução usando o método eval, o que permite que você crie e execute código dinamicamente.
* **Criação Dinâmica de Classes e Módulos**: Você pode criar classes e módulos dinamicamente em tempo de execução. Isso é particularmente útil ao criar DSLs ou estruturas flexíveis.
* **Métodos Missing**: Ruby permite que você defina o método method_missing, que é chamado quando um método não é encontrado em um objeto. Isso é útil para tratar chamadas de métodos inexistentes de maneira personalizada.

Aqui está um exemplo simples de metaprogramação em Ruby que usa reflexão para definir dinamicamente métodos:
```ruby
class MyClass
  def initialize
    @data = {}
  end

  def define_method(name, &block)
    self.class.send(:define_method, name, &block)
  end
end

obj = MyClass.new
obj.define_method(:hello) do
  puts "Hello, World!"
end

obj.hello # Chama o método definido dinamicamente
```
Neste exemplo, o método define_method permite que você defina dinamicamente métodos para uma instância de MyClass, usando uma função anônima (bloco). Isso ilustra como você pode usar a metaprogramação em Ruby para criar métodos em tempo de execução.
Embora a metaprogramação em Ruby seja uma ferramenta poderosa, é importante usá-la com responsabilidade, pois pode tornar o código mais difícil de entender e depurar. É crucial documentar adequadamente o código e seguir boas práticas de programação ao fazer uso extensivo da metaprogramação para evitar surpresas e erros difíceis de rastrear.

## Referências
- [Padrões de Projeto em Ruby](https://refactoring.guru/pt-br/design-patterns/ruby)
- [Padrões de Projeto \(Design Patterns - GoF\) - Introdução - Parte 1/45](https://www.youtube.com/watch?v=MqddY6Ochkc&list=PLbIBj8vQhvm0VY5YrMrafWaQY2EnJ3j8H)
- [Identifique Quando e Como Usar o Design Pattern Strategy na Prática](https://youtube.com/watch?v=WPdrnuSHAQs)
- [O Programador Pragmático: De Aprendiz a Mestre](https://www.amazon.com.br/Programador-Pragm%C3%A1tico-Aprendiz-Mestre-ebook/dp/B019HM0H90/?_encoding=UTF8&ref_=pd_wlh&pd_rd_w=Ddp4y&content-id=amzn1.sym.ae4503e4-d79b-4f55-9cce-74403ff8b2f2&pf_rd_p=ae4503e4-d79b-4f55-9cce-74403ff8b2f2&pf_rd_r=G86JXXJC217VZ9BM3SW9&pd_rd_wg=m5Btb&pd_rd_r=9ad65181-57ae-4813-82e8-eca52b8446b8)
- [Padrões de Projetos: Soluções Reutilizáveis de Software Orientados a Objetos](https://www.amazon.com.br/Padr%C3%B5es-Projetos-Solu%C3%A7%C3%B5es-Reutiliz%C3%A1veis-Orientados/dp/8573076100/ref=sr_1_1?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=1T2FRNOZY96KV&keywords=padroes+de+projetos+solucoes+reutilizaveis&qid=1699031454&sprefix=padroes+de+projetos+solucoes+reutilizaveis%2Caps%2C209&sr=8-1&ufe=app_do%3Aamzn1.fos.6d798eae-cadf-45de-946a-f477d47705b9)
- [O Fim dos Design Patterns](https://medium.com/borba-on-software/o-fim-dos-design-patterns-3f3ee87b24f0)

Tags: #Programação/ruby, #Programação/gof, #Programação/design pattern#