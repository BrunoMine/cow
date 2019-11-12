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
			moving_speed = 1.3,
			search_radius = 5
		},
		walk_around = {
			chance = 0.2, 
			duration = 20, 
			moving_speed = 0.7
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
			idle = {start = 1, stop = 60, speed = 15},
			walk = {start = 81, stop = 101, speed = 18},
			eat = {start = 107, stop = 170, speed = 12, loop = false},
			follow = {start = 81, stop = 101, speed = 15},
			death = {start = 171, stop = 191, speed = 32, loop = false, duration = 2.52},
		},
	},

	sounds = {
		on_damage = {name = "sheep", gain = 1.0, distance = 10},
		on_death = {name = "sheep", gain = 1.0, distance = 10},
		swim = {name = "creatures_splash", gain = 1.0, distance = 10,},
		random = {
			idle = {name = "sheep", gain = 0.6, distance = 10, time_min = 23},
		},
	},
	
	spawning = {
		
		spawn_egg = {
			description = "Cow Spawn-Egg",
			texture = "cow_egg_spawn.png",
		},
	},
})
