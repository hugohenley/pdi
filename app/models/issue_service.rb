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

    @params["issue"]["description"] = description
  end

  def formatar_objetivos
    <<-DESCRIPTION
{{>toc}}

h1. Objetivos

#{@params["issue"]["objetivos"]}

    DESCRIPTION
  end

  def formatar_metodologias
    <<-DESCRIPTION
---

h1. Justificativa

#{@params["issue"]["justificativa"]}

    DESCRIPTION
  end

  def formatar_orcamento
    <<-DESCRIPTION
---

h1. Justificativa

#{@params["issue"]["justificativa"]}

    DESCRIPTION
  end

  def formatar_cronograma_desembolso
    <<-DESCRIPTION
---

h1. Justificativa

#{@params["issue"]["justificativa"]}

    DESCRIPTION
  end

  def formatar_justificativa
    <<-DESCRIPTION
---

h1. Justificativa

#{@params["issue"]["justificativa"]}

    DESCRIPTION
  end





end