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
  #
  #  Tracker = Tipo de tarefa
  #  Status = Situação das tarefas
  #
  ################################################################

  PROJETOS = {submissao_pdi: 1}
  TIPOS = {proposta_projeto: 1, orcamento: 2, acao: 3}
  STATUS = {nao_avaliado: 1, aprovado: 2, reprovado: 3}
  PRIORIDADE = {normal: 1, alta: 2, baixa: 3, urgente: 4}
  CATEGORIA = {}
  CUSTOM_FIELDS_ID = {iduff_solicitante: 2, vinculo: 3, setor_proponente: 4, responsavel_projeto: 5}

  EXTRA_PARAMS = {project_id: PROJETOS[:submissao_pdi],
                  status_id: STATUS[:nao_avaliado]}

  attr_accessor :params, :orcamento, :metodologia

  def initialize(issue, tipo_proposta, metodologia=nil, orcamento=nil)
    @params = {"issue" => issue}
    @orcamento = orcamento
    @metodologia = metodologia
    EXTRA_PARAMS[:tracker_id] = TIPOS[tipo_proposta]
    @params["issue"].merge!(EXTRA_PARAMS)
  end

  def generate_needed_params
    generate_description
  end

  private
  def generate_description
    description = ""
    description << formatar_objetivos
    description << formatar_justificativa
    description << gerar_indicadores
    description << formatar_parcerias
    description << gerar_metodologia
    description << gerar_orcamento
    description << gerar_titulo_cronograma
    description << gerar_cronograma_desembolso("1o Quadrimestre (Jan-Abril)", @params["issue"]["valor_custeio_1quad"],
                                               @params["issue"]["valor_capital_1quad"])
    description << gerar_cronograma_desembolso("2o Quadrimestre (Mai-Ago)", @params["issue"]["valor_custeio_2quad"],
                                               @params["issue"]["valor_capital_2quad"])
    description << gerar_cronograma_desembolso("3o Quadrimestre (Set-Dez)", @params["issue"]["valor_custeio_3quad"],
                                               @params["issue"]["valor_capital_3quad"])

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

  def gerar_indicadores
    <<-DESCRIPTION
---

h1. Indicadores

Indicador: #{@params["issue"]["indicador1"]}
Meta: #{@params["issue"]["meta1"]}

Indicador: #{@params["issue"]["indicador2"]}
Meta: #{@params["issue"]["meta2"]}

Indicador: #{@params["issue"]["indicador3"]}
Meta: #{@params["issue"]["meta3"]}

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
    description << FormataOrcamento.new(orcamento).material_consumo
    description << FormataOrcamento.new(orcamento).diarias_passagens
    description << FormataOrcamento.new(orcamento).bolsas_uff
    description << FormataOrcamento.new(orcamento).bolsas_outros
    description << FormataOrcamento.new(orcamento).servicos_pj
    description << FormataOrcamento.new(orcamento).servicos_pf
    description << calcular_custeio_total
    description << ""

    description << FormataOrcamento.new(orcamento).equipamentos
    description << FormataOrcamento.new(orcamento).mobiliarios
    description << FormataOrcamento.new(orcamento).obras_instalacoes
    description << calcular_capital_total
    <<-DESCRIPTION
---

h1. Orçamento

#{description}

    DESCRIPTION
  end

  def calcular_custeio_total
    total = orcamento["valor_mat_consumo"].to_f + orcamento["valor_diarias"].to_f + orcamento["valor_bolsas_uff"].to_f + orcamento["valor_bolsas_outros"].to_f
    total += orcamento["valor_pj"].to_f + orcamento["valor_pessoa_fisica"].to_f
    "Custeio Total: R$#{total.to_s}"
  end

  def calcular_capital_total
    total = orcamento["valor_equipamentos"].to_f + orcamento["valor_mobiliarios"].to_f + orcamento["valor_obras"].to_f
    "Capital Total: R$#{total.to_s}"
  end

  def formatar_parcerias
    <<-DESCRIPTION

h1. Parcerias

Parceiro 1: #{@params["issue"]["parceiro1"]}
Contato 1 : #{@params["issue"]["contato1"]}

Parceiro 2: #{@params["issue"]["parceiro2"]}
Contato 2 : #{@params["issue"]["contato2"]}

Parceiro 3: #{@params["issue"]["parceiro3"]}
Contato 3 : #{@params["issue"]["contato3"]}

    DESCRIPTION
  end

  def gerar_metodologia
    <<-DESCRIPTION
    h1. Metodologia

#{Metodologia.new(metodologia).descricao_todas_acoes}
    DESCRIPTION
  end

  def gerar_titulo_cronograma
    <<-DESCRIPTION
---

h1. Cronograma de desembolso

    DESCRIPTION
  end

  def gerar_cronograma_desembolso(titulo, custeio, capital)
    <<-DESCRIPTION
h2. #{titulo}

Custeio: #{custeio}
Capital: #{capital}
Total: R$#{custeio.to_f + capital.to_f}

    DESCRIPTION
  end


end