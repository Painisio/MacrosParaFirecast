--[[
Macro para calculo de Critico e Dano Critico para Tormenta RPG.
Escrita em Lua, para o Firecast 8.1b.

Escrito por Painisio com Colaboração de Andrius (Erros Críticos) e Caetano no departamento de tirar duvidas e colorir as fontes!
Meu sincero agradecimento aos dois! S2
]]--

D20 = rolar("1d20") -- rolagem pura
Dano_base = rolar(sheet.atkdn1) -- dano da arma puro
Crit_mult = 0 -- multiplicador de critico da arma
Bonus_magico = 0 -- bonus magico se houver proprio da arma NÃO ALTERAR
ForcaDoTouro = 0 -- NÃO PREENCHER
Investida = 0 -- Não PREENCHER
Flanqueando = 0 -- Não PREENCHER

local indices, textos = chooseMultiple("Usando manobras?", {"Investida", "Flanqueando", "Não"});
for i = 1, #indices, 1 do
    escrever("O jogador está usando: " .. textos[i]);
    if indices[i] == 1 then
        local investida = Investida +2;
        send("Usando Investida! Lembrando que impõe -2 na CA!")
    elseif indices[i] == 2 then
        local flanqueando = Flanqueando +2;
    elseif indices[i] == 3 then
        send("Atacando sem palhaçada!")
  end;
end;

if confirmYesNo("Bonus de Magia?") then
    if confirmYesNo("Sob Efeito da Magia Força do Touro?") then -- Magia força do touro pode acrescentar acerto e dano!
        ForcaDoTouro = 2;
        send("Sob Efeito da Magia Força do Touro")
    end
    
    if confirmYesNo("Arma Mágica?") then
        local indices2, textos2 = choose("Qual o bonus da Arma?",{"+1", "+2", "+3", "+4", "+5"}); -- okay
            Bonus_magico = indices2
            send("Bonus da Arma: ".. textos2)
    end;
end;

local indices3, textos3 = choose("Qual o multiplicador de Crítico da Arma?", {"x2", "x3", "x4", "x5"});
    Crit_mult = indices3 + 1
    send("Multiplicador de Crítico da Arma: ".. textos3)  

