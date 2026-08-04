import SwiftUI

struct ComponentesInterativosView: View {
    // Estados que controlam a interação dos botões e seletores
    @State private var estaAtivo: Bool = false
    @State private var quantidade: Int = 1
    @State private var progresso: Double = 30.0
    @State private var selecaoOpcao: String = "Opção A"
    @State private var dataSelecionada: Date = Date()
    @State private var cliquesBotao: Int = 0
    
    var body: some View {
        Form {
            // Seção de Ações de Cliques e Links
            Section("Ações e Links") {
                // Button: Muda o estado 'cliquesBotao' a cada toque
                Button(action: {
                    cliquesBotao += 1
                }) {
                    Text("Cliques no Botão: \(cliquesBotao)")
                        .bold()
                }
                
                // Link: Abre uma URL externa
                Link("Documentação Apple", destination: URL(string: "https://apple.com")!)
            }
            
            // Seção de Controles Numéricos e Binários
            Section("Controles Numéricos e Binários") {
                // Toggle: Altera entre verdadeiro e falso
                Toggle("Ativar Modo Escuro", isOn: $estaAtivo)
                
                // Stepper: Incrementa ou decrementa a quantidade
                Stepper("Quantidade: \(quantidade)", value: $quantidade, in: 1...10)
                
                // Slider: Controla um valor decimal arrastando a barra
                VStack(alignment: .leading) {
                    Text("Progresso: \(Int(progresso))%")
                    Slider(value: $progresso, in: 0...100)
                }
            }
            
            // Seção de Seletores Avançados
            Section("Seletores") {
                // Picker: Menu de seleção de opções
                Picker("Escolha uma Opção", selection: $selecaoOpcao) {
                    Text("Opção A").tag("Opção A")
                    Text("Opção B").tag("Opção B")
                    Text("Opção C").tag("Opção C")
                }
                .pickerStyle(.menu)
                
                // DatePicker: Abre o calendário nativo do iOS
                DatePicker("Escolha uma Data", selection: $dataSelecionada, displayedComponents: .date)
            }
        }
    }
}

#Preview {
    ComponentesInterativosView()
}
