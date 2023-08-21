Citizen.CreateThread( function()
    updatePath = "/VertissoR/NoRetWhileMoving" -- your git user/repo path
    resourceName = ""..GetCurrentResourceName().."" -- the resource name
    
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!
    
        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then

            print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
    end)