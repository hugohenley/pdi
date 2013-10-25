class IssuesController < ApplicationController

  def new
  end

  def create
    issue_params = IssueService.new(params["issue"])
    issue_params.generate_needed_params
    issue = Issue.new(issue_params.params)
    issue.custom_field_values = {
        IssueService::CUSTOM_FIELDS_ID[:iduff_solicitante] => usuario_corrente.iduff,
        IssueService::CUSTOM_FIELDS_ID[:setor_proponente] => params["issue"]["setor_proponente"],
        IssueService::CUSTOM_FIELDS_ID[:responsavel_projeto] => params["issue"]["responsavel_projeto"]
    }

    if issue.save
      redirect_to root_path, :notice => "Projeto submetido com sucesso!"
    else
      render :new, :alert => "Houve algum problema com o envio de seus dados."
    end
  end

end
