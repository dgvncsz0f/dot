import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

myConfig = do { xmproc <- spawnPipe "/usr/bin/xmobar"
              ; return $ defaultConfig { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
                                       , layoutHook = avoidStruts $ layoutHook defaultConfig
                                       , logHook    = do { dynamicLogWithPP $ xmobarPP { ppOutput = hPutStrLn xmproc
                                                                                       , ppTitle  = xmobarColor "black" "" . shorten 50
                                                                                       }
                                                         ; setWMName "LG3D"
                                                         }
                                       , modMask    = myModMask
                                       , terminal   = "/usr/bin/urxvt -e /usr/bin/screen"
                                       } `additionalKeys` [ ((myModMask .|. shiftMask, xK_x), spawn "/usr/bin/xscreensaver-command -activate")
                                                          , ((myModMask .|. shiftMask, xK_s), spawn "/usr/bin/import /tmp/screenshot.png")
                                                          , ((myModMask .|. shiftMask, xK_i), spawn "/usr/bin/emacs")
                                                          , ((myModMask .|. shiftMask, xK_b), spawn "/usr/bin/conkeror")
                                                          ]
              }
  where myManageHook = composeAll [ className =? "Pidgin" --> doFloat
                                  , className =? "Skype"  --> doFloat
                                  , className =? "Do"     --> doIgnore
                                  , isFullscreen          --> doFullFloat
                                  ]

        myModMask = mod4Mask

main :: IO ()
main = myConfig >>= xmonad
