# Ped Setter Script

## Description
The Ped Setter Script is a resource designed for FiveM servers that allows administrators to set custom player models (peds) for players in-game. It provides essential functionalities for managing player appearance, enhancing roleplay experiences, and adding diversity to character customization.

## Installation
1. **Clone the repository:**
2. **Install Dependencies:**

Before running the project, make sure to install dependencies using the following command:

**Note:** Ensure that you have the necessary resources and configurations in your FiveM server.

## Configuration
- **Database Setup:**
- Open the `database.sql` file and replace `TABLE` with the name of your database table where player data is stored.
- **Configuration Settings:**
- In the `shared/sh_Config.lua` file, you can modify the `DefaultPedDB` variable if you change the default value for the `ped` column in your database.
- **Customization:**
- If your database table is different from the default `users`, make the necessary replacements in the script files.

## Usage
1. **Start the Resource:**
Ensure that you start the resource in your FiveM server.
2. **Permissions:**
Grant administrators or specific roles the necessary permissions to access the functionalities provided by this resource.

## License
This project is licensed under the [MIT License](LICENSE).