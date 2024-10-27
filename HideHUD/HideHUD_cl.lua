local HUD_ELEMENTS = {
    { id = 0, hidden = false, name = "HUD" },
    { id = 1, hidden = true, name = "HUD_WANTED_STARS" },
    { id = 2, hidden = true, name = "HUD_WEAPON_ICON" },
    { id = 3, hidden = true, name = "HUD_CASH" },
    { id = 4, hidden = true, name = "HUD_MP_CASH" },
    { id = 5, hidden = true, name = "HUD_MP_MESSAGE" },
    { id = 6, hidden = true, name = "HUD_VEHICLE_NAME" },
    { id = 7, hidden = true, name = "HUD_AREA_NAME" },
    { id = 8, hidden = true, name = "HUD_VEHICLE_CLASS" },
    { id = 9, hidden = true, name = "HUD_STREET_NAME" },
    { id = 10, hidden = false, name = "HUD_HELP_TEXT" },
    { id = 11, hidden = false, name = "HUD_FLOATING_HELP_TEXT_1" },
    { id = 12, hidden = false, name = "HUD_FLOATING_HELP_TEXT_2" },
    { id = 13, hidden = true, name = "HUD_CASH_CHANGE" },
    { id = 14, hidden = true, name = "HUD_RETICLE" },
    { id = 15, hidden = false, name = "HUD_SUBTITLE_TEXT" },
    { id = 16, hidden = false, name = "HUD_RADIO_STATIONS" },
    { id = 17, hidden = false, name = "HUD_SAVING_GAME" },
    { id = 18, hidden = false, name = "HUD_GAME_STREAM" },
    { id = 19, hidden = false, name = "HUD_WEAPON_WHEEL" },
    { id = 20, hidden = false, name = "HUD_WEAPON_WHEEL_STATS" },
    { id = 21, hidden = false, name = "MAX_HUD_COMPONENTS" },
    { id = 22, hidden = false, name = "MAX_HUD_WEAPONS" },
    { id = 141, hidden = false, name = "MAX_SCRIPTED_HUD_COMPONENTS" }
}

-- Parameter for hiding radar when not in a vehicle
local HUD_HIDE_RADAR_ON_FOOT = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if HUD_HIDE_RADAR_ON_FOOT then
            local player = GetPlayerPed(-1)
            DisplayRadar(IsPedInAnyVehicle(player, false))
            SetRadarZoomLevelThisFrame(200.0)
        end

        for _, element in ipairs(HUD_ELEMENTS) do
            if element.hidden then
                HideHudComponentThisFrame(element.id)
            else
                ShowHudComponentThisFrame(element.id)
            end
        end
    end
end)
