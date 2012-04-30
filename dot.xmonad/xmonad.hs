import XMonad
import XMonad.Layout.Tabbed
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Actions.CopyWindow
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

myConfig = do { xmproc <- spawnPipe "/usr/bin/xmobar"
              ; return $ defaultConfig { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
                                       , layoutHook = avoidStruts $ (simpleTabbed ||| tall)
                                       , logHook    = do { dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn xmproc
                                                                                       , ppTitle  = xmobarColor "black" "" . shorten 50
                                                                                       }
                                                         ; setWMName "LG3D"
                                                         }
                                       , modMask    = myModMask
                                       , terminal   = "/usr/bin/urxvt -e /usr/bin/tmux"
                                       , workspaces = myWorkspaces
                                       } `additionalKeys` [ ((myModMask .|. shiftMask, xK_x), spawn "/usr/bin/xscreensaver-command -activate")
                                                          , ((myModMask .|. shiftMask, xK_s), spawn "/usr/bin/import /tmp/screenshot.png")
                                                          , ((myModMask .|. shiftMask, xK_i), spawn "/usr/bin/editor")
                                                          , ((myModMask .|. shiftMask, xK_b), spawn "/usr/bin/x-www-browser")
                                                          , ((myModMask .|. shiftMask, xK_p), spawn "/usr/bin/kupfer")
                                                          , ((myModMask, xK_v), windows copyToAll)
                                                          , ((myModMask .|. shiftMask, xK_v), killAllOtherCopies)
                                                          ]
              }
  where myManageHook = composeAll [ className =? "Pidgin"      --> doFloat
                                  , className =? "Skype"       --> doFloat
                                  , appName   =? "stalonetray" --> doShift "9"
                                  , isFullscreen               --> doFullFloat
                                  ]

        myModMask = mod4Mask

        myWorkspaces = map show [1..9]

        tall = Tall 1 (3/100) (1/2)

main :: IO ()
main = myConfig >>= xmonad
