#encoding: utf-8
class Orcamento
  attr_accessor :orcamento, :parent_issue_id, :params, :parent_issue_name

  def initialize(orcamento, parent_name, parent_issue_id)
    @orcamento = orcamento
    @parent_issue_name = parent_name
    @parent_issue_id = parent_issue_id
    @params = {}
  end

  def save
    #Orçamento de Custeio
    criar_orcamento("Material de Consumo", orcamento["desc_mat_consumo"], orcamento["valor_mat_consumo"],
                    orcamento["just_mat_consumo"])
    criar_orcamento("Diárias e Passagens", orcamento["desc_diarias"], orcamento["valor_diarias"],
                    orcamento["just_diarias"])
    criar_orcamento("Bolsas/Auxílios (para estudantes da UFF)", orcamento["desc_bolsas_uff"], orcamento["valor_bolsas_uff"],
                    orcamento["jus_bolsas_uff"])
    criar_orcamento("Bolsas/Auxílios (Outros)", orcamento["desc_bolsas_outros"], orcamento["valor_bolsas_outros"],
                    orcamento["jus_bolsas_outros"])
    criar_orcamento("Serviços de Pessoa Jurídica", orcamento["desc_pj"], orcamento["valor_pj"],
                    orcamento["jus_pj"])
    criar_orcamento("Serviços de Pessoa Física", orcamento["desc_pessoa_fisica"], orcamento["valor_pessoa_fisica"],
                    orcamento["jus_pessoa_fisica"])

    #Orçamento de Capital
    criar_orcamento("Equipamentos", orcamento["desc_mat_consumo"], orcamento["valor_mat_consumo"],
                    orcamento["just_mat_consumo"])
    criar_orcamento("Mobiliários", orcamento["desc_mat_consumo"], orcamento["valor_mat_consumo"],
                    orcamento["just_mat_consumo"])
    criar_orcamento("Obras e Instalações", orcamento["desc_mat_consumo"], orcamento["valor_mat_consumo"],
                    orcamento["just_mat_consumo"])
  end

  private
  def formatar_descricao(descricao, valor, justificativa)
    <<-DESCRIPTION

    Descrição: #{descricao}

    Valor: #{valor}

    Justificativa: #{justificativa}

    DESCRIPTION
  end

  def criar_orcamento(nome_orcamento, descricao, valor, justificativa)
    @params["subject"] = "Orçamento de #{nome_orcamento} do projeto #{@parent_issue_name}"
    @params["description"] = formatar_descricao(descricao, valor, justificativa)
    @params["parent_issue_id"] = @parent_issue_id
    issue_params = IssueService.new(@params, :orcamento)
    Issue.create(issue_params.params)
  end


end