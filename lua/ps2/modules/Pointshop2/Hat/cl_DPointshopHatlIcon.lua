local PANEL = {}

function PANEL:Init( )
	self.image = vgui.Create( "DPreRenderedModelPanel", self )
	self.image:Dock( TOP )
	self.image:SetSize( 128, 128 )
	self.image:DockMargin( 5, 0, 5, 5 )
	self.image:SetMouseInputEnabled( false )
end

function PANEL:SetItemClass( itemClass )
	self.BaseClass.SetItemClass( self, itemClass )
	self.image:SetModel( "models/player/kleiner.mdl" )
	self.image:SetPacOutfit( itemClass:getBaseOutfit( ) )
	self.image:SetViewInfo( itemClass.iconViewInfo )
end

function PANEL:SetItem( item )
	self:SetItemClass( item.class )
end

function PANEL:PerformLayout( )
	if not IsValid( self.image ) then return end
	self:SetTall( self.image:GetTall( ) + self.Label:GetTall( ) + 10 )
end

function PANEL:OnSelected( )
	self.image.forceRender = true
end

function PANEL:OnDeselected( )
	self.image.forceRender = false
end

derma.DefineControl( "DPointshopHatIcon", "", PANEL, "DPointshopItemIcon" )