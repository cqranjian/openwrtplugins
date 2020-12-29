--[[

Luci diag - Diagnostics controller module
(c) 2009 Daniel Dickinson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

]]--

module("luci.controller.dc1", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/dc1") then
		return
	end
--entry({"admin","services","dc1"},alias("admin","services","dc1","base"),_("斐讯插排"),9).dependent=true
entry({"admin", "services", "dc1"}, cbi("dc1/dc1"), _("斐讯插排")).dependent = true
entry({"admin","services","dc1","refresh"},call("refresh_data"))
entry({"admin","services","dc1","run"},call("act_status")).leaf=true
end

function act_status()
local e={}
e.running=luci.sys.call("pgrep oyy_arm >/dev/null")==0
luci.http.prepare_content("application/json")
luci.http.write_json(e)
end

function refresh_data()
local t=luci.http.formvalue("set")
local e=0
luci.http.prepare_content("application/json")
luci.http.write_json({ret=retstring,retcount=e})
end