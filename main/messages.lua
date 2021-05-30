local M = {}

M.UPDATE_SCORE = hash("update_score")
M.COLLECT_ORB = hash("collect_orb")
M.INPUT_JUMP = hash("jump")
M.INPUT_FALL = hash("fall")
M.INPUT_UP = hash("up")
M.INPUT_DOWN = hash("down")
M.INPUT_GRAVIY = hash("gravity")
M.PROXY_LOADED = hash("proxy_loaded")
M.GAME_OVER = hash("game_over")
M.LAYOUT_CHANGED = hash("layout_changed")
M.MODE_LANDSCAPE = hash("Landscape")
M.MODE_PORTRAIT = hash("Portrait")
M.WINDOW_RESIZED = hash("window_resized")
M.UPDATE_WINDOW = hash("update_window")

M.SHOW_GAME = hash("show_game")
M.SHOW_MENU = hash("show_menu")

M.REGISTER = hash("register")
M.UNREGISTER = hash("unregister")

return M