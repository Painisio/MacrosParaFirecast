--[[
Macro para calculo de Critico e Dano Critico para Tormenta RPG.
Escrita em Lua, para o Firecast 8.1b.
]]--

D20 = rolar("1d20") -- rolagem pura
Dano_base = rolar("2d4") -- dano da arma puro
Bba = 0 -- bonus base de ataque
Mod_hab = 7 -- mod habilidae
Talento_1 = -2 -- bonus/penalidade de talento
Crit_marg = 17 -- magem de critico da arma
Crit_mult = 4 -- multiplicador de critico da arma
Bonus_magico = 0 -- bonus magico se houver proprio da arma
Nome_arma = "Gadanho Negro" -- nome da arma
ForcaDoTouro = 0 -- NÃO PREENCHER

if confirmYesNo("Sob Efeito da Magia Força do Touro?") then
    ForcaDoTouro = 2;
end

if D20 == 1 then
    send("Erro CRÍTICO!!!")
    send("Conferir na tabela de Erros críticos: "..rolar("1d100"))
    elseif D20 >= Crit_marg then
        Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico + ForcaDoTouro -- calculo da margem de acerto
        Dano_final = ( Dano_base + Bonus_magico + Mod_hab + ForcaDoTouro ) * Crit_mult -- calculo do dano da arma
        Regenercao = Dano_final / 2 -- Regeneração do gadanho negro
        --prints
        send("[§K#0FF]Ataque do(a) [§K#fff]"..Nome_arma)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
    else do 
        Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico +ForcaDoTouro -- calculo damargem da arma
        Dano_final = Dano_base + Bonus_magico + Mod_hab + ForcaDoTouro -- calculo do dano da arma
        Regenercao = Dano_final / 2 -- Regeneração do Gadanho Negro
        -- prints
        send("[§K#0FF]Ataque do(a) [§K#fff]"..Nome_arma)
        send("[§K#0FF]Obtendo rolagem de ataque: [§K#fff]"..Ataque)
        send("[§K#0FF]O dano foi de: [§K#fff]"..Dano_final)
        send("[§K#0FF]Regenero: [§K#fff]" ..Regenercao)
        end

end

--[[

Forma antiga

if D20 > Crit_marg then -- checagem se a arma critou...
    Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico -- calculo da margem de acerto
    Dano_final = ( Dano_base + Bonus_magico + Mod_hab ) * Crit_mult -- calculo do dano da arma
    Regenercao = Dano_final / 2 -- Regeneração do gadanho negro
    --prints
    send("Ataque CRITICO do(a) " ..Nome_arma)
    send("Obtendo rolagem de ataque: "..Ataque)
    send("O dano foi de: "..Dano_final)
    send("Regenero: " ..Regenercao)
    else do
    Ataque = D20 + Mod_hab + Talento_1 + Bba + Bonus_magico -- calculo damargem da arma
    Dano_final = Dano_base + Bonus_magico + Mod_hab -- calculo do dano da arma
    Regenercao = Dano_final / 2 -- Regeneração do Gadanho Negro
    -- prints
    send("Ataque do(a) "..Nome_arma)
    send("Obtendo rolagem de ataque: "..Ataque)
    send("O dano foi de: "..Dano_final)
    send("Regenero: " ..Regenercao)
    end
end
--]]
