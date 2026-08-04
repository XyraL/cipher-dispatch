-- Copy into a separate adapter resource and replace the TODO calls.
CreateThread(function()
    exports['cipher-mdt']:RegisterDispatchProvider('my-dispatch', {
        resource = GetCurrentResourceName(),
        priority = 50,
        getActiveCalls = function()
            return {} -- TODO: normalized active calls
        end,
        createCall = function(source, data)
            -- TODO: return external id, normalized call
        end,
        respond = function(source, callId)
            -- TODO
        end,
        setCallStatus = function(source, callId, status)
            -- TODO
        end,
        addCallNote = function(source, callId, note)
            -- TODO
        end,
    })
end)

-- Push external changes back to the MDT without creating a hard dependency.
local function pushToMdt(action, call, revision)
    if GetResourceState('cipher-mdt') ~= 'started' then return end
    exports['cipher-mdt']:IngestDispatchUpdate(action, call, {
        origin = GetCurrentResourceName(), revision = revision,
    })
end
