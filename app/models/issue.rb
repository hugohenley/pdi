class Issue < ActiveResource::Base
  self.site = URL_PDI
  self.element_name = "issue"
  self.user = LOGIN_PDI["user"]
  self.password = LOGIN_PDI["password"]


end