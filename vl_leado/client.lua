--ESX Import
ESX = exports['es_extended']:getSharedObject()

local display = false

--árak

--pozició
local pos = vector3(1792.25, 4594.7, 36.7)

--nui

RegisterNUICallback("exit", function()
    SetDisplay(false)
    back()
  end)
  
  RegisterNUICallback("main", function(data)
    print(data.text)
    SetDisplay(false)
  end)
  
  RegisterNUICallback("error", function(data)
    print(data.error)
    SetDisplay(false)
  end)
  
  function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
      type = "ui",
      status = bool,
    })
  end

  --nui import

  RegisterNetEvent("vl_leado:openUI", function()
    SetDisplay(not display)
  end)

  local wood = 5
  local coal = 15
  local stone = 10
  local gold = 100
  local iron = 20

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SendNUIMessage({
            action = 'show',
            wood = wood,
            stone = stone,
            coal = coal,
            iron = iron,
            gold = gold
        })
    end
end)

--blip
Citizen.CreateThread(function()
  
      blip = AddBlipForCoord(pos)
      SetBlipSprite(blip, 197)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 0.7)
      SetBlipColour(blip, 2)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Leadó")
      EndTextCommandSetBlipName(blip)
   end)

--chat üzenetek
function notify(prefix, text)
    TriggerEvent('chat:addMessage', {
        color = { 124,197,118},
        multiline = true,
        args = {"["..prefix.."]", text}
      })
end

RegisterNUICallback("buy-1", function()
  TriggerServerEvent('vl_leado:buyWood')
  notify("VLRP - Leadó", "Vedtél egy Fá-t, ára: "..wood.."$")
end)

RegisterNUICallback("sell-1", function()
  TriggerServerEvent('vl_leado:sellWood')
  notify("VLRP - Leadó", "Eladtál egy Fá-t, ára: "..wood.."$")
end)

RegisterNUICallback("buy-2", function()
  TriggerServerEvent('vl_leado:buyStone')
  notify("VLRP - Leadó", "Vedtél egy Kő-vet, ára: "..stone.."$")
end)

RegisterNUICallback("sell-2", function()
  TriggerServerEvent('vl_leado:sellStone')
  notify("VLRP - Leadó", "Eladtál egy Kő-vet, ára: "..stone.."$")
end)

RegisterNUICallback("buy-3", function()
  TriggerServerEvent('vl_leado:buyCoal')
  notify("VLRP - Leadó", "Vedtél egy Szen-et, ára: "..coal.."$")
end)

RegisterNUICallback("sell-3", function()
  TriggerServerEvent('vl_leado:sellCoal')
  notify("VLRP - Leadó", "Eladtál egy Szen-et, ára: "..coal.."$")
end)

RegisterNUICallback("buy-4", function()
  TriggerServerEvent('vl_leado:buyIron')
  notify("VLRP - Leadó", "Vedtél egy Vas-at, ára: "..iron.."$")
end)

RegisterNUICallback("sell-4", function()
  TriggerServerEvent('vl_leado:sellIron')
  notify("VLRP - Leadó", "Eladtál egy Vas-at, ára: "..iron.."$")
end)

RegisterNUICallback("buy-5", function()
  TriggerServerEvent('vl_leado:buyGold')
  notify("VLRP - Leadó", "Vedtél egy Arany-at, ára: "..gold.."$")
end)

RegisterNUICallback("sell-5", function()
  TriggerServerEvent('vl_leado:sellGold')
  notify("VLRP - Leadó", "Eladtál egy Arany-at, ára: "..gold.."$")
end)