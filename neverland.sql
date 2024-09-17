/*
 Navicat Premium Data Transfer

 Source Server         : admin
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : neverland

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 05/09/2024 01:02:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for checkpoint_images
-- ----------------------------
DROP TABLE IF EXISTS `checkpoint_images`;
CREATE TABLE `checkpoint_images`  (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `checkpoint_id` int NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `checkpoint_id`(`checkpoint_id` ASC) USING BTREE,
  CONSTRAINT `checkpoint_images_ibfk_1` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoints` (`checkpoint_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkpoint_images
-- ----------------------------
INSERT INTO `checkpoint_images` VALUES (1, 1, 'image/checkpoint_images/1-12.jpg');
INSERT INTO `checkpoint_images` VALUES (2, 1, 'image/checkpoint_images/1-21.jpg');
INSERT INTO `checkpoint_images` VALUES (3, 1, 'image/checkpoint_images/1-22.jpg');
INSERT INTO `checkpoint_images` VALUES (4, 1, 'image/checkpoint_images/1-23.jpg');
INSERT INTO `checkpoint_images` VALUES (5, 1, 'image/checkpoint_images/1-31.jpg');
INSERT INTO `checkpoint_images` VALUES (6, 1, 'image/checkpoint_images/1-32.jpg');
INSERT INTO `checkpoint_images` VALUES (7, 1, 'image/checkpoint_images/1-41.jpg');
INSERT INTO `checkpoint_images` VALUES (8, 1, 'image/checkpoint_images/1-42.jpg');
INSERT INTO `checkpoint_images` VALUES (9, 2, 'image/checkpoint_images/2.jpg');
INSERT INTO `checkpoint_images` VALUES (10, 3, 'image/checkpoint_images/3-1.png');
INSERT INTO `checkpoint_images` VALUES (11, 3, 'image/checkpoint_images/3-2.png');
INSERT INTO `checkpoint_images` VALUES (12, 3, 'image/checkpoint_images/3-3.png');
INSERT INTO `checkpoint_images` VALUES (13, 3, 'image/checkpoint_images/3-4.png');
INSERT INTO `checkpoint_images` VALUES (14, 3, 'image/checkpoint_images/3-5.PNG');
INSERT INTO `checkpoint_images` VALUES (15, 3, 'image/checkpoint_images/3-6.PNG');
INSERT INTO `checkpoint_images` VALUES (16, 4, 'image/checkpoint_images/4-1.png');
INSERT INTO `checkpoint_images` VALUES (17, 4, 'image/checkpoint_images/4-2.png');
INSERT INTO `checkpoint_images` VALUES (18, 4, 'image/checkpoint_images/4-3.png');
INSERT INTO `checkpoint_images` VALUES (19, 4, 'image/checkpoint_images/4-4.png');
INSERT INTO `checkpoint_images` VALUES (20, 4, 'image/checkpoint_images/4-5.PNG');
INSERT INTO `checkpoint_images` VALUES (21, 4, 'image/checkpoint_images/4-6.PNG');
INSERT INTO `checkpoint_images` VALUES (22, 5, 'image/checkpoint_images/5-1.JPG');
INSERT INTO `checkpoint_images` VALUES (23, 5, 'image/checkpoint_images/5-2.JPG');
INSERT INTO `checkpoint_images` VALUES (24, 5, 'image/checkpoint_images/5-3.JPG');
INSERT INTO `checkpoint_images` VALUES (25, 6, 'image/checkpoint_images/6-1.jpg');
INSERT INTO `checkpoint_images` VALUES (26, 6, 'image/checkpoint_images/6-2.PNG');
INSERT INTO `checkpoint_images` VALUES (27, 6, 'image/checkpoint_images/6-3.PNG');
INSERT INTO `checkpoint_images` VALUES (28, 7, 'image/checkpoint_images/7-1.JPG');
INSERT INTO `checkpoint_images` VALUES (29, 7, 'image/checkpoint_images/7-2.PNG');
INSERT INTO `checkpoint_images` VALUES (30, 7, 'image/checkpoint_images/7-3.PNG');
INSERT INTO `checkpoint_images` VALUES (31, 8, 'image/checkpoint_images/8.JPG');
INSERT INTO `checkpoint_images` VALUES (32, 28, 'image/checkpoint_images/28.PNG');
INSERT INTO `checkpoint_images` VALUES (33, 29, 'image/checkpoint_images/29.PNG');
INSERT INTO `checkpoint_images` VALUES (34, 30, 'image/checkpoint_images/30.jpg');
INSERT INTO `checkpoint_images` VALUES (35, 31, 'image/checkpoint_images/31.JPG');
INSERT INTO `checkpoint_images` VALUES (36, 32, 'image/checkpoint_images/32-1.JPG');
INSERT INTO `checkpoint_images` VALUES (37, 32, 'image/checkpoint_images/32-2.JPG');
INSERT INTO `checkpoint_images` VALUES (38, 33, 'image/checkpoint_images/33.JPG');
INSERT INTO `checkpoint_images` VALUES (39, 34, 'image/checkpoint_images/34-1.jpg');
INSERT INTO `checkpoint_images` VALUES (40, 34, 'image/checkpoint_images/34-2.jpg');
INSERT INTO `checkpoint_images` VALUES (41, 35, 'image/checkpoint_images/35-1.png');
INSERT INTO `checkpoint_images` VALUES (42, 35, 'image/checkpoint_images/35-2.png');
INSERT INTO `checkpoint_images` VALUES (43, 36, 'image/checkpoint_images/36-1.png');
INSERT INTO `checkpoint_images` VALUES (44, 36, 'image/checkpoint_images/36-2.png');
INSERT INTO `checkpoint_images` VALUES (45, 37, 'image/checkpoint_images/37-1.PNG');
INSERT INTO `checkpoint_images` VALUES (46, 37, 'image/checkpoint_images/37-2.PNG');
INSERT INTO `checkpoint_images` VALUES (47, 37, 'image/checkpoint_images/37-3.PNG');
INSERT INTO `checkpoint_images` VALUES (48, 38, 'image/checkpoint_images/38.JPG');
INSERT INTO `checkpoint_images` VALUES (49, 39, 'image/checkpoint_images/39-1.jpg');
INSERT INTO `checkpoint_images` VALUES (50, 39, 'image/checkpoint_images/39-2.PNG');
INSERT INTO `checkpoint_images` VALUES (51, 40, 'image/checkpoint_images/40-1.PNG');
INSERT INTO `checkpoint_images` VALUES (52, 40, 'image/checkpoint_images/40-2.PNG');
INSERT INTO `checkpoint_images` VALUES (53, 40, 'image/checkpoint_images/40-3.PNG');
INSERT INTO `checkpoint_images` VALUES (54, 41, 'image/checkpoint_images/41-1.JPG');
INSERT INTO `checkpoint_images` VALUES (55, 41, 'image/checkpoint_images/41-2.JPG');
INSERT INTO `checkpoint_images` VALUES (56, 41, 'image/checkpoint_images/41-3.JPG');
INSERT INTO `checkpoint_images` VALUES (57, 41, 'image/checkpoint_images/41-4.JPG');
INSERT INTO `checkpoint_images` VALUES (58, 41, 'image/checkpoint_images/41-5.JPG');
INSERT INTO `checkpoint_images` VALUES (59, 41, 'image/checkpoint_images/41-6.JPG');
INSERT INTO `checkpoint_images` VALUES (60, 42, 'image/checkpoint_images/42.PNG');
INSERT INTO `checkpoint_images` VALUES (61, 44, 'image/checkpoint_images/44.PNG');
INSERT INTO `checkpoint_images` VALUES (62, 45, 'image/checkpoint_images/45.png');
INSERT INTO `checkpoint_images` VALUES (63, 46, 'image/checkpoint_images/46.png');
INSERT INTO `checkpoint_images` VALUES (64, 43, 'image/checkpoint_images/43.png');
INSERT INTO `checkpoint_images` VALUES (65, 59, 'image/checkpoint_images/59-1.png');
INSERT INTO `checkpoint_images` VALUES (66, 59, 'image/checkpoint_images/59-2.png');
INSERT INTO `checkpoint_images` VALUES (67, 59, 'image/checkpoint_images/59-3.png');
INSERT INTO `checkpoint_images` VALUES (68, 60, 'image/checkpoint_images/60-1.png');
INSERT INTO `checkpoint_images` VALUES (69, 60, 'image/checkpoint_images/59-2.png');
INSERT INTO `checkpoint_images` VALUES (70, 60, 'image/checkpoint_images/59-3.png');

-- ----------------------------
-- Table structure for checkpoints
-- ----------------------------
DROP TABLE IF EXISTS `checkpoints`;
CREATE TABLE `checkpoints`  (
  `checkpoint_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `likes_count` int NULL DEFAULT 0,
  PRIMARY KEY (`checkpoint_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkpoints
-- ----------------------------
INSERT INTO `checkpoints` VALUES (1, '东京铁塔', '将太郎、银硕、成灿、元彬', 35.658676389514014, 139.74544362875568, 782);
INSERT INTO `checkpoints` VALUES (2, 'Bakehouse', '240601香港fancon吃的蛋挞', 22.300968560421534, 114.18428966438412, 520);
INSERT INTO `checkpoints` VALUES (3, 'Okutadami Maruyama Ski Resort ', '《Love 119》拍摄地——雪景', 37.1562963, 139.22903562000985, 765);
INSERT INTO `checkpoints` VALUES (4, '京王线站台——府中竞马正门前', '《Love 119》拍摄地——站台和列车', 35.6684223, 139.4847109, 128);
INSERT INTO `checkpoints` VALUES (5, 'グランイーグル西蒲田２', '《Love 119》拍摄地——居民区+马引桥', 35.575378, 139.72352302431534, 41);
INSERT INTO `checkpoints` VALUES (6, 'Tachikawa Sozosha', '《Love 119》拍摄地——学校', 35.692139657995654, 139.39027487116476, 786);
INSERT INTO `checkpoints` VALUES (7, 'Yamaodokosenjindo Bridge', '《Love 119》拍摄地——电车线+人行天桥', 35.59215059180185, 139.7302099085508, 536);
INSERT INTO `checkpoints` VALUES (8, 'Somunnan Gamjatang (Pork Bone Soup)', '成灿、Anton同款土豆脊骨汤', 37.4833426, 127.5941442, 423);
INSERT INTO `checkpoints` VALUES (28, '9.81 PARK Jeju', '《sungsho今天做什么》重力赛车体验', 33.389970543224685, 126.36636630539718, 500);
INSERT INTO `checkpoints` VALUES (29, '제주마음', '《sungsho今天做什么》刀鱼套餐pick:철판제주통갈치조림(2인)', 33.48674402619821, 126.4839456135126, 98);
INSERT INTO `checkpoints` VALUES (30, 'Kanidoraku Ibaraki / かに道楽 茨木店', 'RIIZE 同款日料店', 34.836183297824185, 135.5691649269886, 224);
INSERT INTO `checkpoints` VALUES (31, 'Fusaya honten', 'RIIE同款日料店（烧肉）', 34.67390718121606, 135.5139353865057, 725);
INSERT INTO `checkpoints` VALUES (32, '龍城飯店(リュウジョウハンテン) 香港路店', '位于日本横滨中华街的一家中餐馆', 35.443029134826695, 139.6457342298187, 543);
INSERT INTO `checkpoints` VALUES (33, 'Yoajung Froyo', '同款酸奶冰淇淋，成灿pick：蜂蜜巢+巧克力脆片+金芒果+阳光玫瑰+香蕉+草莓爆米花', 37.49171407302828, 127.00827844424445, 140);
INSERT INTO `checkpoints` VALUES (34, 'Lowide Coffee Bakery', '成灿、Anton同款咖啡店', 37.546887213333335, 127.04228815333333, 246);
INSERT INTO `checkpoints` VALUES (35, '청담고등학교（清潭高中）', '成灿的高中', 36.962277, 127.061491, 454);
INSERT INTO `checkpoints` VALUES (36, '광남고등학교（广南高中）', '银硕的高中', 37.3849543, 127.2380982798442, 204);
INSERT INTO `checkpoints` VALUES (37, 'Natas do Carmo', '《one kiss》mv拍摄蛋挞店', 38.71173850749634, -9.14130829291228, 56);
INSERT INTO `checkpoints` VALUES (38, 'South fountain of Rossio', '葡萄牙里斯本地标——RIIZE同款喷泉打卡地', 38.713560402175275, -9.13913908465909, 99);
INSERT INTO `checkpoints` VALUES (39, 'Kingemon Dotombori（金久右衛門 道頓堀店）', '银硕weverse上传的拉面pick', 34.66862659196234, 135.50311444048293, 752);
INSERT INTO `checkpoints` VALUES (40, 'Harajuku Mame Shiba Cafe', '物料《RIIZE in TOKYO》柴犬咖啡店', 35.69758451220602, 139.69594415250046, 1056);
INSERT INTO `checkpoints` VALUES (41, 'Hokkaido Ramen Mihachi', '物料《RIIZE in TOKYO》拉面店（饺子最棒）', 35.69481837212972, 139.69893957116483, 178);
INSERT INTO `checkpoints` VALUES (42, 'Yakiniku Futago', '物料《RIIZE in TOKYO》Anton去的烧肉店', 35.69508822317905, 139.70051400510854, 60);
INSERT INTO `checkpoints` VALUES (43, 'Daeyoo Land (ATV Hunting & Shooting)', '《sungsho今天做什么》飞碟射击', 33.27784761238553, 126.39531306251936, 150);
INSERT INTO `checkpoints` VALUES (44, 'St. Isidore Farm(성 이시돌 목장)', '《sungsho今天做什么》牛奶冰淇淋', 33.34613402504544, 126.32166785273968, 600);
INSERT INTO `checkpoints` VALUES (45, '언북중학교（彦北中学）', '成灿的初中', 37.5190812, 127.03324655068297, 400);
INSERT INTO `checkpoints` VALUES (46, '광진중학교（Gwangjin Middle School）', '银硕的初中', 37.53174795, 127.08965239095068, 321);
INSERT INTO `checkpoints` VALUES (54, '徐州市第一中学', NULL, 34.29518435, 117.13646670162143, 0);
INSERT INTO `checkpoints` VALUES (55, 'test', NULL, 34.205553169251345, 117.14697530434908, 1);
INSERT INTO `checkpoints` VALUES (59, '新华茶餐厅', '240601香港fancon成灿、shotaro吃的酥皮蛋挞', 22.3387397, 114.1561195, 1);
INSERT INTO `checkpoints` VALUES (60, '妈咪鸡蛋仔（铜锣湾店）', '240601香港fancon成灿、shotaro吃的鸡蛋仔', 22.2780152, 114.1865403, 0);
INSERT INTO `checkpoints` VALUES (61, '李雅静家', NULL, 34.2500718, 117.24048227240523, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `user_post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `post_id` int NULL DEFAULT NULL,
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`user_post_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, 17, 2, '好有创意！');
INSERT INTO `comments` VALUES (2, 1, 3, '^ ^看起来好幸福！！！');
INSERT INTO `comments` VALUES (3, 1, 6, '宝宝 卡套是哪一家的 好可爱~');
INSERT INTO `comments` VALUES (4, 3, 6, '看着不错 码了');
INSERT INTO `comments` VALUES (5, 10, 6, '正好等首尔安可场去打卡😍😍😍😋~~~');
INSERT INTO `comments` VALUES (7, 13, 3, '我有重要的话说：拍的真好看~');
INSERT INTO `comments` VALUES (9, 13, 8, '我们乌拉鹿太火了');
INSERT INTO `comments` VALUES (10, 10, 9, '老天爷 看着好感动');
INSERT INTO `comments` VALUES (11, 10, 8, '这家价格也不错！咖啡我记得是6000，盐面包是5500，甚至比国内便宜！');
INSERT INTO `comments` VALUES (12, 11, 8, 'hhh谢谢妈咪带我打卡');
INSERT INTO `comments` VALUES (13, 1, 2, '真帅');
INSERT INTO `comments` VALUES (14, 22, 9, '我也要我妈妈带我去！');
INSERT INTO `comments` VALUES (15, 23, 2, 'hhhhhh');

-- ----------------------------
-- Table structure for likes
-- ----------------------------
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes`  (
  `like_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `post_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`like_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likes
-- ----------------------------
INSERT INTO `likes` VALUES (1, 17, 2);
INSERT INTO `likes` VALUES (2, 17, 3);
INSERT INTO `likes` VALUES (5, 2, 2);
INSERT INTO `likes` VALUES (6, 2, 3);
INSERT INTO `likes` VALUES (8, 2, 5);
INSERT INTO `likes` VALUES (9, 2, 6);
INSERT INTO `likes` VALUES (11, 3, 2);
INSERT INTO `likes` VALUES (12, 3, 3);
INSERT INTO `likes` VALUES (13, 3, 5);
INSERT INTO `likes` VALUES (14, 3, 6);
INSERT INTO `likes` VALUES (15, 10, 2);
INSERT INTO `likes` VALUES (16, 10, 3);
INSERT INTO `likes` VALUES (17, 10, 5);
INSERT INTO `likes` VALUES (18, 10, 6);
INSERT INTO `likes` VALUES (19, 5, 2);
INSERT INTO `likes` VALUES (20, 5, 3);
INSERT INTO `likes` VALUES (22, 5, 5);
INSERT INTO `likes` VALUES (23, 5, 6);
INSERT INTO `likes` VALUES (25, 18, 3);
INSERT INTO `likes` VALUES (26, 18, 2);
INSERT INTO `likes` VALUES (28, 18, 5);
INSERT INTO `likes` VALUES (29, 18, 6);
INSERT INTO `likes` VALUES (31, 18, 8);
INSERT INTO `likes` VALUES (32, 18, 9);
INSERT INTO `likes` VALUES (34, 18, 11);
INSERT INTO `likes` VALUES (36, 5, 8);
INSERT INTO `likes` VALUES (37, 5, 9);
INSERT INTO `likes` VALUES (38, 1, 2);
INSERT INTO `likes` VALUES (39, 1, 3);
INSERT INTO `likes` VALUES (40, 1, 8);
INSERT INTO `likes` VALUES (42, 17, 5);
INSERT INTO `likes` VALUES (43, 17, 6);
INSERT INTO `likes` VALUES (45, 17, 8);
INSERT INTO `likes` VALUES (46, 17, 9);
INSERT INTO `likes` VALUES (47, 13, 2);
INSERT INTO `likes` VALUES (48, 13, 3);
INSERT INTO `likes` VALUES (50, 13, 5);
INSERT INTO `likes` VALUES (51, 13, 6);
INSERT INTO `likes` VALUES (52, 13, 8);
INSERT INTO `likes` VALUES (53, 13, 9);
INSERT INTO `likes` VALUES (54, 11, 2);
INSERT INTO `likes` VALUES (55, 11, 3);
INSERT INTO `likes` VALUES (57, 11, 5);
INSERT INTO `likes` VALUES (58, 11, 6);
INSERT INTO `likes` VALUES (59, 11, 8);
INSERT INTO `likes` VALUES (60, 11, 9);
INSERT INTO `likes` VALUES (61, 15, 2);
INSERT INTO `likes` VALUES (62, 15, 3);
INSERT INTO `likes` VALUES (64, 15, 5);
INSERT INTO `likes` VALUES (65, 15, 8);
INSERT INTO `likes` VALUES (66, 15, 9);
INSERT INTO `likes` VALUES (67, 1, 6);
INSERT INTO `likes` VALUES (68, 1, 5);
INSERT INTO `likes` VALUES (69, 5, 11);
INSERT INTO `likes` VALUES (70, 5, 16);
INSERT INTO `likes` VALUES (71, 1, 9);
INSERT INTO `likes` VALUES (72, 19, 3);
INSERT INTO `likes` VALUES (73, 21, 2);
INSERT INTO `likes` VALUES (74, 22, 21);
INSERT INTO `likes` VALUES (75, 23, 3);

-- ----------------------------
-- Table structure for post_images
-- ----------------------------
DROP TABLE IF EXISTS `post_images`;
CREATE TABLE `post_images`  (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`image_id`) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  CONSTRAINT `post_images_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post_images
-- ----------------------------
INSERT INTO `post_images` VALUES (1, 2, '/image/post_images/1724417192377.jpg');
INSERT INTO `post_images` VALUES (2, 2, '/image/post_images/1724417192378.jpg');
INSERT INTO `post_images` VALUES (3, 2, '/image/post_images/1724417192378.jpg');
INSERT INTO `post_images` VALUES (4, 3, '/image/post_images/1724417325352.jpg');
INSERT INTO `post_images` VALUES (5, 3, '/image/post_images/1724417325353.jpg');
INSERT INTO `post_images` VALUES (6, 3, '/image/post_images/1724417325353.jpg');
INSERT INTO `post_images` VALUES (7, 3, '/image/post_images/1724417325354.jpg');
INSERT INTO `post_images` VALUES (8, 5, '/image/post_images/1724418581820.jpg');
INSERT INTO `post_images` VALUES (9, 5, '/image/post_images/1724418581821.jpg');
INSERT INTO `post_images` VALUES (10, 6, '/image/post_images/1724418936995.jpg');
INSERT INTO `post_images` VALUES (11, 6, '/image/post_images/1724418936997.jpg');
INSERT INTO `post_images` VALUES (13, 8, '/image/post_images/1724602051315.jpg');
INSERT INTO `post_images` VALUES (14, 8, '/image/post_images/1724602051322.jpg');
INSERT INTO `post_images` VALUES (15, 8, '/image/post_images/1724602051326.jpg');
INSERT INTO `post_images` VALUES (16, 9, '/image/post_images/1724602168057.jpg');
INSERT INTO `post_images` VALUES (17, 9, '/image/post_images/1724602168061.jpg');
INSERT INTO `post_images` VALUES (18, 9, '/image/post_images/1724602168063.jpg');
INSERT INTO `post_images` VALUES (19, 9, '/image/post_images/1724602168064.jpg');
INSERT INTO `post_images` VALUES (20, 9, '/image/post_images/1724602168065.jpg');
INSERT INTO `post_images` VALUES (21, 9, '/image/post_images/1724602168066.jpg');
INSERT INTO `post_images` VALUES (22, 9, '/image/post_images/1724602168067.jpg');
INSERT INTO `post_images` VALUES (23, 11, '/image/post_images/1724602325063.jfif');
INSERT INTO `post_images` VALUES (25, 21, '/image/post_images/1725203143050.jfif');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publish_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `likes_count` int NULL DEFAULT 0,
  `checkpoint_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `checkpoint_id`(`checkpoint_id` ASC) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoints` (`checkpoint_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (2, 5, '今天去的时候碰见起码5组BRIIZE也来拍 小椅子真是火了', 'グランイーグル西蒲田２', '2024-08-23 20:46:32', 11, 5);
INSERT INTO `posts` VALUES (3, 5, '今天非常幸运 坐到了他们拍摄用的那辆电车 车长也是mv里开电车的那位[打call]车长非常热情地接待了前来打卡的BRIIZE😆还详细讲解了他们每个人坐在哪里站在哪里 怎么拍同款角度比如隔着车窗玻璃\r\n这个站是到赛马场门口的，平时人很少 ，这辆同款电车好像只在周一到周五运行，周末换别的车型。\r\n然后又去了学校取景地，たちかわ創造舎\r\n今天刚好有别的拍摄活动，但是还是进去浅浅转了一下。教室里不让进去，体育馆也关着门，操场倒是可以拍拍照\r\n\r\n回来才刷到一位的消息，祝贺椅子们！！', 'Fuchukeiba-seimonmae, 競馬場正門通り, Hachimancho 1-chome, 府中市, 日本', '2024-08-23 20:48:45', 12, 4);
INSERT INTO `posts` VALUES (5, 16, '清潭高中的郑成灿学长\r\n暗恋你很久了~请问能接受我的告白吗\r\n＞<', 'Songhwataekji-ro 25beon-gil, , 平澤市, 韩国 / 南韓', '2024-08-23 21:09:41', 10, 35);
INSERT INTO `posts` VALUES (6, 17, 'RIIZE同款打卡攻略|成灿荣土豆脊骨汤\r\n🍲소문난성수감자탕\r\n\r\n📍서울 성동구 연무장길 45\r\n\r\n去年九月我第一次去这家吃完，十一月就有xhs姐妹偶遇安安和成灿。虽然隔了两个月，但是美美get同款了。（偶遇后记可以直接搜索，就不放照片了）\r\n\r\n位置离圣水的地铁站和主要的一些购物商店都很近，附近逛累了都可以来吃饭。5月看完fancon应该也很多椅子妈去打卡了，他们家是24小时营业的，所以还蛮适合看完演唱会去吃的。\r\n\r\n建议最好是错开饭点来，否则会排长队。工作日的话，周围的职场人也会来吃，所以人真的蛮多的。\r\n\r\n不过他们家位置多，除了本馆左边还有个别馆。上菜的速度很快，所以等待时间不会特别特别长，不用太担心。\r\n\r\n土豆汤有两种类型的，一种是整份的汤锅，一种是每人一锅的小锅。整份的会分大中小，如果是食量不大的女生，两到三人都可以点小份。分量还是很多的，肉也很多。\r\n\r\n汤锅的话，锅开了就可以调成小火直接吃了，肉是提前炖好的，很软烂。\r\n\r\n店里有几个姨母是会说中文的，点菜不用担心交流的问题~\r\n\r\n味道的话，脊骨还是蛮入味的，但是土豆可能要多煮一会，不然比较清淡。我个人是觉得没有特别好吃，但是也有朋友觉得好吃的，所以可能还是口味差异吧。\r\n\r\n肉吃完还可以加拉面，他们家会送黄瓜辣椒什么的，好适合在小韩极其需要维生素的我，吃完脊骨汤啃个黄瓜。', '傳聞中的馬鈴薯排骨湯, Yeonmujang-gil, 聖水2街3洞, 首尔市 / 首爾, 韩国 / 南韓', '2024-08-23 21:15:36', 9, 8);
INSERT INTO `posts` VALUES (8, 15, '来SM不要错过的RIIZE成灿ANTON同款打卡哦\r\n🥐：LOWIDE\r\n\r\n店就在SM旷野附近，走一小会儿就到了，特别特别的好找，周围还有很多小店可以逛，拍照的镜子就在店出来的右手边，走五步左右就是不要走过了。\r\n\r\n他家真的好吃哦，推荐招牌的玉米盐面包，有内馅很满足，我们还点了一个像热狗的面包也很好吃，布朗尼有点甜但很扎实，爱吃的配着美式吃会很幸福哦，而且也蛮好拍照的，出了很多我满意的图。\r\n\r\n这家店我想二刷诶～给各位强烈推荐！\r\n\r\nPS：拍的照片没有乌拉鹿是因为售空了，这又是一段极其悲伤的故事🙁', 'Seoulsup 4-gil, Seoulsup 4-gil, 聖水1街2洞, 首尔市 / 首爾, 韩国 / 南韓', '2024-08-26 00:07:31', 7, 34);
INSERT INTO `posts` VALUES (9, 18, '一不小心散步散到我们石头的高中了呀🤭🤭大打卡一下 看到几个高中生在打篮球 另外几个在操场散步🚶也许也是我们硕儿青春时期的部分记忆', '광남고등학교, Hoean-daero, , 廣州市, 韩国 / 南韓', '2024-08-26 00:09:28', 7, 36);
INSERT INTO `posts` VALUES (11, 18, 'test', '皇姑窝村, 铜山区, 江苏省, 中国', '2024-08-26 00:12:05', 2, 55);
INSERT INTO `posts` VALUES (16, 1, '吃了椅子同款的酥皮蛋挞\r\n好吃！！！！\r\n可以现金，也可以八达通支付\r\n6：00-22：30营业 时间很长！', '新華茶餐廳, 青山道, 長沙灣, 九龍, 香港, 中国', '2024-08-27 23:28:54', 1, 59);
INSERT INTO `posts` VALUES (17, 1, '香香嫩嫩软软的\r\n一般中午十二点多才开门！宝宝们注意别跑空了！！！', '媽咪雞蛋仔, 希雲街, 加路連山, 銅鑼灣, 香港島, 香港, 中国', '2024-08-27 23:51:32', 0, 60);
INSERT INTO `posts` VALUES (18, 1, '21321565', '新華茶餐廳, 青山道, 長沙灣, 九龍, 香港, 中国', '2024-08-27 23:54:09', 0, 59);
INSERT INTO `posts` VALUES (21, 22, '爸爸妈妈我来啦', ', 黄山街道, 云龙区, 江苏省, 中国', '2024-09-01 23:05:43', 1, 61);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `profile_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'image/default-profile.png',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'fym', '123', 'image/profile_photo/1.jpg');
INSERT INTO `user` VALUES (2, 'zcc', '456', 'image/profile_photo/2.jpg');
INSERT INTO `user` VALUES (3, 'hb', '111', 'image/profile_photo/3.jpg');
INSERT INTO `user` VALUES (4, 'wyl', '222', 'image/profile_photo/4.jpg');
INSERT INTO `user` VALUES (5, 'Sakigamienai_', '123456', 'image/profile_photo/5.jpg');
INSERT INTO `user` VALUES (6, 'tomato', '000', 'image/profile_photo/6.jpg');
INSERT INTO `user` VALUES (7, 'ilovesummer', '000', 'image/profile_photo/7.jfif');
INSERT INTO `user` VALUES (8, 'sunrise', '000', 'image/default-profile.png');
INSERT INTO `user` VALUES (9, 'winter', '000', 'image/profile_photo/9.jfif');
INSERT INTO `user` VALUES (10, '这是我的小狗哦_°', '000', 'image/profile_photo/10.jpg');
INSERT INTO `user` VALUES (11, '兔喵鸭', '000', 'image/profile_photo/11.jpg');
INSERT INTO `user` VALUES (12, '给我一把椅子', '000', 'image/default-profile.png');
INSERT INTO `user` VALUES (13, '我有重要的话说', '000', 'image/profile_photo/13.jfif');
INSERT INTO `user` VALUES (14, '07212386', '000', 'image/profile_photo/14.webp');
INSERT INTO `user` VALUES (15, 'rissntbk_', '000', 'image/profile_photo/15.webp');
INSERT INTO `user` VALUES (16, 'jjeuhanvens', '000', 'image/profile_photo/16.webp');
INSERT INTO `user` VALUES (17, 'Riia_04321', '000', 'image/profile_photo/17.webp');
INSERT INTO `user` VALUES (18, 'ffishere', '000', 'image/profile_photo/18.webp');
INSERT INTO `user` VALUES (19, 'qiyue', '123', 'image/profile_photo/19.jpg');
INSERT INTO `user` VALUES (20, 'hhhhhhh', '000', 'image/profile_photo/20.jfif');
INSERT INTO `user` VALUES (21, '123456', '000000', 'image/profile_photo/21.jfif');
INSERT INTO `user` VALUES (22, '李枇斯鹊', '000', 'image/profile_photo/22.jfif');
INSERT INTO `user` VALUES (23, 'fzy', '123', 'image/profile_photo/23.jfif');

-- ----------------------------
-- Table structure for user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_favorites`;
CREATE TABLE `user_favorites`  (
  `favorite_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `post_id` int NULL DEFAULT NULL,
  `checkpoint_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`favorite_id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  INDEX `checkpoint_id`(`checkpoint_id` ASC) USING BTREE,
  CONSTRAINT `user_favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_favorites_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_favorites_ibfk_3` FOREIGN KEY (`checkpoint_id`) REFERENCES `checkpoints` (`checkpoint_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorites
-- ----------------------------
INSERT INTO `user_favorites` VALUES (6, 2, NULL, 8);
INSERT INTO `user_favorites` VALUES (7, 2, NULL, 30);
INSERT INTO `user_favorites` VALUES (8, 2, NULL, 39);
INSERT INTO `user_favorites` VALUES (9, 2, NULL, 4);
INSERT INTO `user_favorites` VALUES (10, 2, NULL, 36);
INSERT INTO `user_favorites` VALUES (15, 2, NULL, 33);
INSERT INTO `user_favorites` VALUES (18, 3, NULL, 1);
INSERT INTO `user_favorites` VALUES (19, 3, NULL, 28);
INSERT INTO `user_favorites` VALUES (20, 3, NULL, 32);
INSERT INTO `user_favorites` VALUES (21, 5, NULL, 2);
INSERT INTO `user_favorites` VALUES (23, 5, NULL, 33);
INSERT INTO `user_favorites` VALUES (24, 5, NULL, 36);
INSERT INTO `user_favorites` VALUES (25, 5, NULL, 3);
INSERT INTO `user_favorites` VALUES (26, 5, NULL, 34);
INSERT INTO `user_favorites` VALUES (27, 17, NULL, 1);
INSERT INTO `user_favorites` VALUES (28, 17, NULL, 2);
INSERT INTO `user_favorites` VALUES (29, 17, NULL, 4);
INSERT INTO `user_favorites` VALUES (31, 18, NULL, 4);
INSERT INTO `user_favorites` VALUES (32, 18, NULL, 8);
INSERT INTO `user_favorites` VALUES (34, 18, NULL, 3);
INSERT INTO `user_favorites` VALUES (35, 18, NULL, 5);
INSERT INTO `user_favorites` VALUES (36, 18, NULL, 6);
INSERT INTO `user_favorites` VALUES (37, 18, NULL, 7);
INSERT INTO `user_favorites` VALUES (38, 18, NULL, 29);
INSERT INTO `user_favorites` VALUES (39, 18, NULL, 33);
INSERT INTO `user_favorites` VALUES (40, 18, NULL, 35);
INSERT INTO `user_favorites` VALUES (41, 18, NULL, 34);
INSERT INTO `user_favorites` VALUES (42, 15, NULL, 1);
INSERT INTO `user_favorites` VALUES (43, 15, NULL, 35);
INSERT INTO `user_favorites` VALUES (44, 15, NULL, 34);
INSERT INTO `user_favorites` VALUES (54, 1, NULL, 34);
INSERT INTO `user_favorites` VALUES (55, 1, NULL, 2);
INSERT INTO `user_favorites` VALUES (56, 2, NULL, 1);
INSERT INTO `user_favorites` VALUES (57, 1, 6, 8);
INSERT INTO `user_favorites` VALUES (58, 5, 16, 59);
INSERT INTO `user_favorites` VALUES (63, 19, 3, 4);
INSERT INTO `user_favorites` VALUES (68, 1, NULL, 1);
INSERT INTO `user_favorites` VALUES (69, 1, NULL, 59);
INSERT INTO `user_favorites` VALUES (71, 1, 9, 36);
INSERT INTO `user_favorites` VALUES (74, 1, 2, 5);
INSERT INTO `user_favorites` VALUES (75, 22, 21, 61);
INSERT INTO `user_favorites` VALUES (77, 22, NULL, 29);
INSERT INTO `user_favorites` VALUES (78, 23, 3, 4);
INSERT INTO `user_favorites` VALUES (81, 23, NULL, 60);
INSERT INTO `user_favorites` VALUES (82, 23, NULL, 1);
INSERT INTO `user_favorites` VALUES (83, 23, NULL, 2);

-- ----------------------------
-- Table structure for venues
-- ----------------------------
DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `schedule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `moreInfo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES (21, '合肥体育中心体育场', '安徽省合肥市蜀山区合肥体育中心', '邓紫棋 - 2024年9月16日', '场馆可容纳15000人');
INSERT INTO `venues` VALUES (22, '徐州音乐厅', '江苏省徐州市泉山区滨湖公园7号', '邓紫棋 - 2024年8月11日', '无');

SET FOREIGN_KEY_CHECKS = 1;
