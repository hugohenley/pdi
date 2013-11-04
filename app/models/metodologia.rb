# encoding: utf-8
class Metodologia
  attr_accessor :metodologia, :parent_issue_id, :params, :parent_issue_name

  def initialize(metodologia, parent_name=nil, parent_issue_id=nil)
    @metodologia = metodologia
    @parent_issue_name = parent_name
    @parent_issue_id = parent_issue_id
    @params = {}
  end

  def save
    numero_campos = @metodologia["descricao"].size
    for numero in (0..numero_campos - 1) do
      next if metodologia["descricao"][numero].empty?
      @params["subject"] = "Ação #{numero + 1} do projeto #{@parent_issue_name}"
      @params["description"] = generate_description(@metodologia, numero)
      @params["parent_issue_id"] = @parent_issue_id
      issue_params = IssueService.new(@params, "acao")
      Issue.create(issue_params.params)
    end
  end

  def descricao_todas_acoes
    descricao = ""
    numero_campos = @metodologia["descricao"].size
    for numero in (0..numero_campos - 1) do
      next if metodologia["descricao"][numero].empty?
      descricao << generate_description(@metodologia, numero)
    end
    descricao
  end

  private
  def generate_description(metodologia, indice)
    <<-DESCRIPTION

    Descrição: #{metodologia["descricao"][indice]}
    Público: #{metodologia["publico"][indice]}
    Ação 1 Quad (Jan-Abr): #{metodologia["q1acao"][indice]}
    Ação 2 Quad (Mai-Ago): #{metodologia["q2acao"][indice]}
    Ação 3 Quad (Set-Dez): #{metodologia["q3acao"][indice]}

    DESCRIPTION
  end

end