if D20 == 1 then
    send("Erro CRÍTICO!!!")
    local resultado = rolar("1d100", "NIMB"); 

        if (resultado == 1) then

                enviar("Estensa atividade cerebral extraplanar chega até você. Você ganha conhecimento muito avançado para os padrões artonianos. Você fica atordoado por " .. math.random (1 , 6) .. " rodada(s), mas após isso recebe um bônus permanente de +1 em Inteligência(1), Sabedoria(2) ou Carisma(3). sendo o Bônus em: " .. math.random (1 , 3) .. " ");
                
        elseif (resultado == 2) then

                enviar("A alça do seu escudo se desprende. Você pode deixar o escudo cair e não sofrer penalidades, ou lutar desta formae sofrer uma penalidade de –2 em jogadas de ataque e de –1 em CA.");

        elseif (resultado == 3) then

                enviar("Subitamente, você nota que está muito fora de forma, e lembra que passou a última semana enfurnado na taverna, comendo e bebendo demais. Você fica exausto até o fim do combate.");

        elseif (resultado == 4) then

                enviar("Momento desastroso: você é atingido por uma onda súbita de azar e incompetência generalizada. Role duas vezes nesta tabela.");

        elseif (resultado == 5) then

                enviar("Em um movimento louco que irá entrar para os anais dos manuais de combate, você embainha sua arma sem querer.");

        elseif (resultado == 6) then

                enviar("Você tropeça em alguma coisa e cai de cara no chão. Com o rosto amassado, você sofre 2 pontos de dano em Carisma, além de ficar caído.");

        elseif (resultado == 7) then

                enviar("Cheiro ruim: quem foi? Não importa, você fica enjoado por " .. math.random (1 , 3) .." rodada(s). Durante este tempo, você também sofre uma penalidade de –2 em testes de Fortitude.");

        elseif (resultado == 8) then

                enviar("Ataque de riso! Você subitamente acha muita graça de algo, sofrendo os efeitos da magia riso histérico por " .. math.random (1 , 4) .. " rodada(s). Aposto que na mesa de jogo o único que não estárindo é você!");

        elseif (resultado == 9) then

                enviar("Cãibra na perna esquerda: seu deslocamento é reduzido à metade. Caso você não tenha a perna direita, cai no chão. Se estiver na água, sofre –4 em testes para nadar.");

        elseif (resultado == 10) then

                enviar("Uma velha ferida se abre... De novo! Você perde 5 PV e fica abalado por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 11) then

                enviar("Casca de banana: um clássico! Você cai de costas no chão e perde " .. math.random (1 , 6) .. " PV.");

        elseif (resultado == 12) then

                enviar("Ops! Você pisa em um inseto grande e nojento. Perca uma rodada tirando a gosma da bota ou sofra uma penalidade de –1 em todas as jogadas de ataque e testes de resistência até fazer isso.");

        elseif (resultado == 13) then

                enviar("Presságio de morte... A sua! O próximo golpe que você sofrer será um acerto crítico, ou a próxima magia que lhe causar dano causará o dobro do dano normal.");

        elseif (resultado == 14) then

                enviar("Uma onda de energia negativa atinge o campo de batalha, fazendo com que um inimigo que já havia sido derrotado erga-se como um zumbi! O inimigo tem as mesmas estatísticas, mas sem habilidades especiais.");

        elseif (resultado == 15) then

                enviar("Uma área de Tormenta aparece debaixo dos seus pés! Ou apenas um fenômeno arcano parecido — mas você não vai ficar aqui para conferir. Faça um teste de Reflexos (CD 20). Em caso de falha, você sofre 6 pontos de dano em todas as habilidades. Contudo, você recebe um talento da Tormenta escolhido pelo mestre.");

        elseif (resultado == 16) then

                enviar("Você sente uma fisgada no braço. Penalidade de –1 na CA até sua próxima rodada.");

        elseif (resultado == 17) then

                enviar("Fenômeno mágico! O céu fica rosa, deuses passam voando entre as nuvens ou chovem sapos. Todos no combate ficam olhando, e perdem sua ação na próxima rodada. Após a pausa, todos rolam iniciativa novamente.");

        elseif (resultado == 18) then

                enviar("Cãibra no pescoço: penalidade de –4 em testes de Percepção e Reflexos por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 19) then

                enviar("Fenômeno climático imprevisível. Um relâmpago atinge seu braço erguido no meio do golpe. Você sofre 6d6 pontos de dano de eletricidade.");

        elseif (resultado == 20) then

                enviar("Você deixa cair seu escudo.");

        elseif (resultado == 21) then

                enviar("Você se descuida e abre sua guarda! Um oponente adjacente à escolha do mestre pode realizar um ataque imediato contra você.");

        elseif (resultado == 22) then

                enviar("Fome repentina: você tem duas rodadas para gastar uma ação padrão e comer alguma coisa substancial (como uma ração de viagem). Se não fi zer isso, você sofre 2 pontos de dano em Constituição.");

        elseif (resultado == 23) then

                enviar("Visão profana: você vê uma aparição de um deus inimigo da sua divindade padroeira. Você fica desprevenido nesta rodada, e na próxima rodada sofre uma penalidade de –5 em todas as rolagens.");

        elseif (resultado == 24) then

                enviar("Um vento frio sopra em suas costas... Um fantasma? Uma maldição? Ou apenas o inverno? Não importa, você fica abalado por uma rodada.");

        elseif (resultado == 25) then

                enviar("Optando por garantir pelo menos um ataque bem sucedido, na próxima rodada você deve usar o seu melhor ataque contra o oponente mais fraco no campo de visão.");

        elseif (resultado == 26) then

                enviar("Você tenta vencer o combate “no grito”. Na próxima rodada, você deve gastar uma ação padrão e usar a perícia Intimidação contra um oponente que já tenha atacado. Se for bem-sucedido em um teste contra CD 30, você deixa-o abalado.");

        elseif (resultado == 27) then

                enviar("Tomado por medo, indecisão ou outro sentimento qualquer, você trava! Na próxima rodada, você não pode agir, mas pode se defender normalmente.");

        elseif (resultado == 28) then

                enviar("Ato antiheroico: você faz algo indigno de um herói, como acovardar-se frente a um ataque, usar um inocente como escudo ou lutar sujo. Perca um ponto heroico.");

        elseif (resultado == 29) then

                enviar("Sua pistola explode na sua mão, e o tiro sai pela culatra! Você sofre");
                        rolar("3d6") 
                        enviar("pontos de dano de fogo e sua arma fica inutilizada até ser consertada.");

        elseif (resultado == 30) then

                enviar("Sequência de desastres: seu próximo acerto crítico será substituído por uma falha crítica.");

        elseif (resultado == 31) then

                enviar("Rumo ao vazio: se você estiver a 1,5m de qualquer precipício ou queda, você agora está em queda livre.");

        elseif (resultado == 32) then

                enviar("Você se cansa de ser chamado de mago fracote, e vai mostrar que pode vencer uma luta com suas próprias mãos. Até o fim do combate, você não pode lançar magias.");

        elseif (resultado == 33) then

                enviar("Seu ataque rebate no oponente, atingindo você mesmo. Sofra metade do dano que causaria caso tivesse acertado.");

        elseif (resultado == 34) then

                enviar("Um rato enorme morde sua perna e você recebe as doenças febre do esgoto, enjoo cegante e tremores (Tormenta RPG, Capítulo 10). Estes efeitos só se manifestam depois de um dia.");

        elseif (resultado == 35) then

                enviar("Calafrio: um espírito ou alma penada passa perto de você e deixa-o muito nervoso. Você fica abalado por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 36) then

                enviar("Dor de cabeça súbita: penalidade de –4 em testes de Vontade até o fim do combate.");

        elseif (resultado == 37) then

                enviar("Má decisão: quem nunca tomou? O mestre escolhe o alvo e tipo do seu próximo ataque. Contudo, você atacará um inimigo, não um aliado.");

        elseif (resultado == 38) then

                enviar("Enjoo súbito! Tanto sangue revira seu estômago. Você fica enjoado por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 39) then

                enviar("Você nota algo muito interessante do outro lado do campo de batalha. Na próxima rodada, você deve usar uma ação completa para se movimentar.");

        elseif (resultado == 40) then

                enviar("Você faz uma bobagem enorme e mostra que não é tão poderoso assim. Seus oponentes ficam motivados, recebendo +1 nas jogadas de ataque contra você.");

        elseif (resultado == 41) then

                enviar("Cãibra na perna direita: seu deslocamento é reduzido à metade. Caso você não tenha a perna esquerda, cai no chão. Se estiver na água, sofre –4 em testes para nadar.");

        elseif (resultado == 42) then

                enviar("Mil maldições! Uma maldição itinerante chega até você. Você sofre uma penalidade de –4 em todas as rolagens por 4 rodadas. Depois disso, o aliado mais próximo de você sofre esta mesma maldição por 4 rodadas, e assim sucessivamente. A maldição não pode ocorrer duas vezes na mesma pessoa no mesmo dia.");

        elseif (resultado == 43) then

                enviar("Seu elmo gira e tapa sua visão! Você está cego até a próxima rodada, quando então deve usar uma ação de movimento para colocá-lo no lugar ou continuar cego. Se você não estiver usando um elmo, outro elemento tapa sua visão, mas você ainda fica cego até gastar uma ação de movimento para desfazer o que quer que seja.");

        elseif (resultado == 44) then

                enviar("Um cisco entra no seu olho! Você fica cego por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 45) then

                enviar("Sua arma desgasta-se com o golpe, quebrando-se, a menos que seja obra-prima ou magistral. Neste caso, ela impõe uma penalidade de –1 em todas as jogadas de ataque até ser consertada.");

        elseif (resultado == 46) then

                enviar("Você decide tentar uma técnica de defesa inovadora, que acaba de inventar. Infelizmente, ela não é muito eficaz. Você sofre uma penalidade de –2 na CA por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 47) then

                enviar("Subitamente, você nota que está fora de forma, e que todas aquelas noites na taverna estão cobrando seu preço. Você fica fatigado até o fim do combate.");

        elseif (resultado == 48) then

                enviar("Que combate tedioso! Você para de prestar atenção a seu oponentes e começa a examinar seus arredores. Você fica desprevenido por " .. math.random (1 , 4) .. " rodada(s), mas pode fazer um teste de Percepção (CD 20) como uma ação livre. Se for bem sucedido, o mestre pode lhe fornecer alguma informação.");

        elseif (resultado == 49) then

                enviar("Sua aljava ou cartucheira cai no chão, e suas flechas, virotes ou balas se espalham. Sempre que quiser recarregar sua arma, você deve gastar uma ação de movimento para recolher a munição.");

        elseif (resultado == 50) then

                enviar("Um ratinho morde seu calcanhar. Você recebe a doença febre do esgoto (Tormenta RPG, Capítulo 10). Este efeito só se manifesta depois de um dia.");

        elseif (resultado == 51) then

                enviar("Seu cinto solta-se e suas calças caem! Perca uma ação de movimento para puxá-las de volta ou lute deste jeito indigno. Se você lutar com elas caídas, seu deslocamento é reduzido à metade e você não pode correr ou fazer investidas.");

        elseif (resultado == 52) then

                enviar("Você tropeça e desequilibra-se. Penalidade de –2 na CA até sua próxima rodada.");

        elseif (resultado == 53) then

                enviar("Sorvedouro de magia: devido a algum fenômeno arcano imprevisível, você perde " .. math.random (1 , 10) .. " PM(s).");

        elseif (resultado == 54) then

                enviar("Derrame: uma súbita pontada seguida de dor de cabeça... Tudo fica preto. Será o fim? Faça um teste de Sabedoria contra CD 10. Em caso de sucesso, você sofre 1 ponto de dano em Sabedoria. Em caso de falha, você morre.");

        elseif (resultado == 55) then

                enviar("Um trovão ressoa bem na hora do seu golpe, assustando-o. Na próxima rodada você estará desprevenido.");

        elseif (resultado == 56) then

                enviar("O que você está esperando? Sonhando acordado, você sofre uma penalidade de –10 na ordem de iniciativa, pelo resto do combate. Isto pode mudar quando você age a partir da próxima rodada.");

        elseif (resultado == 57) then

                enviar("Raiva aleatória: você entra em fúria, como um bárbaro de 1° nível. Se já estiver em fúria, a sua fúria acaba.");

        elseif (resultado == 58) then

                enviar("Golpe nos olhos: se você sofrer um acerto crítico neste combate, seus olhos inundam-se de sangue, ou seus globos oculares saltam para fora das órbitas. Seja como for, você fica cego até receber uma cura maior.");

        elseif (resultado == 59) then

                enviar("Uma onda de energia positiva atinge o campo de batalha, mas só do lado dos inimigos... Todos os adversários recuperam");
                        rolar("3d6");
                        enviar("pontos de vida.");

        elseif (resultado == 60) then

                enviar("Pontada no peito: penalidade de –4 em testes de Fortitude até o fim do combate.");

        elseif (resultado == 61) then

                enviar("Uma mão esquelética surge do chão e puxa seu pé. Você fica agarrado. Para se soltar, precisa gastar uma ação padrão e fazer um teste de manobra oposto com a mão, que tem bônus +6.");

        elseif (resultado == 62) then

                enviar("Seu sangue esquenta e você se enfurece. Sofre 2 pontos de dano em Sabedoria e, na próxima rodada, deve fazer um ataque corpo-a-corpo (ou se esforçar para isso, aproximando-se de um inimigo, por exemplo).");

        elseif (resultado == 63) then

                enviar("Ferimentos antigos voltam a incomodar... Você sofre 1 ponto de dano não letal por nível de personagem.");

        elseif (resultado == 64) then

                enviar("Hã? Uma cor bonita, um pássaro interessante ou um pensamento capturam toda a sua atenção. Faça um teste de Sabedoria contra CD 10. Em caso de falha, você perde toda a sua próxima rodada. O quê?");

        elseif (resultado == 65) then

                enviar("O sol, uma magia ou uma tocha nas proximidades atrapalham sua visão: penalidade de –4 em testes de Reflexos até o fim do combate");

        elseif (resultado == 66) then

                enviar("Você bate com o mindinho em algo, e é tomado por agonia! Ui! Não pode usar ataques desarmados durante a próxima rodada e sofre 2 pontos de dano em Destreza.");

        elseif (resultado == 67) then

                enviar("Você se engasga com poeira. Perca a rodada tossindo e sofra 2 pontos de dano em Constituição.");

        elseif (resultado == 68) then

                enviar("Você é tomado pela raiva da batalha e para de pensar direito. Sofra 2 pontos de dano de Inteligência e não use nenhuma habilidade especial (de classe, de raça, de talento...) na próxima rodada.");

        elseif (resultado == 69) then

                enviar("Ataque cardíaco: argh! Dor no peito, falta de ar, braço direito inutilizado por " .. math.random (1 , 6) .. " rodada(s). Faça um teste de Constituição contra CD 10. Em caso de sucesso, você sofre 1 ponto de dano em Constituição. Em caso de falha, você morre.");

        elseif (resultado == 70) then

                enviar("Compulsão autopreservativa: na próxima rodada você deve usar uma poção, magia, talento ou habilidade que restaure PV ou PM.");

        elseif (resultado == 71) then

                enviar("Este último golpe foi mais forte do que parecia! Você sofre de novo o dano do último golpe ou magia que atingiu-o, como dano não letal.");

        elseif (resultado == 72) then

                enviar("Um inseto entra na sua orelha bem no momento do golpe. Perca sua próxima ação de movimento para remover o incômodo ou sofra uma penalidade de –2 em jogadas de ataque até ele ir embora, em")
                        rolar("2d4", "rodadas.");

        elseif (resultado == 73) then

                enviar("Você termina o seu golpe com uma pose de grande efeito teatral, mas baixa qualidade combativa. Você fica desprevenido até o fim de sua próxima rodada.");

        elseif (resultado == 74) then

                enviar("Sua granada ou item de arremesso cai sem força perto do seu alvo, mas não explode ou ativa-se. O alvo deve fazer um teste de Refl exos contra CD 15, como uma ação livre. Em caso de sucesso, ele consegue chutar a granada ou item de arremesso de volta para você. Você então sofre os efeitos da arma!");

        elseif (resultado == 75) then

                enviar("Sua bolsa de moedas voa longe e espalha todo o seu ouro pelo chão. Tomara que você vença o combate e não precise fugir.");

        elseif (resultado == 76) then

                enviar("Ops! Faça um ataque imediato contra um de seus aliados. Seu aliado está desprevenido (penalidade de –4 na CA) contra este ataque.");

        elseif (resultado == 77) then

                enviar("Energia dissipada: se você usou seu ataque em conjunto com uma habilidade especial que tenha usos diários (como grito de kiai ou destruir o mal), perde todos os seus usos diários da habilidade.");

        elseif (resultado == 78) then

                enviar("Escorregão! Nada grave, a menos que você esteja lutando na beira de um precipício ou assemelhado. Neste caso, faça um teste de Reflexos contra CD 20 ou caia do precipício.");

        elseif (resultado == 79) then

                enviar("Sua granada ou item que você estava prestes a arremessar explode em sua mão. Sofra o efeito do item.");

        elseif (resultado == 80) then

                enviar("Você decide tentar fazer amizade com o inimigo. Na próxima rodada, você deve usar a perícia Diplomacia contra um oponente que você já tenha atacado. Se for bemsucedido em um teste contra CD 30, ele desiste do combate (caso você e seus aliados estejam vencendo) ou aceita sua rendição (caso você e seus aliados estejam perdendo).");

        elseif (resultado == 81) then

                enviar("Uma poção ou frasco de produto alquímico que você carrega se quebra. Perca o item e sofra o efeito de um ataque com o item afetado (apenas se for um item de ataque). O mestre decide qual poção ou item é afetado.");

        elseif (resultado == 82) then

                enviar("Fogo amigo: você acerta um aliado que esteja lutando em corpo-a-corpo com o alvo original do seu ataque.");

        elseif (resultado == 83) then

                enviar("Uma cobra venenosa morde seu pé. Você sofre " .. math.random (1 , 12) .. " pontos de dano.");

        elseif (resultado == 84) then

                enviar("Bobagem suprema: você tropeça e cai de mau jeito, torcendo o tornozelo e correndo o risco de quebrar o pescoço! Faça um teste de Destreza contra CD 10. Em caso de sucesso, você sofre 1 ponto de dano em Destreza. Em caso de falha, você quebra o pescoço e morre.");

        elseif (resultado == 85) then

                enviar("Tiro no pé, literalmente! Você causa o dano de um ataque com sua arma de disparo em si mesmo e fica com metade do deslocamento até receber uma cura maior.");

        elseif (resultado == 86) then

                enviar("Você chuta uma pedra! Seu pé fica doendo e seu deslocamento é reduzido à metade até o fim do combate.");

        elseif (resultado == 87) then

                enviar("Seu movimento com o ataque foi forte demais, e sua arma voa longe. Ela cai a 6m de você, em um ponto decidido pelo mestre.");

        elseif (resultado == 88) then

                enviar("Pessimismo súbito: mesmo que o combate esteja indo bem, você sente-se derrotado e inútil. Você fica abalado até o fim do combate.");

        elseif (resultado == 89) then

                enviar("Você tem uma tontura súbita e forte. Penalidade de –8 na CA até sua próxima rodada.");

        elseif (resultado == 90) then

                enviar("Sua mochila se abre e espalha todos os seus itens no chão, em um raio de 3m. Agora seus inimigos podem ver o que você carrega! Talvez algum deles decida pegar algo e sair correndo...");

        elseif (resultado == 91) then

                enviar("Você puxa demais a corda do seu arco ou besta! Ela se rompe, inutilizando a arma até ser consertada.");

        elseif (resultado == 92) then

                enviar("A tocha ou lampião que você carrega subitamente se apaga.");

        elseif (resultado == 93) then

                enviar("Cãibra no braço esquerdo: você deixa cair o que está segurando neste braço. Não pode fazer ataques desarmados ou segurar nada com a mão esquerda por " .. math.random (1 , 4) .. " rodada(s). Criaturas aladas que estejam voando (sem ajuda de magia) caem por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 94) then

                enviar("Você se distrai e abaixa sua guarda. Penalidade de –4 na CA até sua próxima rodada.");

        elseif (resultado == 95) then

                enviar("Tentando atingir mais longe que deveria, você distende o braço. Sofre –2 nas jogadas de ataque na próxima rodada e 2 pontos de dano em Força.");

        elseif (resultado == 96) then

                enviar("Cãibra no braço direito: você deixa cair o que está segurando neste braço. Não pode fazer ataques desarmados ou segurar nada com a mão direita por " .. math.random (1 , 4) .. " rodada(s). Criaturas aladas que estejam voando (sem ajuda de magia) caem por " .. math.random (1 , 4) .. " rodada(s).");

        elseif (resultado == 97) then

                enviar("Um meteoro está singrando os céus. Parece estar se aproximando... Oh não, está vindo direto para você! Você sofre");
                        rolar("6d6", "pontos de dano de esmagamento e");
                        rolar("6d6", "pontos de dano de fogo");
                        enviar("Ref CD 25 reduz ambos à metade.");

        elseif (resultado == 98) then

                enviar("Você tropeça em sua própria na capa, calça ou saia: cai no chão e sofre " .. math.random (1 , 6) .. " pontos de dano.");

        elseif (resultado == 99) then

                enviar("Zupt! A lâmina de sua espada ou machado, cabeça de seu martelo, etc., solta-se e voa para longe. A arma está inutilizada pelo resto do combate. Você deve consertar sua arma para poder usá-la de novo.");

        else

                enviar("Visão divina: você vê uma aparição de seu deus patrono. Você fica desprevenido nesta rodada, mas na próxima rodada recebe um bônus de +5 em todas as rolagens.");

        end;
    elseif D20 >= tonumber(sheet.atkcritico1) then
        Ataque = D20 + sheet.modforca + sheet.bba + Bonus_magico + ForcaDoTouro + Investida + Flanqueando + sheet.metadenivel-- calculo da margem de acerto
        Dano_final = ( Dano_base + Bonus_magico + sheet.modforca + ForcaDoTouro + sheet.metadenivel ) * Crit_mult -- calculo do dano da arma
        Regenercao = Dano_final // 2 -- Regeneração do gadanho negro
        --prints
        send("[§K#0FF]Ataque CRÍTICO do(a) [§K#fff]"..sheet.atkname1)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        if confirmYesNo("A arma tem efeito de Regeneração?") then
            send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
        end;
    else do 
        Ataque = D20 + sheet.modforca + sheet.bba + Bonus_magico +ForcaDoTouro + Investida + Flanqueando + sheet.metadenivel -- calculo damargem da arma
        Dano_final = Dano_base + Bonus_magico + sheet.modforca + ForcaDoTouro + sheet.metadenivel -- calculo do dano da arma
        Regenercao = Dano_final // 2 -- Regeneração do Gadanho Negro
        -- prints
        send("[§K#0FF]Ataque do(a) [§K#fff]"..sheet.atkname1)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        if confirmYesNo("A arma tem efeito de Regeneração?") then
            send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
        end;
    end;
end;