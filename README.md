# My Hyprland Sanctuary

This repository is a portal into my Hyprland configuration, a meticulously crafted symphony of pixels and functionality designed to enhance my digital experience. Feel free to explore these dotfiles and borrow what resonates with you, but remember, the true magic lies in making them your own.

## 🌚 Highlights

- **Sleek & Aesthetic:** Enjoy a cohesive look and feel across your Hyprland workspace.
- **Modular Waybar:** Stay informed with customizable modules for time, weather, media controls, and more.
- **Rofi App Launcher:** Navigate your applications with elegant efficiency.
- **Dunst Notifications:** Receive gentle yet informative notifications that blend seamlessly with your setup.
- **Catppuccin Theme:** Immerse yourself in the soothing pastel aesthetics of the Catppuccin theme, designed for harmony and focus.

## 💡 Dependencies

Just Install the whole Gnome Desktop at first, it's easier than installing all the components one by one🥲 But if you don't like whole bunch of stuff on you PC, You can read `hyprland.conf` and figure out what software needed to be installed, Here's some of them: `gnome-keyring-daemon`, `Gnome SSH Agent`, `polkit-gnome-authentication-agent`, `gnome-control-center`, `gnome-calendar`, `gnome-weather`, `epiphany`

Other software you need to install are `hyprland`, `waybar`, `dunst`, `swaylock` and `rofi`. You also need to have an [Open Weather](openweathermap.org) API key for getting weather data.

## 🚀 Launch into Your Hyprland Oasis

**Prepare for liftoff:**

1. **Clone this repository:** Open your terminal and type `git clone https://github.com/taiwbi/hyprland-dotfiles.git ~/hyprland-dotfiles`.

2. **Set your monitor:** Find your monitor details by running `hyprctl monitors`. Edit the first line in `~/.config/hyprland/hyprland.conf` to match your settings, like this:

  ```
  monitor=eDP-1,1920x1080,0x0,1
  ```

  Need more guidance? Consult the [Hyprland Wiki](https://wiki.hyprland.org/Configuring/Monitors/)

3. **Choose your wallpapers:** This configuration reads your primary wallpaper from `~/Pictures/wallpaper/background-dark.png`. Additionally, `~/Pictures/wallpaper/x-d.png` serves as a backup, accessible by pressing `SUPER + X`. Switch back to your main wallpaper with `SUPER + ALT + X`. There is also a file `~/Pictures/wallpaper/background-blur.png` which will be set as your background picture on Sway lock screen, I use the blurred version of my wallpaper for it but you can use anything.

4. **Configure environment variables:** Copy `~/.config/hypr/env.conf.example` to `~/.config/hypr/env.conf` and adjust the variables according to the instructions and descriptions provided within the file.

5. **Blast off!** Log out and back into your Hyprland session to witness your personalized workspace take flight.

**Remember:** This is just the launch sequence. Feel free to explore and customize the files further to perfectly match your preferences!

## ✨ Additional Notes

- This configuration is meant work on my computer, so you might need to tweak some changes to make it work for you.

