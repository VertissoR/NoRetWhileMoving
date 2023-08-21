Citizen.CreateThread( function()
    updatePath = "/VertissoR/NoRetWhileMoving" 
    resourceName = ""..GetCurrentResourceName().."" 
    
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version") 
    
        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then

            print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
    end)
