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



myConfig = do
  xmproc <- spawnPipe "xmobar --bottom --dock"
  return $ defaultConfig { manageHook  = manageDocks <+> myManageHook <+> manageHook defaultConfig
                         , layoutHook  = avoidStruts (lTabs ||| lTall ||| lFull ||| lStck)
                         , logHook     = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmproc }
                         , startupHook = setWMName "LG3D"
                         , modMask     = myModMask
                         , terminal    = "bash -l -c lilyterm"
                         , workspaces  = myWorkspaces
                         } `additionalKeys` [ ((myModMask, xK_x), spawn "bash -l -c x11-lock")
                                            , ((noModMask, stringToKeysym "XF86AudioMute"), spawn "amixer set Master toggle")
                                            , ((noModMask, stringToKeysym "XF86MonBrightnessUp"), spawn "xbacklight -inc 10")
                                            , ((noModMask, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer set Master 5dB+")
                                            , ((noModMask, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer set Master 5dB-")
                                            , ((noModMask, stringToKeysym "XF86MonBrightnessDown"), spawn "xbacklight -dec 10")
                                            , ((myModMask .|. shiftMask, xK_s), spawn "import /tmp/xscreenshot.png")
                                            , ((myModMask .|. shiftMask, xK_e), spawn "bash -l -c emacs")
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
