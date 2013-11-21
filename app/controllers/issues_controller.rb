# encoding: utf-8
class IssuesController < ApplicationController

  def new
  end

  def create
    issue_params = IssueService.new(params["issue"], "proposta_projeto", params["metodologia"], params["orcamento"])
    issue_params.generate_needed_params
    issue = Issue.new(issue_params.params)
    issue.add_custom_field_values(params, usuario_corrente)

    begin
      if issue.save
        metodologia = Metodologia.new(params["metodologia"], issue.subject, issue.id)
        metodologia.save

        orcamento = Orcamento.new(params["orcamento"], issue.subject, issue.id)
        orcamento.save

        redirect_to root_path, :notice => "Projeto submetido com sucesso!"
      else
        flash[:error] = "Erro ao submeter os dados."
        render :new
      end
    rescue Exception => e
      flash[:error] = "Houve um problema de comunicação com o servidor. Tente novamente mais tarde."
      render :new
    end
  end

end
