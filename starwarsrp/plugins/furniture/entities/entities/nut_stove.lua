AddCSLuaFile()

local PLUGIN = PLUGIN

ENT.Type = "anim"
ENT.PrintName = "Kitchen Stove"
ENT.Category = "Furniture"
ENT.Author = "Juice"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.PhysgunDisabled = false
ENT.Owner = nil



function ENT:SpawnFunction( ply, tr, ClassName )

    local ent = ents.Create( "nut_stove" )
    ent:SetCreator( ply )
    ent:SetPos(tr.HitPos)
    ent:Spawn()

    ent:Activate()

    


    return ent
end




if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/cire992/props/kitchen05.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
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