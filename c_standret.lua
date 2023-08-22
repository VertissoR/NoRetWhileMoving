local reticle_visible = false
local last_aim = 0

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local player = PlayerId()
        local ped = PlayerPedId()

        if IsPedArmed(ped, 4) then
            local aiming = IsPlayerFreeAiming(player)
            local moving = IsPedWalking(ped)
            local running = IsPedRunning(ped)
            local isinveh = IsPedInAnyVehicle(ped, false)
            
            if aiming and not moving and not running and not IsControlPressed(0, 21) and not isinveh then -- SHIFT key to check if player is running
                if not reticle_visible then
                    last_aim = GetGameTimer()
                    reticle_visible = true
                    HideHudComponentThisFrame(14, true )
                elseif GetGameTimer() - last_aim >= 1000 then
                    reticle_visible = false
                    HideHudComponentThisFrame(14, false)
                end
            else
                reticle_visible = false
                HideHudComponentThisFrame(14, false)
            end
        else
            reticle_visible = false
            HideHudComponentThisFrame(14, false)
        end
    end
end)
