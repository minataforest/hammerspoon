아래 링크를 참조하여 작성  
https://johngrib.github.io/wiki/hammerspoon/

디스플레이 변경  
https://stackoverflow.com/questions/54151343/how-to-move-an-application-between-monitors-in-hammerspoon

마우스 hjkl로 이용  
https://frhyme.github.io/hammerspoon/hammerspoon01_use_ctrl_hjkl_as_arrow/  
https://frhyme.github.io/hammerspoon/hammerspoon02_move_and_click_mouse_by_kbd/

---

#### 오류

#### 1

- 오류내용

```lua
attempt to index a nil value (local 'win')
```

- 수정방법  
  https://github.com/Hammerspoon/hammerspoon/issues/237#issuecomment-476320469

```
System Preferences > Security & Privacy > Privacy tab > Accessibility

and then check the box to allow Hammerspoon to control your computer
```
