class Sessao
  attr_reader :iduff, :ip

  def initialize(iduff, ip)
    #if iduff == "12145542701"
    @iduff, @ip = iduff, ip
    #else
    #  raise "Usuário não autorizado no sistema."
    #end
  end

  def to_s
    #TODO: Mudar o to_s
    "Iduff: #{iduff}; IP: #{ip}"
  end
end
