-- -*- mode: haskell; -*-

import XMonad
import System.IO
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Named
import XMonad.Actions.Warp
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import Graphics.X11.Xlib.Misc
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Layout.StackTile
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.CopyWindow
import XMonad.Hooks.ManageHelpers
import XMonad.Actions.UpdatePointer

myConfig = return $ defaultConfig { manageHook  = manageDocks <+> myManageHook <+> manageHook defaultConfig
                                  , layoutHook  = avoidStruts $ (lTabs ||| lTall ||| lFull ||| lStck)
                                  , logHook     = dynamicLogWithPP dzenPP >> setWMName "LG3D"
                                  , startupHook = setWMName "LG3D"
                                  , modMask     = myModMask
                                  , terminal    = "sakura"
                                  , workspaces  = myWorkspaces
                                  } `additionalKeys` [ ((myModMask, xK_x), spawn "slock")
                                                     , ((noModMask, stringToKeysym "XF86AudioMute"), spawn "amixer set Master toggle")
                                                     , ((noModMask, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer set Master 5dB+")
                                                     , ((noModMask, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer set Master 5dB-")
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
        lStck = named "stack" $ StackTile 1 (3/100) (1/2)

main :: IO ()
main = fixEncoding >> fmap ewmh myConfig >>= xmonad
  where fixEncoding = hSetBinaryMode stdout True -- xmonad handling utf8 encoding
