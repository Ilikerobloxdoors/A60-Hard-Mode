		--====== Load Spawner ======--

		local Spawner = loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"
			))()

		--====== Load Custom Achievements ======--

		local CustomAchievements = loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/RegularVynixu/DOORS-Custom-Achievements/main/init.luau"
			))()

		--====== Create A-60 ======--

		local entity = Spawner:Create({
			Entity = {
				Name = "A-60",
				Asset = "https://raw.githubusercontent.com/Ilikerobloxdoors/A60-Hard-Mode/main/A-60%20HardMode.rbxm",
				HeightOffset = 0
			},

			Lights = {
				Flicker = {
					Enabled = true,
					Duration = 5
				},
				Shatter = true,
				Repair = false
			},

			Earthquake = {
				Enabled = false
			},

			CameraShake = {
				Enabled = true,
				Range = 100,
				Values = {20, 40, 0.1, 1}
			},

			Movement = {
				Speed = 325,
				Delay = 6.7,
				Reversed = false
			},

			Rebounding = {
				Enabled = true,
				Type = "Ambush",
				Min = 4,
				Max = 8,
				Delay = 0.5
			},

			Damage = {
				Enabled = true,
				IgnoreHiding = false,
				Range = 40,
				Amount = 125
			},

			Crucifixion = {
				Type = "Guiding",
				Enabled = true,
				Range = 40,
				Resist = false,
				Break = true
			},

			Death = {
				Type = "Guiding",
				Hints = {
					"A-60 has found you.",
					"You weren't fast enough."
				},
				Cause = "A-60"
			}
		})

		--====== Entity Callbacks ======--

		entity:SetCallback("OnSpawned", function()
			print("A-60 has spawned!")
		end)

		entity:SetCallback("OnStartMoving", function()
			print("A-60 has started moving!")
		end)

		entity:SetCallback("OnEnterRoom", function(room, firstTime)
			if firstTime then
				print("A-60 entered room: " .. room.Name)
			end
		end)

		entity:SetCallback("OnRebounding", function(startOfRebound)
			if startOfRebound then
				print("A-60 has started rebounding!")
			else
				print("A-60 has finished rebounding!")
			end
		end)

		entity:SetCallback("OnDespawned", function()
			print("A-60 has despawned!")
		end)

		entity:SetCallback("OnDamagePlayer", function(newHealth)
			if newHealth <= 0 then
				print("A-60 killed the player!")
			else
				print("A-60 damaged the player!")
			end
		end)

		--====== Grant A-60 Achievement ======--

		CustomAchievements:Grant({
			Identifier = "A60ManyRebounds",
			Title = "Out of Many Rebounds",
			Desc = "Only Coming back At 50 and 100",
			Reason = "Survive The New Rare Entity A-60 (BEFORE ROOMS)",
			Image = "rbxassetid://11395251044"
		}, {
			CheckOwned = true,
			Remember = true
		})

		--====== Run A-60 ======--

		entity:Run(true)
