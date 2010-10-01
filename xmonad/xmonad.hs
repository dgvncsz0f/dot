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
                                       , modMask    = mod4Mask
                                       , terminal   = "/usr/bin/urxvt -e /usr/bin/screen"
                                       } `additionalKeys` [ 
                                                          ]
              }
  where myManageHook = composeAll [ className =? "Pidgin" --> doFloat
                                  , isFullscreen          --> doFullFloat
                                  ]

main :: IO ()
main = myConfig >>= xmonad
