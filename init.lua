-- spoon plugins
-- hs.loadSpoon("FnMate")

-- 익명함수
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--     hs.alert.show("Hello world")
--      end)

-- 함수 정의 및 호출
-- function hello(text)
--     hs.alert.show(text)
-- end
-- hs.hotkey.bind(mod_key, 'H', function() hello('ssss') end)

local mod_key = { "cmd", "alt", "ctrl" }
-- reload config
hs.hotkey.bind(mod_key, "R", hs.reload)
-- chrome 호출
hs.hotkey.bind(mod_key, "C", function() hs.application.launchOrFocus('Google Chrome') end)
-- 메모장 호출
hs.hotkey.bind(mod_key, "N", function() hs.application.launchOrFocus('TextEdit') end)
-- vs code 호출
hs.hotkey.bind(mod_key, "V", function() hs.application.launchOrFocus('Visual Studio Code') end)
-- pycharm 호출
hs.hotkey.bind(mod_key, "P", function() hs.application.launchOrFocus('PyCharm CE') end)
-- iterm 호출
hs.hotkey.bind(mod_key, "I", function() hs.application.launchOrFocus('iTerm') end)
-- termius 호출
hs.hotkey.bind(mod_key, "T", function()
    hs.application.launchOrFocus('Termius')
end)
-- 윈도우 힌트
hs.hotkey.bind(mod_key, "F1", hs.hints.windowHints)


local mod_win = { "ctrl", "shift" }
-- 창 위치/크기 변경
local function move_win_to_left()
    local win = hs.window.focusedWindow -- 현재 활성화된 앱의 윈도우
    local frame = window.frame()
    local screen = win:screen():frame() -- 현재 화면
    frame.x = screen.x
    frame.y = screen.y
    frame.w = screen.w / 2
    frame.h = screen.h
    win:setFrame(frame)
end

local function move_win_to_right()
    local win = hs.window.focusedWindow -- 현재 활성화된 앱의 윈도우
    local frame = window.frame()
    local screen = win:screen():frame() -- 현재 화면
    frame.x = screen.x + (screen.w / 2) -- 윈도우의 x 좌표를 화면 width의 1/2 로 조정
    frame.y = screen.y
    frame.w = screen.w / 2
    frame.h = screen.h
    win:setFrame(frame)
end

hs.hotkey.bind(mod_win, "left", move_win_to_left)
hs.hotkey.bind(mod_win, "right", move_win_to_right)

local function move_win(xx, yy, ww, hh)
    return function()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local max = win:screen():frame()
        f.x = max.w * xx
        f.y = max.h * yy
        f.w = max.w * ww
        f.h = max.h * hh
        win:setFrame(f)
    end
end

hs.hotkey.bind(mod_win, "1", move_win(0, 1 / 2, 1 / 2, 1 / 2))
hs.hotkey.bind(mod_win, "2", move_win(0, 1 / 2, 1, 1 / 2))
hs.hotkey.bind(mod_win, "3", move_win(1 / 2, 1 / 2, 1 / 2, 1 / 2))
hs.hotkey.bind(mod_win, "4", move_win(0, 0, 1 / 2, 1))
hs.hotkey.bind(mod_win, "5", move_win(0, 0, 1, 1))
hs.hotkey.bind(mod_win, "6", move_win(1 / 2, 0, 1 / 2, 1))
hs.hotkey.bind(mod_win, "7", move_win(0, 0, 1 / 2, 1 / 2))
hs.hotkey.bind(mod_win, "8", move_win(0, 0, 1, 1 / 2))
hs.hotkey.bind(mod_win, "9", move_win(1 / 2, 0, 1 / 2, 1 / 2))

-- 키보드 입력 소스 확인
-- hs.hotkey.bind({ "cmd" }, "i", function()
--     local input_source = hs.keycodes.currentSourceID()
--     print(input_source)
-- end)

do -- 키보드 언어 변경
    local language_list = {
        english = "com.apple.keylayout.ABC",
        korean = "com.apple.inputmethod.Korean.2SetKorean",
        japanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
    }

    local alert_list = {
        english = "english",
        korean = "Korean",
        japanese = "Japanese"
    }

    local changeInput = function(lan)
        print(lan)
        local language = nil
        local alert = nil

        if lan == "japanese" then
            language = language_list.japanese
            alert = alert_list.japanese
        elseif lan == "english" then
            language = language_list.english
            alert = alert_list.english
        elseif lan == "korean" then
            language = language_list.korean
            alert = alert_list.korean
        else
            language = language_list.korean
            alert = alert_list.korean
        end
        hs.keycodes.currentSourceID(language)
        hs.alert.show(alert)
    end
    hs.hotkey.bind(mod_win, "J", function() changeInput('japanese') end)
    hs.hotkey.bind(mod_win, "E", function() changeInput('english') end)
    hs.hotkey.bind(mod_win, "K", function() changeInput('korean') end)
end

