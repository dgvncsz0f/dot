import System.IO
import Data.Monoid
import XMonad
import XMonad.Util.Run (spawnPipe)
import XMonad.Layout.Named
import XMonad.Actions.Warp
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.DynamicLog
import XMonad.Layout.StackTile
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers

myManageHook :: Query (Endo WindowSet)
myManageHook = composeAll [ className =? "Pidgin"      --> doFloat
                          , className =? "Skype"       --> doFloat
                          , className =? "Ediff"       --> doFloat
                          , isFullscreen               --> doFullFloat
                          ]

myAdditionalKeys :: [((KeyMask, KeySym), X ())]
myAdditionalKeys = [ ((noModMask, stringToKeysym "XF86AudioMute"), spawn "amixer set Master toggle")
                   , ((noModMask, stringToKeysym "XF86MonBrightnessUp"), spawn "xbacklight -inc 10")
                   , ((noModMask, stringToKeysym "XF86AudioRaiseVolume"), spawn "amixer set Master 5dB+")
                   , ((noModMask, stringToKeysym "XF86AudioLowerVolume"), spawn "amixer set Master 5dB-")
                   , ((noModMask, stringToKeysym "XF86MonBrightnessDown"), spawn "xbacklight -dec 10")
                   , ((myModMask .|. shiftMask, xK_s), spawn "prnscr")
                   , ((myModMask .|. shiftMask, xK_e), spawn "/bin/bash -l -c emacs")
                   , ((myModMask .|. shiftMask, xK_b), spawn "conkeror")
                   , ((myModMask              , xK_x), spawn "x11-lock")
                   , ((myModMask              , xK_p), spawn "passmenu")
                   , ((myModMask              , xK_r), spawn "dmenu_run")
                   , ((myModMask              , xK_z), warpToWindow 0 0)
                   ]

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myModMask :: KeyMask
myModMask = mod4Mask

myConfig = do
  spawn "xscreensaver -no-splash"
  spawn "/bin/sh -c $HOME/.bash.d/bin/autorandr.sh"
  xmbfd <- spawnPipe "xmobar"
  return $ def { manageHook      = manageDocks <+> myManageHook <+> manageHook def
               , layoutHook      = layouts
               , logHook         = dynamicLogWithPP xmobarPP { ppOutput = hPutStrLn xmbfd}
               , modMask         = myModMask
               , terminal        = "/usr/bin/lilyterm"
               , workspaces      = myWorkspaces
               , handleEventHook = docksEventHook <+> handleEventHook def
               } `additionalKeys` myAdditionalKeys
  where
    layouts = avoidStruts $ smartBorders  $ lTabs ||| lTall ||| lFull ||| lStck

    lTall = named "tall" $ Tall 1 (3/100) (1/2)
    lTabs = named "tabbed" simpleTabbed
    lFull = named "full" Full
    lStck = named "stack" $ StackTile 1 (3/100) (1/2)

main :: IO ()
main = fixEncoding >> fmap ewmh myConfig >>= xmonad
  where fixEncoding = hSetBinaryMode stdout True -- xmonad handling utf8 encoding
