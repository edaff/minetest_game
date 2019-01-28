minetest.register_chatcommand("wavm", {
	params = "",
	description = "Printing Hello World",
	func = function( _ )
		minetest.chat_send_all("Hello World")
		return true, "Hello World was successfully printed"
	end,
})
