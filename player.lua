Player = {
	Choix = 0,
	Position = {x = 50, y = 50},
	OldPosition = {x, y},
	Niveau = 0,
	Exp = 0,
	Degats = 0,
	HealthBase = 0,
	Health = 0,
	BarreRessource = 0,
	Vitesse = 125,
	Armure = 0,
	ResistanceSorts = 0,
	RegenerationHealth = 0,
	RegenerationRessource = 0
}

function Player.Load()
	playerR = {}
	playerR[1] = love.graphics.newImage('pictures/players/WarRight.png')
	playerR[2] = love.graphics.newImage('pictures/players/WarRight2.png')
	playerR[3] = love.graphics.newImage('pictures/players/WarRight.png')
	playerR[4] = love.graphics.newImage('pictures/players/WarRight3.png')

	playerU = {}
	playerU[1] = love.graphics.newImage('pictures/players/WarUp.png')
	playerU[2] = love.graphics.newImage('pictures/players/WarUp2.png')
	playerU[3] = love.graphics.newImage('pictures/players/WarUp.png')
	playerU[4] = love.graphics.newImage('pictures/players/WarUp3.png')

	playerD = {}
	playerD[1] = love.graphics.newImage('pictures/players/WarDown.png')
	playerD[2] = love.graphics.newImage('pictures/players/WarDown2.png')
	playerD[3] = love.graphics.newImage('pictures/players/WarDown3.png')
	playerD[4] = love.graphics.newImage('pictures/players/WarDown4.png')
	playerD[5] = love.graphics.newImage('pictures/players/WarDown5.png')
	playerD[6] = love.graphics.newImage('pictures/players/WarDown6.png')
	playerD[7] = love.graphics.newImage('pictures/players/WarDown7.png')
	playerD[8] = love.graphics.newImage('pictures/players/WarDown8.png')
	
	playerDL = {}
	playerDL[1] = love.graphics.newImage('pictures/players/WarDownLeft.png')
	playerDL[2] = love.graphics.newImage('pictures/players/WarDownLeft2.png')
	playerDL[3] = love.graphics.newImage('pictures/players/WarDownLeft3.png')
	playerDL[4] = love.graphics.newImage('pictures/players/WarDownLeft4.png')
	playerDL[5] = love.graphics.newImage('pictures/players/WarDownLeft5.png')
	playerDL[6] = love.graphics.newImage('pictures/players/WarDownLeft6.png')
	playerDL[7] = love.graphics.newImage('pictures/players/WarDownLeft7.png')
	playerDL[8] = love.graphics.newImage('pictures/players/WarDownLeft8.png')
	
	playerL = {}
	playerL[1] = love.graphics.newImage('pictures/players/WarLeft.png')
	playerL[2] = love.graphics.newImage('pictures/players/WarLeft2.png')
	playerL[3] = love.graphics.newImage('pictures/players/WarLeft3.png')
	playerL[4] = love.graphics.newImage('pictures/players/WarLeft4.png')
	playerL[5] = love.graphics.newImage('pictures/players/WarLeft5.png')
	playerL[6] = love.graphics.newImage('pictures/players/WarLeft6.png')
	playerL[7] = love.graphics.newImage('pictures/players/WarLeft7.png')
	playerL[8] = love.graphics.newImage('pictures/players/WarLeft8.png')
	
	playerDR = {}
	playerDR[1] = love.graphics.newImage('pictures/players/WarDownRight.png')
	playerDR[2] = love.graphics.newImage('pictures/players/WarDownRight2.png')
	playerDR[3] = love.graphics.newImage('pictures/players/WarDownRight3.png')
	playerDR[4] = love.graphics.newImage('pictures/players/WarDownRight4.png')
	playerDR[5] = love.graphics.newImage('pictures/players/WarDownRight5.png')
	playerDR[6] = love.graphics.newImage('pictures/players/WarDownRight6.png')
	playerDR[7] = love.graphics.newImage('pictures/players/WarDownRight7.png')
	playerDR[8] = love.graphics.newImage('pictures/players/WarDownRight8.png')

	Player.AnimTimer = 0
	Player.Pic = playerD[1]
	Player.pNum = 1
