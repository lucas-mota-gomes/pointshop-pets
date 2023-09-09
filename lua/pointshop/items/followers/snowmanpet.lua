ITEM.Name = 'Jackfrost'
ITEM.Price = 999999
ITEM.Model = 'models/props/cs_office/snowman_face.mdl'
ITEM.Bone = 'ValveBiped.Bip01_Pelvis'

function ITEM:OnEquip(ply, modifications)
	ply:PS_AddClientsideModel(self.ID)
end

function ITEM:OnHolster(ply)
	ply:PS_RemoveClientsideModel(self.ID)
end

function ITEM:ModifyClientsideModel(ply, model, pos, ang)
	local Size = Vector(1,1,1)
	local mat = Matrix()
	mat:Scale(Size)
	model:EnableMatrix('RenderMultiply', mat)

	model:SetMaterial('')

	local MAngle = Angle(291.13000488281,184.69999694824,360)
	local MPos = Vector(10.430000305176,-33.909999847412,-23.479999542236)

	pos = pos + (ang:Forward() * MPos.x) + (ang:Up() * MPos.z) + (ang:Right() * MPos.y)
	ang:RotateAroundAxis(ang:Forward(), MAngle.p)
	ang:RotateAroundAxis(ang:Up(), MAngle.y)
	ang:RotateAroundAxis(ang:Right(), MAngle.r)



	return model, pos, ang
end

