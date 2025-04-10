use AppFood_CyberSoft;

CREATE TABLE `user`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`email` VARCHAR(255) not null UNIQUE,
	`fullname` VARCHAR(255),
	`password` varchar(255),
	
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `food`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`food_name` VARCHAR(255) not null UNIQUE,
	`image` VARCHAR(255),
	`price` FLOAT,
	`desc` varchar(255),
	`type_id` int not NULL,
	
	FOREIGN KEY (`type_id`) REFERENCES `food_type` (`id`),
	
	
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `food_type`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`type_name` VARCHAR(255),
	
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `sub_food`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`sub_name` VARCHAR(255),
	`sub_price` FLOAT,
	`food_id` int not null,
	
	FOREIGN KEY(`food_id`) REFERENCES `food`(`id`),
	
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `order`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`food_id` int not null,
	`user_id` int not null,
	
	`amount` int,
	`code` VARCHAR(255),
	`arr_sub_id` VARCHAR(255),
	
	FOREIGN KEY(`food_id`) REFERENCES `food`(`id`),
	FOREIGN KEY(`user_id`) REFERENCES `user`(`id`),
	
	
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE `restaurant`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`res_name` VARCHAR(255),
	`image` VARCHAR(255),
	`desc` VARCHAR(255),
		
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);	


CREATE TABLE `rate_res`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`user_id` int not null, 
	`res_id` int not null,
	`amount` int,
	`date_rate` DATE,

	FOREIGN key (`res_id`) REFERENCES `restaurant` (`id`),
	FOREIGN key (`user_id`) REFERENCES `user` (`id`),
		
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

drop TABLE `rate_res`;

CREATE TABLE `like_res`(
	`id` int PRIMARY KEY not null AUTO_INCREMENT,
	
	`user_id` int not null,
	`res_id` int not null,
	`date_like` DATE,

	FOREIGN key (`res_id`) REFERENCES `restaurant` (`id`),
	FOREIGN key (`user_id`) REFERENCES `user` (`id`),
		
	`deletedBy` int not null DEFAULT 0,
	`isDeleted` TINYINT(1) NOT NULL DEFAULT 0,
	`deletedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Thêm dữ liệu vào bảng `user`
INSERT INTO `user` (`email`, `fullname`, `password`) VALUES
('john.doe@example.com', 'John Doe', 'password123'),
('jane.smith@example.com', 'Jane Smith', 'securepass456'),
('alice.wonderland@example.com', 'Alice Wonderland', 'alicepass789'),
('bob.marley@example.com', 'Bob Marley', 'reggaepass321'),
('charlie.brown@example.com', 'Charlie Brown', 'peanuts123'),
('david.jones@example.com', 'David Jones', 'djpass456'),
('emily.clark@example.com', 'Emily Clark', 'emilysecure789'),
('frank.wright@example.com', 'Frank Wright', 'wrightpass987'),
('grace.hopper@example.com', 'Grace Hopper', 'codingqueen123'),
('harry.potter@example.com', 'Harry Potter', 'hogwarts321');

-- Thêm dữ liệu vào bảng `food_type`
INSERT INTO `food_type` (`type_name`) VALUES
('Italian'),
('Japanese'),
('Fast Food');

-- Thêm dữ liệu vào bảng `food`
INSERT INTO `food` (`food_name`, `image`, `price`, `desc`, `type_id`) VALUES
('Pizza Margherita', 'pizza.jpg', 12.99, 'Classic Italian pizza', 1),
('Sushi Roll', 'sushi.jpg', 8.50, 'Delicious sushi with salmon', 2),
('Burger Deluxe', 'burger.jpg', 10.00, 'Juicy beef burger with cheese', 3);

-- Thêm dữ liệu vào bảng `sub_food`
INSERT INTO `sub_food` (`sub_name`, `sub_price`, `food_id`) VALUES
('Extra Cheese', 2.00, 1),
('Wasabi & Soy Sauce', 1.50, 2),
('French Fries', 3.00, 3);

INSERT INTO `order` (`food_id`, `user_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 2, 'ORD001', '1,3'),
(2, 1, 1, 'ORD002', '2'),
(3, 1, 3, 'ORD003', '3'),
(1, 1, 5, 'ORD004', '1,2,3'),
(2, 1, 4, 'ORD005', '2,3'),
(3, 2, 2, 'ORD006', '3'),
(1, 2, 3, 'ORD007', '1'),
(2, 2, 1, 'ORD008', '2,3'),
(3, 2, 4, 'ORD009', '3'),
(1, 3, 5, 'ORD010', '1,2'),
(3, 3, 2, 'ORD011', '3'),
(2, 3, 3, 'ORD012', '2,3'),
(1, 4, 4, 'ORD013', '1,3'),
(2, 4, 2, 'ORD014', '2,3'),
(3, 4, 3, 'ORD015', '3'),
(1, 5, 5, 'ORD016', '1,2'),
(2, 5, 4, 'ORD017', '2,3'),
(3, 5, 3, 'ORD018', '3'),
(1, 5, 6, 'ORD019', '1,3'),
(2, 5, 2, 'ORD020', '2');


