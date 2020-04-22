AddCSLuaFile()

local PLUGIN = PLUGIN

ENT.Type = "anim"
ENT.PrintName = "Dough"
ENT.Category = "Food"
ENT.Author = "Juice"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.PhysgunDisabled = false
ENT.Owner = nil



function ENT:SpawnFunction( ply, tr, ClassName )

    local ent = ents.Create( "nut_dough" )
    ent:SetCreator( ply )
    ent:SetPos(tr.HitPos)
    ent:Spawn()

    ent:Activate()
    ent:PhysWake()
    ent:SetCreator(ply)



    


    return ent
end




if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_junk/garbage_bag001a.mdl")
		self:SetSolid(SOLID_BBOX)
		self:PhysicsInit(SOLID_BBOX)
		self:SetCollisionGroup(COLLISION_GROUP_NONE)
	end
end





--hook.Add( "PhysgunPickup", "AllowPlayerPickup", function( ply, ent )
    --if ( ply:IsPlayer() and ent:IsPlayer() ) then
        --return true
    --end
--end )

--function GM:PhysgunPickup( ply, ent )
	--local entity = (nut_couch)
	--if ( entity.PhysgunDisabled ) then return false 
	--end
	--if ( entity:IsValid() && entity.PhysgunPickup ) then
        --return entity:PhysgunPickup( ply, entity )
   -- end
--end