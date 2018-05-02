#Stuff to add before public itch.io release
- Zoom
- Harvest Crops
- Sell Crops

# The Barn
- Houses items(crops, seed and other stuff)
- Has a UI to sell items

# Picker
- Add option to select between different tools (hoe, shovel, sickle,seeds) - Done
- Have a icon in the bottom left corner showing what tool you have selected - Done
- When selecting a seed type a window pops up with the different seed types and how many you have of each

# Crops
- Add a crop manager - Done
- Implement tick system - Done
- The crop manager renders the crops - Done
- Add a "Seed bank"
- Each crop has a simple "state" variable from 1-10 depending on the crop growth
- Every tick (1 minute) the crops may or may not grow depending on some factors

# Selling and buying crops
### Ideas
- Simple keyboard controlled shop for seeds

# Bugs
- Wierd error with the collumns - Fixed (Found out I accidentally declared the index variable as 1)
- CropManager only draws one crop - Fixed (The Crop class and a few others were wrong... Thanks LÖVE2d discord!)
