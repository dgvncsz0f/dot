import           Data.Monoid
import           System.IO
import           XMonad
import           XMonad.Actions.Warp
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.NoBorders
import           XMonad.Util.EZConfig       (additionalKeys)
import           XMonad.Util.Run            (spawnPipe)

myManageHook :: Query (Endo WindowSet)
myManageHook =
  composeOne [transience, isDialog -?> doCenterFloat, isFullscreen -?> doFloat]

myAdditionalKeys :: [((KeyMask, KeySym), X ())]
myAdditionalKeys =
  [ ( (noModMask, stringToKeysym "XF86AudioMute")
    , spawn "amixer set Master toggle")
  , ( (noModMask, stringToKeysym "XF86MonBrightnessUp")
    , spawn "xbacklight -inc 10")
  , ( (noModMask, stringToKeysym "XF86AudioRaiseVolume")
    , spawn "amixer set Master 5dB+")
  , ( (noModMask, stringToKeysym "XF86AudioLowerVolume")
    , spawn "amixer set Master 5dB-")
  , ( (noModMask, stringToKeysym "XF86MonBrightnessDown")
    , spawn "xbacklight -dec 10")
  , ((myModMask .|. shiftMask, xK_s), spawn "prnscr")
  , ((myModMask .|. shiftMask, xK_e), spawn "/bin/bash -l -c dx15_editor")
  , ((myModMask .|. shiftMask, xK_b), spawn "/bin/bash -c conkeror")
  , ((myModMask, xK_x), spawn "xscreensaver-command -lock")
  , ((myModMask, xK_p), spawn "/bin/bash -l -c 'rofi -dmenu'")
  , ((myModMask, xK_r), spawn "/bin/bash -l -c 'rofi -show run'")
  , ((myModMask, xK_z), warpToWindow 0 0)
  ]

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myModMask :: KeyMask
myModMask = mod4Mask

myConfig = do
  xmbfd <- spawnPipe "xmobar"
  return $
    def
    { manageHook = manageDocks <+> myManageHook <+> manageHook def
    , layoutHook = layouts
    , logHook = dynamicLogWithPP xmobarPP {ppOutput = hPutStrLn xmbfd}
    , modMask = myModMask
    , terminal = "gnome-terminal"
    , workspaces = myWorkspaces
    , startupHook = setWMName "LG3D"
    , handleEventHook = docksEventHook <+> handleEventHook def
    } `additionalKeys`
    myAdditionalKeys
  where
    layouts =
      avoidStruts $
      smartBorders $
      Full ||| Tall 1 (3 / 100) (4 / 5) ||| Mirror (Tall 1 (3 / 100) (4 / 5))

main :: IO ()
main = fixEncoding >> fmap ewmh myConfig >>= xmonad
  where
    fixEncoding = hSetBinaryMode stdout True -- xmonad handling utf8 encoding
