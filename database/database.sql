-- 
-- Replace TABLE with your table name - For instance, users, users_of_servers (Refer to your database and locate the table where player data is stored)
-- Example. ALTER TABLE `users` ADD `ped` longtext COLLATE utf8mb4_bin DEFAULT 'none';
--

ALTER TABLE `TABLE` 
    ADD `ped` LONGTEXT COLLATE utf8mb4_bin DEFAULT 'none';

--
-- If you decide to change 'none', remember to update it in settings/config.lua [ DefaultPedDB = 'none' ]
-- If your table differs from 'users', refer to server/server.lua [ replace 'users' with your table name wherever applicable ]
--

--
-- To remove a player's ped, access the database - locate the player's data, find the 'ped' column, and set the model to 'none' [ use 'none' if you haven't modified database.sql ]
--
