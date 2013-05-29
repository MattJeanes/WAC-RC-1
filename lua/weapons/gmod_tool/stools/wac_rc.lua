TOOL.Category = "WAC"
TOOL.Name = "Remote Control"
TOOL.Command = nil

if CLIENT then // language stuff
	language.Add("tool.wac_rc.name", "WAC R/C")
	language.Add("tool.wac_rc.desc", "Remotely Control WAC Aircraft")
	language.Add("tool.wac_rc.0", "Click an aircraft to control it, press E to leave control")
	
	hook.Add("CalcView", "WAC_RC", function(ply,pos,angles,fov)
		local e=LocalPlayer():GetNWEntity("wac_rc_aircraft")
		if LocalPlayer():GetNWBool("wac_rc_active") and IsValid(e) then
			local view={}
			view.origin = e:GetPos()+((angles+e:GetAngles()):Forward()*-e.thirdPerson.distance)
			view.angles = angles+e:GetAngles()
			view.fov = fov
			return view
		end
	end)
	
	hook.Add("ShouldDrawLocalPlayer", "WAC_RC", function(ply,pos,angles,fov)
		local e=LocalPlayer():GetNWEntity("wac_rc_aircraft")
		if LocalPlayer():GetNWBool("wac_rc_active") and IsValid(e) then
			return true
		end
	end)
end
 
function TOOL:LeftClick( trace )
	//code
	if not self.Active and trace.Entity and trace.Entity.IsWACAir then
		self.Active=true
		self.Aircraft=trace.Entity
		local ply = self:GetOwner()
		ply:SetNWEntity("wac_rc_aircraft", trace.Entity)
		ply:SetNWBool("wac_rc_active", true)
		ply.RCPos=ply:GetPos()
		print("activated")
	end
end
 
function TOOL:RightClick( trace )
	self:LeftClick( trace )
end

function TOOL:Think()
	local ply=self:GetOwner()
	if self.Active and ply:KeyDown(IN_USE) then
		self.Active=false
		ply:SetNWEntity("wac_rc_aircraft", nil)
		ply:SetNWBool("wac_rc_active", false)
		ply.RCPos=nil
		print("deactivated")
	end
	local e=ply:GetNWEntity("wac_rc_aircraft")
	if self.Active and IsValid(e) and ply.RCPos then
		ply:SetPos(ply.RCPos)
		local oldt=self.Table
		self.Table={
			["Start"]=0,
			["Throttle"]=1,
			["Pitch"]=1,
			["Yaw"]=1,
			["Roll"]=1,
			["Hover"]=1
		}
		for k,v in pairs(self.Table) do
			e:receiveInput(k,v,1)
		end
	end
end

function TOOL:Holster()
	return !self.Active
end
 
function TOOL.BuildCPanel( panel )
	panel:AddControl("Header", { Description = "Remote control WAC Aircraft" })
end