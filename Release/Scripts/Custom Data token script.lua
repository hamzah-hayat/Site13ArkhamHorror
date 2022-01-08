-- Custom Data token script
-- set true to enable debug logging
DEBUG = true

function log(message)
  if DEBUG then
    print(message)
  end
end

--[[
Known locations and clues. We check this to determine if we should
atttempt to spawn clues, first we look for <LOCATION_NAME>_<GUID> and if
we find nothing we look for <LOCATION_NAME>
format is [location_guid -> clueCount]
]]
LOCATIONS_DATA_JSON = [[
{
  "The Directors Office": {"type": "fixed", "value": 1, "clueSide": "front"},
  "Offices": {"type": "perPlayer", "value": 2, "clueSide": "front"},
  "Cafeteria": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Reception": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Warehouse": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Entrance to Medium Security": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Power Generator": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Security Checkpoint": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Secure Storage": {"type": "perPlayer", "value": 2, "clueSide": "front"},
  "The Vending Machine": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "High Security Elevator": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Research Lab": {"type": "perPlayer", "value": 2, "clueSide": "front"},
  "Runestone Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Singularity Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Broodmother Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Puppetbox Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Heart Chamber": {"type": "perPlayer", "value": 3, "clueSide": "front"},
  "The Entity Containment System": {"type": "perPlayer", "value": 2, "clueSide": "front"},
  "The Vault": {"type": "perPlayer", "value": 2, "clueSide": "front"},
  "Research Archive": {"type": "perPlayer", "value": 3, "clueSide": "front"},
  "Stalker Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"},
  "Clockwork Containment": {"type": "perPlayer", "value": 1, "clueSide": "front"}
}
]]


PLAYER_CARD_DATA_JSON = [[
{
  "Paint Gun": {
    "tokenType": "resource",
    "tokenCount": 3
  },
  "Mega-Arachne Spray": {
    "tokenType": "resource",
    "tokenCount": 3
  },
  "Emergency Toolkit": {
    "tokenType": "resource",
    "tokenCount": 2
  }
}
]]

HIDDEN_CARD_DATA = {
}

LOCATIONS_DATA = JSON.decode(LOCATIONS_DATA_JSON)
PLAYER_CARD_DATA = JSON.decode(PLAYER_CARD_DATA_JSON)

function onload(save_state)
  local playArea = getObjectFromGUID('721ba2')
  playArea.call("updateLocations", {self.getGUID()})
  local playerMatWhite = getObjectFromGUID('8b081b')
  playerMatWhite.call("updatePlayerCards", {self.getGUID()})
  local playerMatOrange = getObjectFromGUID('bd0ff4')
  playerMatOrange.call("updatePlayerCards", {self.getGUID()})
  local playerMatGreen = getObjectFromGUID('383d8b')
  playerMatGreen.call("updatePlayerCards", {self.getGUID()})
  local playerMatRed = getObjectFromGUID('0840d5')
  playerMatRed.call("updatePlayerCards", {self.getGUID()})
  local dataHelper = getObjectFromGUID('708279')
  dataHelper.call("updateHiddenCards", {self.getGUID()})
end