
module("luci.controller.dc1", package.seeall)

function index()
	
	if not nixio.fs.access("/etc/config/dc1") then
		return
	end
entry({"admin", "services", "dc1"}, cbi("dc1/dc1"), _("feixunchapai")).dependent = true
entry({"admin","services","dc1","refresh"},call("refresh_data"))
entry({"admin","services","dc1","status"},call("act_status")).leaf=true
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