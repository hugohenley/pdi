#encoding: utf-8
class FormataOrcamento

  attr_accessor :orcamento

  def initialize(orcamento)
    @orcamento = orcamento
  end

  #Orçamento de Custeio
  def material_consumo
    formatar_descricao(orcamento["desc_mat_consumo"], orcamento["valor_mat_consumo"],
                       orcamento["just_mat_consumo"], "Material de Consumo")
  end

  def diarias_passagens
    formatar_descricao(orcamento["desc_diarias"], orcamento["valor_diarias"], orcamento["just_diarias"], "Diárias e Passagens")
  end

  def bolsas_uff
    formatar_descricao(orcamento["desc_bolsas_uff"], orcamento["valor_bolsas_uff"], orcamento["jus_bolsas_uff"],
                       "Bolsas/Auxílios (para Estudantes da UFF)")
  end

  def bolsas_outros
    formatar_descricao(orcamento["desc_bolsas_outros"], orcamento["valor_bolsas_outros"], orcamento["jus_bolsas_outros"],
                       "Bolsas/auxílios (Outros)")
  end

  def servicos_pj
    formatar_descricao(orcamento["desc_pj"], orcamento["valor_pj"], orcamento["jus_pj"], "Serviços de Pessoa Jurídica")
  end

  def servicos_pf
    formatar_descricao(orcamento["desc_pessoa_fisica"], orcamento["valor_pessoa_fisica"], orcamento["jus_pessoa_fisica"],
                       "Serviços de Pessoa Física")
  end

  #Orçamento de Capital
  def equipamentos
    formatar_descricao(orcamento["desc_equipamentos"], orcamento["valor_equipamentos"], orcamento["jus_equipamentos"],
                       "Equipamentos")
  end

  def mobiliarios
    formatar_descricao(orcamento["desc_mobiliarios"], orcamento["valor_mobiliarios"], orcamento["jus_mobiliarios"],
                       "Mobiliários")
  end

  def obras_instalacoes
    formatar_descricao(orcamento["desc_obras"], orcamento["valor_obras"], orcamento["jus_obras"], "Obras")
  end

  private
  def formatar_descricao(descricao, valor, justificativa, titulo=nil)
    <<-DESCRIPTION

h2. #{titulo}

    Descrição: #{descricao}
    Valor: #{valor}
    Justificativa: #{justificativa}

    DESCRIPTION
  end
end