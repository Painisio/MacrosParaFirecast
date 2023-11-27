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
        send("Verificar tabela do Manual do Jogador para mais detalhes")

        
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
