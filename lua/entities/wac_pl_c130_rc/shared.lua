if not wac then return end
ENT.Base = "wac_pl_base"
ENT.Type = "anim"
ENT.Category = wac.aircraft.spawnCategoryRC
ENT.Spawnable = true
ENT.AdminSpawnable = true
ENT.PrintName = "C-130J Hercules"

ENT.Model				= "models/drmatt/c130_rc/body.mdl"
ENT.RotorPhModel		= "models/props_junk/sawblade001a.mdl"
ENT.RotorModel			= "models/drmatt/c130_rc/propellor.mdl"

ENT.FirePos			= Vector(133,-228,160)
ENT.SmokePos		= ENT.FirePos

ENT.Weight			= 8750
ENT.EngineForce		= 55
ENT.rotorPos 	= Vector(35,-114.38,49.41)
ENT.Scale = 0.25
ENT.Offsets={
	hud=Vector(-12,-4,-23),
	wepselect=Vector(-12,-5,-12.75),
	view=Vector(-1,-2,-20)
}

ENT.OtherRotorPos={
	Vector(35,-57.25,47),
	Vector(35,56.08,47),
	Vector(35,113.02,49.41)
}

ENT.Wheels={
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(-20,26,6),
		friction=0,
		mass=375,
	},
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(-3,26,6),
		friction=0,
		mass=375,
	},
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(-20,-27,6),
		friction=0,
		mass=375,
	},
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(-3,-27,6),
		friction=0,
		mass=375,
	},
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(99,-3.5,6),
		friction=0,
		mass=375,
	},
	{
		mdl="models/drmatt/c130_rc/wheel.mdl",
		pos=Vector(99,2.5,6),
		friction=0,
		mass=375,
	},
}

ENT.Seats = {
	{
		pos=Vector(105,7,27),
		exit=Vector(103.47,61.72,5),
	},
	{
		pos=Vector(420,-28.94,125),
		exit=Vector(425.42,140,125),
	},
	{
		pos=Vector(371.79,-40,119.66),
		ang=Angle(0,-90,0),
		exit=Vector(425.42,140,125),
	},
	{
		pos=Vector(340,-18.87,119.66),
		exit=Vector(425.42,140,125),
	},
}

ENT.Sounds={
	Start="WAC/c130/startup.wav",
	Blades="^WAC/c130/external.wav",
	Engine="WAC/c130/internal.wav",
	MissileAlert="HelicopterVehicle/MissileNearby.mp3",
	MissileShoot="HelicopterVehicle/MissileShoot.mp3",
	MinorAlarm="HelicopterVehicle/MinorAlarm.mp3",
	LowHealth="HelicopterVehicle/LowHealth.mp3",
	CrashAlarm="HelicopterVehicle/CrashAlarm.mp3"
}

function ENT:DrawWeaponSelection() end