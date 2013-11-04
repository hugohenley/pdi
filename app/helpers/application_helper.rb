require 'net/https'
require 'open-uri'

module ApplicationHelper

  def nome_completo(cpf)
    uri = URI.parse(WS_DADOS_BASICOS)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.is_a?(URI::HTTPS)
    params = "iduff=#{cpf}&key=#{KEY_DADOS_BASICOS}"
    dados = http.post(uri.request_uri, params)
    doc = Nokogiri::XML(dados.body)
    doc.xpath('//nome').text
  end

end
