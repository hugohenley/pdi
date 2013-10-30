# encoding: utf-8
class IssuesController < ApplicationController

  def new
  end

  def create
    issue_params = IssueService.new(params["issue"], :proposta_projeto)
    issue_params.generate_needed_params
    issue = Issue.new(issue_params.params)
    issue.add_custom_field_values(params, usuario_corrente)

    if issue.save
      metodologia = Metodologia.new(params["metodologia"], issue.subject, issue.id)
      metodologia.save
      redirect_to root_path, :notice => "Projeto submetido com sucesso!"
    else
      render :new, :alert => "Houve algum problema com o envio de seus dados."
    end
  end

end
