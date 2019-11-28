--[[
	Mod Fine_mobs for Minetest
	Copyright (C) 2019 BrunoMine (https://github.com/BrunoMine)
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <https://www.gnu.org/licenses/>5.
	
  ]]

creatures.register_mob("cow:cow", {
	stats = {
		hp = 12,
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
		water_nodes = {"cow:drinking_fountain", "group:water"},
		food = {
			nodes = {
				"cow:cow_feeder_1",
				"cow:cow_feeder_2",
				"cow:cow_feeder_3",
				"cow:cow_feeder_4",
				"cow:cow_feeder_5",
				"cow:cow_feeder_6",
				"cow:cow_feeder_7",
				"cow:cow_feeder_8",
				"cow:cow_feeder_9",
				"cow:cow_feeder_10",
				"cow:cow_feeder_11"
			}
		},
	},
	
	modes = {
		idle = {chance = 0.5, duration = 10, random_yaw = 4},
		walk = {
			chance = 0.15, 
			duration = 20, 
			moving_speed = 0.8,
			search_radius = 5
		},
		walk_around = {
			chance = 0.15, 
			duration = 20, 
			moving_speed = 0.7
		},
		eat = {	
			chance = 0.2,
			duration = 4,
			eat_time = 1.2,
			sound = "creatures_eat_grass",
			nodes = {
				["default:grass_1"] = {remove=true}, 
				["default:grass_2"] = {remove=true}, 
				["default:grass_3"] = {remove=true}, 
				["default:grass_4"] = {remove=true}, 
				["default:grass_5"] = {remove=true}, 
				["default:dirt_with_grass"] = {replace="default:dirt"}, 
			}
		},
		follow = {
			chance = 0, 
			duration = 20, 
			radius = 5, 
			moving_speed = 0.8, 
			items = {["farming:wheat"]=true}, 
			search_timer = 5
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
	
	randomize = {
		values = {
			{textures = {"cow_white_and_black.png"},},
			{textures = {"cow_white_and_brown.png"},},
			{textures = {"cow_brown_and_black.png"},},
			{textures = {"cow_white.png"},},
			{textures = {"cow_grey.png"},},
			{textures = {"cow_black.png"},},
			{textures = {"cow_brown.png"},},
		},
	},
	
	sounds = {
		on_damage = {name = "sheep", gain = 1.0, distance = 10},
		on_death = {name = "sheep", gain = 1.0, distance = 10},
		swim = {name = "creatures_splash", gain = 1.0, distance = 10,},
		random = {
			idle = {name = "cow", gain = 0.6, distance = 10, time_min = 23},
		},
	},
	
	spawning = {
		
		spawn_egg = {
			description = "Cow Spawn-Egg",
			texture = "cow_egg_spawn.png",
		},
	},
	
	drops = {
		{"cow:raw_beef", 1, chance = 1},
	},
	
	on_rightclick = function(self, clicker)
		if self.is_died == true then return end
		local itemstack = clicker:get_wielded_item()
		if itemstack:get_name() == "bucket:bucket_empty" then
			local inv = clicker:get_inventory()
			if inv:room_for_item("main", "cow:bucket_milk 1") == true then
				inv:remove_item("main", "bucket:bucket_empty 1")
				inv:add_item("main", "cow:bucket_milk 1")
			end
		end
	end,
})