end

function Player.Draw()
	love.graphics.draw(Player.Pic, Player.Position.x, Player.Position.y, 0, Reso.Scale, Reso.Scale)
end

function Player.Update(dt)
	if Player.Position.x > love.graphics.getWidth() / 2 then
		camera.x = Player.Position.x - love.graphics.getWidth() / 2
	end
	
	if Player.Position.y > love.graphics.getHeight() / 2 then
		camera.y = Player.Position.y - love.graphics.getHeight() / 2
	end

	if love.keyboard.isDown('w') then
		Player.Position.y = Player.Position.y - Player.Vitesse * dt
		Player.Pic = playerU[Player.pNum]
		Player.AnimTimer = Player.AnimTimer + dt
		if Player.AnimTimer > 0.1 then
			Player.pNum = Player.pNum + 1
			Player.AnimTimer = 0
		end
		if Player.pNum > 4 then
			Player.pNum = 1
		end
	end
	
	if love.keyboard.isDown('a') then
		if love.keyboard.isDown('s') then
			Player.Position.y = Player.Position.y + Player.Vitesse * dt
			Player.Position.x = Player.Position.x - Player.Vitesse * dt
			Player.Pic = playerDL[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		elseif love.keyboard.isDown('w') then
			Player.Position.y = Player.Position.y - Player.Vitesse * dt
			Player.Position.x = Player.Position.x - Player.Vitesse * dt
			Player.Pic = playerUL[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		else
			Player.Position.x = Player.Position.x - Player.Vitesse * dt
			Player.Pic = playerL[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		end
		
		if Player.pNum > 8 then
			Player.pNum = 1
		end
	end
	
	if love.keyboard.isDown('s') then
		if love.keyboard.isDown('a') then
			Player.Position.y = Player.Position.y + Player.Vitesse * dt
			Player.Position.x = Player.Position.x - Player.Vitesse * dt
			Player.Pic = playerDL[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		elseif love.keyboard.isDown('d') then
			Player.Position.y = Player.Position.y + Player.Vitesse * dt
			Player.Position.x = Player.Position.x + Player.Vitesse * dt
			Player.Pic = playerDR[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		else
			Player.Position.y = Player.Position.y + Player.Vitesse * dt
			Player.Pic = playerD[Player.pNum]
			Player.AnimTimer = Player.AnimTimer + dt
			if Player.AnimTimer > 0.1 then
				Player.pNum = Player.pNum + 1
				Player.AnimTimer = 0
			end
		end
		
		if Player.pNum > 8 then
			Player.pNum = 1
		end
	end
	
	if love.keyboard.isDown('d') then
		Player.Position.x = Player.Position.x + Player.Vitesse * dt
		Player.Pic = playerR[Player.pNum]
		Player.AnimTimer = Player.AnimTimer + dt
		if Player.AnimTimer > 0.1 then
			Player.pNum = Player.pNum + 1
			Player.AnimTimer = 0
		end
		if Player.pNum > 4 then
			Player.pNum = 1
		end
	end
end

function Player.AnimReset(key)
	if key == 'z' then
		Player.AnimTimer = 0
		Player.pNum = 1
		Player.Pic = playerU[1]
	end
	if key == 'q' then
		Player.AnimTimer = 0
		Player.pNum = 1
		Player.Pic = playerL[1]
	end
	if key == 's' then
		Player.AnimTimer = 0
		Player.pNum = 1
		Player.Pic = playerD[1]
	end
	if key == 'd' then
		Player.AnimTimer = 0
		Player.pNum = 1
		Player.Pic = playerR[1]
	end
end