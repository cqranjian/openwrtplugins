--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2008 Jo-Philipp Wich <xm@leipzig.freifunk.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id: dc1.lua 9405 2020-5-10 13:00:52Z jow $
]]--

--[[
local m, s, o
]]--
local fs = require "nixio.fs"
local sys = require "luci.sys"
local utl = require "luci.util"
local http = require "luci.http"
local d = require "luci.dispatcher"
local m,s,e

function sync_value_to_file(value, file)
	value = value:gsub("\r\n?", "\n")
	local old_value = nixio.fs.readfile(file)
	if value ~= old_value then
		nixio.fs.writefile(file, value)
	end
	
end

m=Map("dc1")
m.title=translate("斐讯插排")
m.description=translate("本程序是利用变废为宝插件开启插排控制功能！ ")
m:section(SimpleSection).template="dc1/dc1_status"
s=m:section(NamedSection,"general", "general")

-- *********** General section ***********
s.anonymous = false
s:tab("base",translate("Basic Settings"))
s:tab("zhuji",translate("域名劫持"))

-- enabled
e=s:taboption("base",Flag,"enabled",translate("Enable"), translate("是否启动插件功能"))
e.default=0
e.rmempty=false
e=s:taboption("base",DummyValue, "", translate("<br>"))

--e = s:taboption("base",Button,"button_restart",translate("手动重启")) 
--e.inputtitle = translate("重启插件")
--e.inputstyle = "apply"
--e.write=function()
--	sys.call ( "/etc/init.d/dc1run restart > /dev/null")
--	http.redirect(d.build_url("admin","services","dc1"))
--end
--function e.write (self,section,value)
--	sys.call ( "/etc/init.d/dc1run restart > /dev/null")
--	http.redirect(d.build_url("admin","services","dc1"))
--end


e = s:taboption("zhuji",TextValue, "", nil,translate("<font color=red><b>范例：192.168.2.1 Smartplugconnect.phicomm.com</b></font>"))
e.rmempty = false
e.rows = 15

	function e.cfgvalue()
		return nixio.fs.readfile("/etc/hosts") or ""
	end
	function e.write(self, section, value)
		sync_value_to_file(value, "/etc/hosts")
		io.popen("/etc/init.d/dnsmasq restart")
	end


local apply = http.formvalue("cbi.apply")

if apply then
	      io.popen("/etc/init.d/dc1run enable")
          io.popen("/etc/init.d/dc1run restart")
end

return m
