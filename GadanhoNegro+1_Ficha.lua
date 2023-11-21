--[[
Macro para calculo de Critico e Dano Critico para Tormenta RPG.
Escrita em Lua, para o Firecast 8.1b.

Adicionei uns alertas de possiveis bonus que o jogador pode receber.
Diferente da versão anterior onde o PJ tinhe de preemcher varias variaveis aqui algumas dependem da ficha, outras
como a magia força do touro de pende de responder sim ou não no popout!!!
]]--

D20 = rolar("1d20") -- rolagem pura
Dano_base = rolar("2d4") -- dano da arma puro
Talento_1 = -2 -- bonus/penalidade de talento, no caso perito em combate
Crit_mult = 4 -- multiplicador de critico da arma
Bonus_magico = 0 -- bonus magico se houver proprio da arma
ForcaDoTouro = 0 -- NÃO PREENCHER
Investida = 0 -- Não PREENCHER
Flanqueando = 0 -- Não PREENCHER

if confirmYesNo("Sob Efeito da Magia Força do Touro?") then -- Magia força do touro pode acrescentar acerto e dano!
    ForcaDoTouro = 2;
    send("Sob Efeito da Magia Força do Touro")
end

if confirmYesNo("Usando de Investida?") then -- Investida pode acrescentar acerto!
    Investida = 2;
    send("Usando Investida! Lembrando que impõe -2 na CA!")
end

if confirmYesNo("Flanqueando?") then -- Flanquear aumenta o acerto!
    Flanqueando = 2;
    send("Flanqueando! Mais acerto!")
end

if D20 == 1 then
    send("Erro CRÍTICO!!!")
    send("Conferir na tabela de Erros críticos: "..rolar("1d100"))
    elseif D20 >= tonumber(sheet.atkcritico1) then
        Ataque = D20 + sheet.modforca + Talento_1 + sheet.bba + Bonus_magico + ForcaDoTouro + Investida + Flanqueando + sheet.metadenivel-- calculo da margem de acerto
        Dano_final = ( Dano_base + Bonus_magico + sheet.modforca + ForcaDoTouro + sheet.metadenivel ) * Crit_mult -- calculo do dano da arma
        Regenercao = Dano_final // 2 -- Regeneração do gadanho negro
        --prints
        send("[§K#0FF]Ataque do(a) [§K#fff]"..sheet.atkname1)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
    else do 
        Ataque = D20 + sheet.modforca + Talento_1 + sheet.bba + Bonus_magico +ForcaDoTouro + Investida + Flanqueando + sheet.metadenivel -- calculo damargem da arma
        Dano_final = Dano_base + Bonus_magico + sheet.modforca + ForcaDoTouro + sheet.metadenivel -- calculo do dano da arma
        Regenercao = Dano_final // 2 -- Regeneração do Gadanho Negro
        -- prints
        send("[§K#0FF]Ataque do(a) [§K#fff]"..sheet.atkname1)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
        end

end
