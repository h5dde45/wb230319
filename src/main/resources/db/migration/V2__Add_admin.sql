insert into usr (id, active, email, password, username)
values (1, true, null, 'admin', 'admin');
insert into user_role(user_id, roles)
VALUES (1, 'USER'),
       (1, 'ADMIN');