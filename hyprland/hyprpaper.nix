{config, libs, pkgs,...}:

{
    services.hyprpaper = {
        enable = true;
        settings = {
           ipc = "off";
           splash = false;

           preload=["~/Pictures/rainworld_wallpaper.png"];
           wallpaper=[",~/Pictures/rainworld_wallpaper.png"];
        };
    };

}
