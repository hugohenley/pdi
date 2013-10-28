# encoding: utf-8
class IssueService

  ################################################################
  # Documentation: http://www.redmine.org/projects/redmine/wiki/Rest_Issues
  # The attributes to send to redmine server are described below:
  # Issue - A hash of the issue attributes:
  # project_id
  # tracker_id
  # status_id
  # priority_id
  # subject
  # description
  # category_id
  # fixed_version_id - ID of the Target Versions (previously called 'Fixed Version' and still referred to as such in the API)
  # assigned_to_id - ID of the user to assign the issue to (currently no mechanism to assign by name)
  # parent_issue_id - ID of the parent issue
  # custom_fields - See Custom fields
  # watcher_user_ids - Array of user ids to add as watchers (since 2.3.0)
  #
  # For custom fields, the format is describe below:
  #{"issue":
  #    {
  #        "id":8471,
  #    ...
  #    "custom_fields":
  #    [
  #        {"value":"1.0.1","name":"Affected version","id":1},
  #        {"value":"Fixed","name":"Resolution","id":2}
  #    ]
  #    }
  #}
  ################################################################

  PROJETOS = {submissao_pdi: 1}
  TIPOS = {proposta_projeto: 1}
  STATUS = {nao_avaliado: 1, aprovado: 2, reprovado: 3}
  PRIORIDADE = {normal: 1, alta: 2, baixa: 3, urgente: 4}
  CATEGORIA = {}
  CUSTOM_FIELDS_ID = {iduff_solicitante: 2, vinculo: 3, setor_proponente: 4, responsavel_projeto: 5}

  EXTRA_PARAMS = {project_id: PROJETOS[:submissao_pdi],
                  tracker_id: TIPOS[:proposta_projeto],
                  status_id: STATUS[:nao_avaliado]}

  #,
  #custom_fields: [ {:value => "12439331783", :name => "iduff_solicitante", :id => 2} ] }

  attr_accessor :params

  def initialize(params)
    @params = {"issue" => params}
  end

  def generate_needed_params
    generate_description
    @params["issue"].merge!(EXTRA_PARAMS)
  end

  private
  def generate_description
    description = ""
    description << formatar_objetivos
    description << formatar_justificativa
    #description << formatar_indicadores
    #description << formatar_parcerias
    description << formatar_metodologia("Ação 1", "Inicio 1", "Fim 1")
    description << gerar_orcamento
    description << gerar_titulo_cronograma
    description << gerar_cronograma_desembolso("1o Quadrimestre (Jan-Abril)", "custeio", "capital", "total")
    description << gerar_cronograma_desembolso("2o Quadrimestre (Mai-Ago)", "custeio", "capital", "total")
    description << gerar_cronograma_desembolso("3o Quadrimestre (Set-Dez)", "custeio", "capital", "total")

    @params["issue"]["description"] = description
  end

  def formatar_objetivos
    <<-DESCRIPTION
{{>toc}}

h1. Objetivos

#{@params["issue"]["objetivos"]}

    DESCRIPTION
  end

  def formatar_justificativa
    <<-DESCRIPTION
---

h1. Justificativa

#{@params["issue"]["justificativa"]}

    DESCRIPTION
  end

  def formatar_metodologia(acao, inicio, fim)
    <<-DESCRIPTION
---

h1. Metodologia

Ação: #{acao}
Início: #{inicio}
Fim: #{fim}

    DESCRIPTION
  end

  def gerar_orcamento
    description = ""
    description << formatar_tipo_orcamento("Custeio(Total)", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Material de Consumo", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Diárias de Passagens", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Bolsa UFF", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Bolsa (outros)", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Serviço de Pessoa Jurídica", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Serviço de Pessoa Física", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Capital (Total)", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Equipamentos", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Mobiliários", "descricao", "valor", "justificativa")
    description << formatar_tipo_orcamento("Obras e Instalações", "descricao", "valor", "justificativa")
    <<-DESCRIPTION
---

h1. Orçamento

#{description}

    DESCRIPTION
  end

  def formatar_tipo_orcamento(tipo, descricao, valor, justificativa)
    <<-DESCRIPTION

h2. #{tipo}

Descrição: #{descricao}
Valor: #{valor}
Justificativa: #{justificativa}

    DESCRIPTION
  end

  def gerar_titulo_cronograma
    <<-DESCRIPTION
---

h1. Cronograma de desembolso

    DESCRIPTION
  end

  def gerar_cronograma_desembolso(titulo, custeio, capital, total)
    <<-DESCRIPTION
h2. #{titulo}

Custeio: #{custeio}
Capital: #{capital}
Total: #{total}

    DESCRIPTION
  end




end