#encoding: utf-8
module IssuesHelper
  def indicadores
    {
        'PERSPECTIVA – RESULTADOS INSTITUCIONAIS' => [
            [
                "IGC=αG+{(1–α)β÷2}(M+5)+{1–α)(1–β)÷3}(D+10)"
            ],
            [
                "% de programas de pós-graduação stricto sensu com conceito maior ou igual a 5"
            ],
            [
                "No. de alunos recebidos em programas de mobilidade acadêmica (nacional e internacional)"
            ],
            [
                "Número de convênios com instituições (locais, nacionais, internacionais)"
            ],
            [
                "% de publicações em revistas Qualis A ou B1"
            ],
            [
                "No. de periódicos da UFF Qualis A ou B1"
            ],
            [
                "% de acessos (locais, nacionais, internacionais) às páginas da UFF"
            ],
            [
                "No de eventos (locais, nacionais, internacionais) organizados pela UFF"
            ],
            [
                "No. de pesquisadores bolsistas produtividade em pesquisa"
            ],
            [
                "No. de pesquisadores bolsistas produtividade em pesquisa nível 1"
            ],
            [
                "NFG = Número de alunos graduação formados"
            ],
            [
                "NFP= Número de alunos de pós-graduação (stricto sensu) formados"
            ],
            [
                "NQ= Número de alunos de pós-graduação formados em cursos da UFF com conceitos maiores ou iguais a 5"
            ],
            [
                "No. de alunos que participam de programas acadêmicos"
            ],
            [
                "No. de alunos da UFF em programas de mobilidade acadêmica"
            ]
        ],
        'PERSPECTIVA – TECNOLOGIA E INFRAESTRUTURA' => [
            [
                "% de programas de manutenção realizados/solicitados"
            ],
            [
                "%. de programas de manutenção corretiva e preventiva realizados / programados"
            ],
            [
                "No. de projetos de modernização ou de expansão da infraestrutura física pós-expansão"
            ],
            [
                "No. de obras a serem consolidadas do REUNI"
            ],
            [
                "% de obras de modernização ou de expansão da infraestrutura física executados"
            ],
            [
                "% de salas de aula equipadas adequadamente (temp, iluminação e recursos audio-visuais)"
            ],
            [
                "% de incremento de investimentos em laboratórios didáticos"
            ],
            [
                "% Adequação dos ambientes para a acessibilidade"
            ],
            [
                "No. de projetos de TI executados"
            ],
            [
                "% projetos de TI executados/planejado"
            ],
            [
                "No. de licenças de software adquiridas"
            ],
            [
                "No. de projetos aprovados de criação de laboratórios multiusuários"
            ],
            [
                "No. de laboratórios implementados com caráter multiusuário"
            ],
            [
                "No. de laboratórios multiusuários com projetos que atendam à indissociabilidade de ensino, pesquisa e extensão"
            ],
            [
                "No. de processos de trabalho implantados no sistema"
            ],
            [
                "No. de documentos geridos pelo sistema"
            ],
            [
                "% incremento no número de obras digitais adquiridas"
            ],
            [
                "% incremento no número de obras impressas adquiridas"
            ],
            [
                "No. de alunos matriculados no Ensino a Distância"
            ],
            [
                "No. de projetos de produção de novas tecnologias educacionais em desenvolvimento"
            ],
            [
                "No.de produtos gerados"
            ],
            [
                "No. de bases de dados integradas"
            ],
            [
                "No. de consultas realizadas"
            ]
        ],
        'PERSPECTIVA – PROCESSOS INTERNOS' => [
            [
                "No. de artigos em periódicos com corpo editorial publicados"
            ],
            [
                "No. de livros publicados"
            ],
            [
                "No. de capítulos de livros publicados"
            ],
            [
                "No. de solicitação de patentes"
            ],
            [
                "No de programas de pós-graduação stricto sensu"
            ],
            [
                "No de programas de pós-graduação stricto sensu com conceito maior ou igual a 5"
            ],
            [
                "No. de alunos da UFF que participam de programas de mobilidade internacional (ensino, pesquisa, extensão)"
            ],
            [
                "No. de alunos estrangeiros que participam de programas demobilidade (ensino, pesquisa, extensão)"
            ],
            [
                "No. de convênios de âmbito internacional"
            ],
            [
                "No. de projetos implementados voltados para a redução de desperdício dos recursos naturais"
            ],
            [
                "No. de eventos que disseminam os conceitos de sustentabilidade"
            ],
            [
                "Taxa de sucesso na graduação (TSG)"
            ],
            [
                "No de estudantes atendidos pelos programas de redução da retenção dos estudantes"
            ],
            [
                "No de estudantes atendidos por programas de nivelamento acadêmico para novos alunos"
            ],
            [
                "No. de alunos que participam de programas acadêmicos"
            ],
            [
                "% de Unidades com estrutura administrativa racionalizada"
            ],
            [
                "% de cursos de graduação com estrutura curricular racionalizada"
            ],
            [
                "No. de Unidades administrativas que realizaram mapeamento dos processos"
            ]
        ],
        'PERSPECTIVA - PESSOAS' => [
            [
              "No. de Ações realizadas pela Seção de Prevenção Sócio-Funcional"
            ],
            [
                "% de servidores atendidos por Programas relativos à Qualidade de Vida"
            ],
            [
                "% de satisfação do servidor com o Programa"
            ],
            [
                "% de servidores atendidos por programas de Valorização profissional"
            ],
            [
                "% de satisfação do servidor com os Programas"
            ],
            [
                "% de evasão de TAs"
            ],
            [
                "% de servidores capacitados"
            ],
            [
                "% de servidores qualificados"
            ],
            [
                "IQCD: (5D+3M+2E+1G) / (D+M+E+G)"
            ],
            [
                "Índice de implementação de processo avaliativo de docente, envolvendo auto-avaliação, pares, chefia e alunos"
            ],
            [
                "Índice de implementação de processo avaliativo de técnico-administrativo, envolvendo auto-avaliação, pares, chefia e clientes"
            ],
            [
                "% de unidades com competências mapeadas para TAs"
            ],
            [
              "% de implementação do modelo para TAs"
            ],
            [
                "% de perfis identificados dos TAs, por cargo dentro de cada setor"
            ],
            [
                "% de unidades com lotação ideal em relação ao perfil definido"
            ],
            [
                "% de implementação dos processos de lotação de TAs com base nos resultados da análise da força de trabalho"
            ],
            [
                "% de implementação dos processos de lotação de docentes com base nos resultados da análise da força de trabalho"
            ],
            [
                "No de eventos voltados ao desenvolvimento de servidores para ações de planejamento, programação e controle"
            ]
        ]
    }
  end
end
