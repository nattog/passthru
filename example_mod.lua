-- first ensure that passthrough is active in SYSTEM > MODS > PASSTHROUGH
-- when requiring passthrough mod, ensure that the casing is correct
local passthrough = require 'passthrough/lib/mod'

-- script-level callbacks for midi event
-- data is your midi, origin lets you know where it comes from
function user_midi_event(data, origin)
    local msg = midi.to_msg(data)
    if msg.type ~= 'clock' then
      print(origin.port .. ' ' .. origin.name .. ' ' .. msg.type)
    end
end

function init()
  -- optional
  -- this informs passthrough about the script-defined callbacks for midi data
  passthrough.user_event = user_midi_event
end

function redraw()
end