-- Thêm dữ liệu vào bảng `restaurant`
INSERT INTO `restaurant` (`res_name`, `image`, `desc`) VALUES
('Italian Delight', 'italian.jpg', 'Authentic Italian cuisine'),
('Sushi Paradise', 'sushi.jpg', 'Best sushi in town'),
('Burger Haven', 'burger.jpg', 'Delicious gourmet burgers');

-- Thêm dữ liệu vào bảng `rate_res`
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 5, '2025-03-15 12:30:00'),
(2, 1, 4, '2025-03-15 13:00:00'),
(3, 2, 5, '2025-03-15 14:00:00'),
(4, 3, 3, '2025-03-15 15:30:00'),
(5, 2, 4, '2025-03-15 16:00:00');

-- Thêm dữ liệu vào bảng `like_res`
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2025-03-15 12:05:00'),
(1, 2, '2025-03-15 12:15:00'),
(1, 3, '2025-03-15 12:25:00'),
(2, 1, '2025-03-15 12:35:00'),
(2, 2, '2025-03-15 12:45:00'),
(2, 3, '2025-03-15 12:55:00'),
(3, 1, '2025-03-15 13:05:00'),
(3, 2, '2025-03-15 13:15:00'),
(3, 3, '2025-03-15 13:25:00'),
(4, 1, '2025-03-15 13:35:00'),
(4, 2, '2025-03-15 13:45:00'),
(4, 3, '2025-03-15 13:55:00'),
(5, 1, '2025-03-15 14:05:00'),
(5, 2, '2025-03-15 14:15:00'),
(5, 3, '2025-03-15 14:25:00'),
(6, 1, '2025-03-15 14:35:00'),
(7, 2, '2025-03-15 14:45:00'),
(8, 3, '2025-03-15 14:55:00'),
(9, 1, '2025-03-15 15:05:00'),
(10, 2, '2025-03-15 15:15:00');

-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT COUNT(`user_id`) as 'Số lần like', `user_id` , `email`
FROM `like_res`
INNER JOIN `user` on `user`.id = `like_res`.user_id
GROUP BY `user_id`
ORDER BY `Số lần like` DESC
LIMIT 5

-- Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT COUNT(`user_id`) as 'Số lần like', `res_id`, `res_name`
FROM `like_res`
INNER JOIN `restaurant` on `restaurant`.id = `like_res`.res_id
GROUP BY `res_id`, `res_name`
ORDER BY `Số lần like` DESC
LIMIT 2;

SELECT * FROM `order`;
-- Tìm người đã đặt hàng nhiều nhất.
SELECT COUNT(`user_id`) as 'Số lần đặt hàng', `user_id` , `email`
FROM `order`
INNER JOIN `user` on `user`.id = `order`.user_id
GROUP BY `user_id`
ORDER BY `Số lần đặt hàng` DESC
LIMIT 1;

-- Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT `user`.id as `id` , `email`, `fullname`
FROM `user`
LEFT JOIN `order` ON `user`.id = `order`.user_id
LEFT JOIN `like_res` ON `user`.id = `like_res`.user_id
LEFT JOIN `rate_res` ON `user`.id = `rate_res`.user_id
WHERE `order`.user_id IS NULL 
  AND `like_res`.user_id IS NULL 
  AND `rate_res`.user_id IS NULL;