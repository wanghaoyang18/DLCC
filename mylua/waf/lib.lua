
require 'config'
-- check config options is on
function optionIsOn(condition) 
    if condition=="on" then
        return true
    else
        return false
    end
end

-- get real ip
function getRealClientIP()
    ClientIP = ngx.req.get_headers()["X_real_ip"]
    if ClientIP == nil then
        ClientIP = ngx.req.get_headers()["X_Forwarded_For"]
    end
    if ClientIP == nil then
        ClientIP  = ngx.var.remote_addr
    end
    if ClientIP == nil then
        ClientIP  = "unknown"
    end
    return ClientIP
end

-- write the log
function write(logfile,msg)
    
    local fd = io.open(logfile,"ab")
    if fd == nil then return end
    fd:write(msg)
    fd:flush()
    fd:close()
end

function log(method,url,data,ruletag)
    if attacklog then
        local realIp = getRealClientIP()
        local ua = ngx.var.http_user_agent
        local servername=ngx.var.server_name
        local time=ngx.localtime()
        if ua  then
            line = realIp.." ["..time.."] \""..method.." "..servername..url.."\" \""..data.."\"  \""..ua.."\" \""..ruletag.."\"\n"
        else
            line = realIp.." ["..time.."] \""..method.." "..servername..url.."\" \""..data.."\" - \""..ruletag.."\"\n"
        end
        local filename = logdir..'/'..servername.."_"..ngx.today().."_sec.log"
        write(filename,line)
    end
end

function readRule(checkVar)
    f = io.open(RulePath..'/'..checkVar,"r")
    if f==nil then
        return
    end
    content = {}
    for line in f:lines() do
        table.insert(content,line)
    end
    f:close()
    return content
end


function errorHtml(Redirc)
    if Redirc then
        ngx.header.content_type = "text/html"
        ngx.status = ngx.HTTP_FORBIDDEN
        ngx.say(html)
        ngx.exit(ngx.status)
    end
end