function write( logfile,msg )
    -- body
    local fd = io.open(logfile,"ab")
    if fd == nil then return end
    fd:write(msg)
    fd:flush()
    fd:close()
end


write("/home/hadoop/Desktop/mylua/log/localhost_2018-10-15_sec.log127.0.0.1","what>>>>???")