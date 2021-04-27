use medbnb;

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `created_at`, `username`, `password`, `rate`, `languages`, `picture`)
 VALUES (UUID(), "Manuel Ochoa", "+573167449599", "mochoa1127@gmail.com", now(), "mgochoa", "50b68aae3f19536f05124cc8afbc2062e8d6fa68",5 , '["spanish","english"]', "null");
 
INSERT INTO `user` (`id`, `name`, `phone`, `email`, `created_at`, `username`, `password`, `rate`, `languages`, `picture`)
 VALUES (UUID(), "Javier Gamboa", "+3002001000", "javier.gamboa@gmail.com", now(), "j.gamboa", "beb5e23c89e7a4b2b8765d068a888fc38fe8cfe8",4.3 , '["spanish","english"]', "null");
