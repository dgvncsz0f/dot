-- -*- mode: haskell; -*-

import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp
import XMonad.Layout.Tabbed
import XMonad.Layout.Named
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Actions.CopyWindow
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

myConfig = return $ defaultConfig { manageHook  = manageDocks <+> myManageHook <+> manageHook defaultConfig
                                  , layoutHook  = avoidStruts $ (lTabs ||| lTall ||| lFull)
                                  , logHook     = dynamicLogWithPP dzenPP >> setWMName "LG3D" >> updatePointer (Relative 0 0)
                                  , startupHook = setWMName "LG3D"
                                  , modMask     = myModMask
                                  , terminal    = "urxvt -e tmux"
                                  , workspaces  = myWorkspaces
                                  } `additionalKeys` [ ((myModMask, xK_x), spawn "{ xscreensaver-command -time || xscreensaver -no-splash &}; xscreensaver-command -activate")
                                                     , ((myModMask .|. shiftMask, xK_x), spawn "xscreensaver-command -exit")
                                                     , ((myModMask .|. shiftMask, xK_s), spawn "import /tmp/screenshot.png")
                                                     , ((myModMask .|. shiftMask, xK_e), spawn "bash -l -c editor")
                                                     , ((myModMask .|. shiftMask, xK_b), spawn "bash -l -c conkeror")
                                                     , ((myModMask              , xK_p), spawn "bash -l -c dmenu_run")
                                                     , ((myModMask              , xK_z), warpToWindow 0 0)
                                                     ]
  where myManageHook = composeAll [ className =? "Pidgin"      --> doFloat
                                  , className =? "Skype"       --> doFloat
                                  , className =? "Ediff"       --> doFloat
                                  , isFullscreen               --> doFullFloat
                                  ]

        myModMask = mod4Mask

        myWorkspaces = map show [1..9]

        lTall = named "tall" $ Tall 1 (3/100) (1/2)
        lTabs = named "tabbed" simpleTabbed
        lFull = named "full" Full

main :: IO ()
main = fixEncoding >> fmap ewmh myConfig >>= xmonad
  where fixEncoding = hSetBinaryMode stdout True -- xmonad handling utf8 encoding
