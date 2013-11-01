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
    criar_orcamento("Material de Consumo",FormataOrcamento.new(orcamento).material_consumo)
    criar_orcamento("Diárias e Passagens", FormataOrcamento.new(orcamento).diarias_passagens)
    criar_orcamento("Bolsas/Auxílios (para estudantes da UFF)", FormataOrcamento.new(orcamento).bolsas_uff)
    criar_orcamento("Bolsas/Auxílios (Outros)", FormataOrcamento.new(orcamento).bolsas_outros)
    criar_orcamento("Serviços de Pessoa Jurídica", FormataOrcamento.new(orcamento).servicos_pj)
    criar_orcamento("Serviços de Pessoa Física", FormataOrcamento.new(orcamento).servicos_pf)
    criar_orcamento("Equipamentos", FormataOrcamento.new(orcamento).equipamentos)
    criar_orcamento("Mobiliários", FormataOrcamento.new(orcamento).mobiliarios)
    criar_orcamento("Obras e Instalações", FormataOrcamento.new(orcamento).obras_instalacoes)
  end

  private
  def criar_orcamento(nome_orcamento, descricao)
    unless descricao.empty?
      @params["subject"] = "Orçamento de #{nome_orcamento} do projeto #{@parent_issue_name}"
      @params["description"] = descricao
      @params["parent_issue_id"] = @parent_issue_id
      issue_params = IssueService.new(@params, :orcamento)
      Issue.create(issue_params.params)
    end
  end
end