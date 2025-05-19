# Teste Técnico - Gestão de Mesas (Flutter)

Este projeto tem como objetivo avaliar desenvolvedores Flutter, com foco em gerenciamento de estado, construção de interfaces e reutilização de componentes. O objetivo é criar um sistema para gerenciar mesas de restaurante, onde cada mesa pode ter múltiplos clientes vinculados.

## Visão Geral do Projeto

A aplicação consiste em uma lista de mesas de um restaurante. Cada mesa (`TableEntity`) possui os seguintes atributos:

- **id**: Um identificador único para a mesa (número inteiro).
- **identification**: Uma string usada para identificar a mesa.
- **customers**: Uma lista de clientes (`CustomerEntity`) associados à mesa.

### Requisitos

O candidato deve implementar as seguintes funcionalidades:

1. **Gerenciamento de Estado com MobX**:
   - Deve ser criada uma store principal (TablesStore) para gerenciamento de todas as mesas.
   - Cada mesa deve ter sua própria store (TableStore), com suas propriedades (`identification` e `customers`) sendo observáveis.
   - Ao adicionar/editar uma mesa, a store (TableStore) deve ser adicionada a uma lista observável dentro da store principal (TablesStore).
   - Utilize propriedades computadas quando necessário para evitar cálculos desnecessários durante o processo de renderização.

2. **Gerenciamento de Mesas**:
   - Renderizar a lista de mesas usando a store do MobX.
   - Permitir que os usuários adicionem novas mesas ou editem mesas existentes através de um modal.

3. **Implementação do Modal**:
   - Implementar um modal para criação e edição de mesas, com base no design fornecido (ver link do Figma nas Notas), reutilizando os componentes já disponíveis no projeto.
   - O campo `identification` deve ser editável.
   - O campo `Quantidade de pessoas` deve ser somente leitura e deve ser atualizado utilizando os botões `+/-`, com um valor mínimo de 0.
   - Quando um slot de cliente não estiver selecionado, deve ser exibido um campo de entrada com dropdown para pesquisar entre os clientes cadastrados.
   - Quando o slot estiver preenchido, deve exibir as informações do cliente conforme o design.

4. **Gerenciamento de Clientes**:
   - Exibir uma lista de clientes vinculados a cada mesa. Se um slot de cliente não estiver preenchido, deve exibir um placeholder no formato `Cliente {index+1}` para o nome e `Não informado` para o número de telefone.
   - Ao clicar em um cliente não atribuído, deve abrir um dropdown permitindo que o usuário selecione e pesquise um cliente existente da `CustomersStore` ou cadastre um novo.
   - O modal para adicionar/editar clientes já está implementado e pode ser reutilizado.

5. **Busca de mesas/clientes**
   - A busca presente na tela inicial deve localizar mesas que contenham o termo digitado no identificador ou em nomes/telefones de clientes vinculados à mesa.

### Versão do Flutter e Dart

- **Flutter**: versão 3.27.*
- **Dart**: versão 3.6.*

### Como Executar o Projeto

1. Clone o repositório.
2. Execute `flutter pub get` para instalar as dependências.
3. Execute `dart run build_runner build` para gerar arquivos adicionais das stores Mobx.
4. Use `flutter run` para iniciar a aplicação.

### Build para Windows

Este projeto está configurado para gerar build para a plataforma Windows. Verifique se todas as dependências específicas do Windows estão corretamente instaladas e configuradas antes de gerar o build.

### Entrega do Projeto

O candidato deve realizar um fork deste repositório, implementar as funcionalidades requeridas e enviar o link do repositório público com o código final.

### Notas

- [Link para design no Figma](https://www.figma.com/design/CUAX5R7iffWvB35mCCQ6hl/Teste-flutter---alloy?node-id=0-1&t=tBoKfYXv1RFNR8QM-1)
- Os componentes de UI para o modal e gerenciamento de clientes já estão fornecidos e podem ser reutilizados na implementação.
- O candidato deve focar na implementação do gerenciamento de estado e garantir que todas as mesas e clientes sejam corretamente gerenciados dentro de suas respectivas stores.

### Critérios de Avaliação

- Implementação correta do gerenciamento de estado com MobX.
- Adesão a interface proposta no Figma, detalhes de hovers, splashs e demais finalizações gráficas.
- Qualidade do código, com nomenclatura clara para funções e variáveis.
- Reutilização de componentes, classes, extensões e temas disponíveis no projeto.
