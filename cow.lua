--[[
	Mod Fine_mobs for Minetest
	Copyright (C) 2019 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>5.
	
  ]]

creatures.register_mob("cow:cow", {
	stats = {
		hp = 8,
		can_jump = 1,
		can_swim = true,
		can_burn = true,
		can_panic = true,
		has_falldamage = true,
		has_kockback = true,
	},
	
	hunger = {
		days_interval = 5,
		water = true,
		water_nodes = {"sheep:drinking_fountain", "group:water"},
		food = {
			nodes = {
				"sheep:sheep_feeder_1",
				"sheep:sheep_feeder_2",
				"sheep:sheep_feeder_3",
				"sheep:sheep_feeder_4",
				"sheep:sheep_feeder_5",
				"sheep:sheep_feeder_6",
				"sheep:sheep_feeder_7",
				"sheep:sheep_feeder_8",
				"sheep:sheep_feeder_9",
				"sheep:sheep_feeder_10",
				"sheep:sheep_feeder_11"
			}
		},
	},
	
	modes = {
		idle = {chance = 0.5, duration = 10, random_yaw = 4},
		walk = {
			chance = 0.14, 
			duration = 20, 
			moving_speed = 0.8,
			search_radius = 5
		},
		walk_around = {
			chance = 0.2, 
			duration = 20, 
			moving_speed = 0.7
		},
		eat = {	chance = 1,
			duration = 4,
			eat_time = 1.2,
			sound = "cow_eat_grass",
			nodes = {
				["default:grass_1"] = {remove=true}, 
				["default:grass_2"] = {remove=true}, 
				["default:grass_3"] = {remove=true}, 
				["default:grass_4"] = {remove=true}, 
				["default:grass_5"] = {remove=true}, 
				["default:dirt_with_grass"] = {replace="default:dirt"}, 
			}
		},
	},
	
	model = {
		mesh = "cow.b3d",
		textures = {"cow.png"},
		collisionbox_width = 0.9,
		collisionbox_height = 1.2,
		rotation = -90.0,
		scale = {x = 3.5, y = 3.5},
		vision_height = 0.9,
		animations = {
			idle = {start = 1, stop = 30, speed = 18},
			walk = {start = 31, stop = 60, speed = 20},
			run = {start = 91, stop = 120, speed = 20},
			eat = {start = 61, stop = 90, speed = 12, loop = false},
			death = {start = 121, stop = 135, speed = 15, loop = false, duration = 2.52},
		},
	},

	sounds = {
		on_damage = {name = "sheep", gain = 1.0, distance = 10},
		on_death = {name = "sheep", gain = 1.0, distance = 10},
		swim = {name = "creatures_splash", gain = 1.0, distance = 10,},
		random = {
			idle = {name = "cow_idle", gain = 0.6, distance = 10, time_min = 23},
		},
	},
	
	spawning = {
		
		spawn_egg = {
			description = "Cow Spawn-Egg",
			texture = "cow_egg_spawn.png",
		},
	},
})
