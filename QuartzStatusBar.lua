--[[
	Copyright (C) 2006-2007 Nymbia
	Copyright (C) 2010-2017 Hendrik "Nevcairiel" Leppkes < h.leppkes@gmail.com >

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License along
	with this program; if not, write to the Free Software Foundation, Inc.,
	51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
]]
local Quartz3 = LibStub("AceAddon-3.0"):GetAddon("Quartz3")

local QuartzStatusBar = CreateFrame("StatusBar")
local MetaTable = {__index = QuartzStatusBar}

local DrawBar, UpdateBarValue

function Quartz3:CreateStatusBar(name, parent)
	local bar = setmetatable(CreateFrame("StatusBar", name, parent, "BackdropTemplate"), MetaTable)
	bar.__texture = bar:CreateTexture(nil, "ARTWORK")
	bar:SetStatusBarTexture([[Interface\TargetingFrame\UI-StatusBar]])
	bar:SetStatusBarColor(0, 0, 0, 0.75)

	DrawBar(bar)

	return bar
end

function DrawBar(self)
	self.__texture:ClearAllPoints()
	self.__texture:SetPoint("TOPLEFT", self, "TOPLEFT")
	if self.__orientation == "HORIZONTAL" then
		self.__texture:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT")
	elseif self.__orientation == "VERTICAL" then
		self.__texture:SetPoint("TOPRIGHT", self, "TOPRIGHT")
	end
	local r, g, b, a = 1, 1, 1, 1
	if self.__color then
		if #self.__color == 3 then
			r, g, b = unpack(self.__color)
		elseif #self.__color == 4 then
			r, g, b, a = unpack(self.__color)
		end
	end
	self.__texture:SetVertexColor(r, g, b, a)
end
