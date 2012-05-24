import XMonad
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
                                  , logHook     = dynamicLogWithPP dzenPP >> setWMName "LG3D"
                                  , startupHook = setWMName "LG3D"
                                  , modMask     = myModMask
                                  , terminal    = "/usr/bin/urxvt -e /usr/bin/tmux"
                                  , workspaces  = myWorkspaces
                                  } `additionalKeys` [ ((myModMask .|. shiftMask, xK_x),     spawn "/usr/bin/slock")
                                                     , ((myModMask .|. shiftMask, xK_s),     spawn "/usr/bin/import /tmp/screenshot.png")
                                                     , ((myModMask .|. shiftMask, xK_e),     spawn "/usr/bin/editor")
                                                     , ((myModMask .|. shiftMask, xK_b),     spawn "/usr/bin/x-www-browser")
                                                     , ((myModMask .|. shiftMask, xK_p),     spawn "/usr/bin/kupfer")
                                                     , ((myModMask .|. shiftMask, xK_equal), spawn "/usr/bin/aumix -w +10")
                                                     , ((myModMask .|. shiftMask, xK_minus), spawn "/usr/bin/aumix -w -10")
                                                     , ((myModMask,               xK_v),     windows copyToAll)
                                                     , ((myModMask .|. shiftMask, xK_v),     killAllOtherCopies)
                                                     ]
  where myManageHook = composeAll [ className =? "Pidgin"      --> doFloat
                                  , className =? "Skype"       --> doFloat
                                  , isFullscreen               --> doFullFloat
                                  ]

        myModMask = mod4Mask

        myWorkspaces = map show [1..9]

        lTall = named "tall" $ Tall 1 (3/100) (1/2)
        lTabs = named "tabbed" simpleTabbed
        lFull = named "full" Full

main :: IO ()
main = fmap ewmh myConfig >>= xmonad
