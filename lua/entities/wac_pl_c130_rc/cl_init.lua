
include("shared.lua")

ENT.thirdPerson = {
	distance = 1200
}

/*
local HudMat = Material("WeltEnSTurm/helihud/arrow")
local HudCol = Color(70,199,50,150)
local Black = Color(0,0,0,200)
function ENT:DrawPilotHud()
	local pos = self:GetPos()
	local fwd = self:GetForward()
	local ri = self:GetRight()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ri, 90)
	ang:RotateAroundAxis(fwd, 90)

	local uptm = self.rotorRpm
	local upm = self.SmoothUp
	cam.Start3D2D(self:LocalToWorld((Vector(20,3.75,37.75)+(self.Offsets.hud or Vector()))+self.Seats[1].pos), ang,0.015*self.Scale)
	surface.SetDrawColor(HudCol)
	surface.DrawRect(235, 249, 10, 2)
	surface.DrawRect(255, 249, 10, 2)
	surface.DrawRect(249, 235, 2, 10)
	surface.DrawRect(249, 255, 2, 10)
	surface.DrawRect(-3, 0, 3, 500)
	surface.DrawRect(500, 0, 3, 500)
	surface.DrawRect(7, 0, 3, 500)
	surface.DrawRect(490, 0, 3, 500)

	surface.DrawRect(-6,-3,19,3)
	surface.DrawRect(-6,500,19,3)
	surface.DrawRect(487,-3,19,3)
	surface.DrawRect(487,500,19,3)
	surface.DrawRect(9,248,5,3)
	surface.DrawRect(485,248,5,3)

	surface.DrawRect(1, 500-uptm*500, 5, uptm*500)
	surface.DrawLine(30, 5*ang.r-200+2.77*ang.p, 220, 5*ang.r-200+2.77*(ang.p*0.12))
	surface.DrawLine(30, 5*ang.r-200+2.77*ang.p+1, 220, 5*ang.r-200+2.77*(ang.p*0.12)+1)
	surface.DrawLine(280, 5*ang.r-200-2.77*(ang.p*0.12), 470, 5*ang.r-200-2.77*ang.p)
	surface.DrawLine(280, 5*ang.r-200-2.77*(ang.p*0.12)+1, 470, 5*ang.r-200-2.77*ang.p+1)
	surface.SetMaterial(HudMat)
	surface.DrawTexturedRect(-20,250-upm*250-10,20,20)
	surface.DrawTexturedRectRotated(498,math.Clamp(250-self:GetVelocity().z/5.249*2,0,500),20,20,180)
	surface.SetTextColor(HudCol)
	surface.SetFont("wac_heli_small")
	surface.SetTextPos(-10, 505) 
	surface.DrawText("SPD")
	surface.SetTextPos(-10, 520)
	surface.DrawText(math.floor(self:GetVelocity():Length()*0.1)) --knots (real would be 0.037147, but fuck it)

	if self:GetHover() then
		surface.SetTextColor(HudCol)
		surface.SetFont("wac_heli_small")
		surface.SetTextPos(483, -18)
		surface.DrawText("HVR")
	end

	local tr=util.QuickTrace(pos,Vector(0,0,-999999),self.Entity)
	surface.SetTextPos(485,505)
	surface.DrawText("ALT")
	surface.SetTextPos(485,520)
	surface.DrawText(math.floor((pos.z-tr.HitPos.z)/16))

	cam.End3D2D()
end

function ENT:DrawWeaponSelection()
	local fwd = self:GetForward()
	local ri = self:GetRight()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(ri, 90)
	ang:RotateAroundAxis(fwd, 90)
	for k,t in pairs(self.Seats) do
		if k != "BaseClass" and !t.NoHud then
			cam.Start3D2D(self:LocalToWorld((Vector(20,5,25)+(self.Offsets.wepselect or Vector()))+t.pos), ang, 0.02*self.Scale)
			surface.DrawRect(-10, 0, 500, 30)
			surface.DrawRect(-10, 30, 10, 20)
			if t.weapons then
				local active = self:GetNWInt("seat_"..k.."_actwep")
				if t.weapons[active] then
					local weapon = self.weapons[t.weapons[active]]
					local lastshot = weapon:GetLastShot()
					local nextshot = weapon:GetNextShot()
					local ammo = weapon:GetAmmo()
					surface.DrawRect(10, 40, math.Clamp((nextshot-CurTime())/(nextshot-lastshot), 0, 1)*480, 10)
					draw.SimpleText(k.." "..t.weapons[active], "wac_heli_big", 0, -2.5, Black, 0)
					draw.SimpleText(ammo, "wac_heli_big", 480, -2.5, Black, 2)
				end
			else
				draw.SimpleText(k, "wac_heli_big", 0, -2.5, Black, 0)
			end
			cam.End3D2D()
		end
	end
end
*/

function ENT:viewCalcFirstPerson(k, p, view)
	p.wac = p.wac or {}
	if
		k == 1
		and p:GetInfo("wac_cl_air_mouse") == "1"
		and !p.wac.viewFree
	then
		self.viewTarget = {
			origin = self:WorldToLocal(self:LocalToWorld(self.Offsets.view)) or Vector(0,0,0),
			angles = Angle(0,0,0),
			fov = view.fov
		}
	else
		self.viewTarget = {
			origin = self:WorldToLocal(self:LocalToWorld(self.Offsets.view)) or Vector(0,0,0),
			angles = p:GetAimVector():Angle() - self:GetAngles(),
			fov = view.fov
		}
		self.viewTarget.angles.r = self.viewTarget.angles.r + self:GetAngles().r
	end
	return view
end