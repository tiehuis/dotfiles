-- store cursor position on initialization. Note that this isn't guaranteed
-- to run before initial printing has been done and can be inconsistent.
io.write('\27[s')

function on_track_change(name)
    -- restore cursor position
    io.write('\27[u')

    -- clear to bottom of screen
    io.write('\27[J')
end

mp.register_event('start-file', on_track_change)
