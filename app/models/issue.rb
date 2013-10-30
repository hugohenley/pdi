class Issue < Redmine::Base

  def add_custom_field_values(params, usuario_corrente)
    self.custom_field_values = {
        IssueService::CUSTOM_FIELDS_ID[:iduff_solicitante] => usuario_corrente.iduff,
        IssueService::CUSTOM_FIELDS_ID[:setor_proponente] => params["issue"]["setor_proponente"],
        IssueService::CUSTOM_FIELDS_ID[:responsavel_projeto] => params["issue"]["responsavel_projeto"]
    }
  end

end