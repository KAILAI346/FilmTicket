/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : db_film

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 10/06/2023 15:34:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin`  (
  `admin_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员姓名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员性别',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员联系电话',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '出生年月日',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员头像',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES (1, 'admin', 'admin', '男', '13414850215', '1999-9-9', '/images/admin/admin.gif');
INSERT INTO `t_admin` VALUES (2, 'zhonying', 'admin', '男', '1799633452', '2000-4-1', '/images/admin/admin02.gif');

-- ----------------------------
-- Table structure for t_cinema
-- ----------------------------
DROP TABLE IF EXISTS `t_cinema`;
CREATE TABLE `t_cinema`  (
  `cinema_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `cinema_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院名称',
  `cinema_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院电话',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在区县',
  `specified_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院详细地址',
  PRIMARY KEY (`cinema_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cinema
-- ----------------------------
INSERT INTO `t_cinema` VALUES (1, '中影数字影城', '13498476301', '天津', '天津', '北辰区', '北辰区京津路与龙洲道交口西北侧长瀛商业广场3层');
INSERT INTO `t_cinema` VALUES (2, '天津万达影城', '13745454545', '天津', '天津', '河北区', '河北区五马路20号新开河万达广场F3');
INSERT INTO `t_cinema` VALUES (4, '莱纳星影城', '13409989898', '天津', '天津', '南开区', '南开区长江道22号融侨中心裙楼3层');
INSERT INTO `t_cinema` VALUES (5, '中影国际影城(津南永旺梦乐城店)', '13465102832', '天津', '天津', '津南区', '津南区辛庄镇深特广场1号楼永旺梦乐城F3');
INSERT INTO `t_cinema` VALUES (6, '万达影城(天津滨海万达广场店)', '13454729283', '天津', '天津', '滨海新区', '滨海新区上海道与洞庭路交叉口');
INSERT INTO `t_cinema` VALUES (7, '天津津南星轶STARX影城', '13483743433', '天津', '天津', '津南区', '津南区咸水沽镇二八路与同砚路交口新城吾悦广场四层Z17商铺');
INSERT INTO `t_cinema` VALUES (8, '新城影院', '13418226112', '天津', '天津', '宝坻区', '宝坻区京津新城泰富橄榄树商业1-111');
INSERT INTO `t_cinema` VALUES (14, '天宇影城', '13498746534', '天津', '天津', '宝坻区', '宝坻区钰华街108号(尚客优东邻18米)');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `comment_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `user_score` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户评分',
  `comment_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '用户评论内容',
  `comment_date` datetime(6) NULL DEFAULT NULL COMMENT '评论日期',
  `support_num` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数',
  `is_pass` int(1) NULL DEFAULT 1 COMMENT '评论是否通过审核',
  `support_user` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '点赞用户数组',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `t_comment_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_comment_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (57, 1, 4, 9, '很好看，挺悲伤的，让我哭一会！', '2023-05-08 15:59:38.000000', 2, 1, '[1,53]');
INSERT INTO `t_comment` VALUES (58, 1, 7, 8, '很好看，有一起的吗？', '2023-04-13 16:05:46.000000', 2, 1, '[53,1]');
INSERT INTO `t_comment` VALUES (59, 55, 13, 9, '46516dv8sd', '2023-04-29 17:46:17.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (60, 55, 4, 9, 'uibbhhnhibuu', '2023-05-08 15:42:03.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (61, 19, 13, 4, '14650564', '2023-05-01 16:46:45.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (63, 55, 7, 8, '658949+6+69', '2023-05-08 16:01:49.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (66, 55, 34, 10, '12321654458', '2023-05-08 16:06:09.000000', 0, 1, NULL);
INSERT INTO `t_comment` VALUES (72, 55, 39, 10, '这电影真好看！！', '2023-06-05 09:19:14.000000', 0, 0, NULL);

-- ----------------------------
-- Table structure for t_hall
-- ----------------------------
DROP TABLE IF EXISTS `t_hall`;
CREATE TABLE `t_hall`  (
  `hall_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名称',
  PRIMARY KEY (`hall_id`) USING BTREE,
  INDEX `t_hall_ibfk_1`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hall
-- ----------------------------
INSERT INTO `t_hall` VALUES (30, 1, '1号激光厅');
INSERT INTO `t_hall` VALUES (32, 2, '1号激光厅');
INSERT INTO `t_hall` VALUES (34, 4, '1号激光厅');
INSERT INTO `t_hall` VALUES (35, 5, '1号激光厅');
INSERT INTO `t_hall` VALUES (36, 6, '1号激光厅');
INSERT INTO `t_hall` VALUES (37, 7, '1号激光厅');
INSERT INTO `t_hall` VALUES (38, 8, '1号激光厅');
INSERT INTO `t_hall` VALUES (40, 1, '2号激光厅');
INSERT INTO `t_hall` VALUES (41, 2, '2号激光厅');
INSERT INTO `t_hall` VALUES (42, 2, '3号激光厅');
INSERT INTO `t_hall` VALUES (43, 4, '2号激光厅');
INSERT INTO `t_hall` VALUES (44, 5, '2号激光厅');
INSERT INTO `t_hall` VALUES (45, 6, '2号激光厅');
INSERT INTO `t_hall` VALUES (46, 7, '2号激光厅');
INSERT INTO `t_hall` VALUES (47, 8, '2号激光厅');
INSERT INTO `t_hall` VALUES (50, 14, '5号激光厅');
INSERT INTO `t_hall` VALUES (51, 7, '六号放映厅');
INSERT INTO `t_hall` VALUES (52, 1, '九号巨幕厅');
INSERT INTO `t_hall` VALUES (53, 8, '七号');
INSERT INTO `t_hall` VALUES (54, 1, '2号激光厅');

-- ----------------------------
-- Table structure for t_movie
-- ----------------------------
DROP TABLE IF EXISTS `t_movie`;
CREATE TABLE `t_movie`  (
  `movie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影名称',
  `poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影海报',
  `director` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导演',
  `actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主演',
  `movie_long` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影片长',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影语言版本',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '电影简介',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影类型',
  `public_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影上映时间',
  `wish_num` int(4) UNSIGNED NULL DEFAULT 0 COMMENT '想看人数',
  `score` decimal(4, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  PRIMARY KEY (`movie_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_movie
-- ----------------------------
INSERT INTO `t_movie` VALUES (1, '龙马精神', '/images/movie/1683100781352.jpg', '扬子', '成龙', '126分钟', '国语', '生活落魄的武行老罗（成龙 饰）有一匹爱马“赤兔”，他一直想把它培养成片场的动作明星，不料却深陷官司，只能求助多年未见的女儿小宝（刘浩存 饰）和她的律师男友乃华（郭麒麟 饰）。小宝一边帮老罗打官司，一边劝说他不要带着赤兔玩命做危险动作，老罗不顾女儿反对继续偷偷训练赤兔，同时又对准女婿乃华展开了各种考验……', '喜剧', '2023-4-7', 0, 0.0);
INSERT INTO `t_movie` VALUES (3, '宇宙探索编辑部', '/images/movie/1683100896386.jpg', '孔大山', '杨皓宇', '118分钟', '国语', '脑洞大开高分奇片，地球人外星人千里奔现！　　唐志军（杨皓宇 饰）是一家诞生于上世纪八十年代的科幻杂志——《宇宙探索》编辑部的主编。现如今的杂志社日渐式微，唐志军也终成落魄潦倒，鳏寡孤独之人。但他却依然几十年如一日的痴迷于寻找地外文明。终于有一天，他接收到了一个疑似来自宇宙深处的异常信号，于是他召集同是天涯沦落人的伙伴们，带着那一个困惑他终生的问题，再一次踏上寻找外星人的旅途。', '科幻', '2023-4-1', 1, 0.0);
INSERT INTO `t_movie` VALUES (4, '龙与地下城：侠盗荣耀', '/images/movie/1683101007636.jpg', '约翰·弗朗西斯·戴利', '米歇尔·罗德里格兹', '134分钟', '英语', '震撼眼界的巨龙怪物，惊心动魄又笑料百出的征途冒险，愚人节电影院最佳拍档——奇幻动作冒险巨制《龙与地下城:侠盗荣耀》来袭！一群最能整活的侠盗小队共同制定了一场惊天盗窃计划，他们要找回遗失已久的圣物，迎战最强恶魔，赢回属于自己的荣耀！', '冒险', '2023-3-31', 872, 9.0);
INSERT INTO `t_movie` VALUES (6, '灌篮高手', '/images/movie/1683101302452.jpg', '井上雄彦 ', '樱木花道', '124分钟', '日语', '「The First Slam Dunk」是《灌篮高手》首部大电影，也是最后一部！弥补青春遗憾的机会只此一次！宫城良田、三井寿、流川枫、樱木花道和赤木刚宪终于站在全国大赛的赛场，代表湘北高中与日本最强球队山王工业展开激烈对决。面对强大的对手，湘北五人组没有退缩，在安西教练的指导下，他们抱着破釜沉舟的决心热血奋战，究竟湘北能否取得比赛的最终胜利？承载好几代人热血梦想的全国大赛即将开赛，巅峰之战，就此一决！27年的等待即将划上完美句点，是时候跟自己的青春道别了！', '动作', '2018-8-13', 878, 0.0);
INSERT INTO `t_movie` VALUES (7, '铃芽之旅', '/images/movie/1683101424611.jpg', '新海诚', '原菜乃华', '122分钟', '日语', '生活在日本九州田舍的17岁少女・铃芽遇见了为了寻找“门”而踏上旅途的青年。追随着青年的脚步，铃芽来到了山上一片废墟之地，在这里静静伫立着一扇古老的门，仿佛是坍塌中存留的唯一遗迹。铃芽仿佛被什么吸引了一般，将手伸向了那扇门…不久之后，日本各地的门开始一扇一扇地打开。据说，开着的门必须关上，否则灾祸将会从门的那一边降临于现世。星星，夕阳，拂晓，误入之境的天空，仿佛溶解了一切的时间。在神秘之门的引导下，铃芽踏上了关门的旅途。', '爱情', '2023-3-26', 188, 7.3);
INSERT INTO `t_movie` VALUES (9, '人生大事', '/images/movie/1683101854290.jpg', '张江江', '朱一龙', '112分钟', '国语', '殡葬师莫三妹（朱一龙 饰）在刑满释放不久后的一次出殡中，遇到了孤儿武小文（杨恩又 饰），小文的出现，意外地改变了莫三妹对职业和生活的态度。', '剧情', '2022-7-20', 254, 0.0);
INSERT INTO `t_movie` VALUES (10, '长空之王', '/images/movie/1683101509592.jpg', '刘晓世', '王一博', '128分钟', '国语', '发动机骤停甚至失火，飞机失去控制......高空之上，雷宇（王一博 饰）等年轻试飞员在队长张挺（胡军 饰）的带领下，一次次与死神过招，只为获取最极限的数据，试出最新型隐身战机。但随着战机交付日期的临近，任务难度逐渐升级。生死一线中，他们能否凯旋……笑泪燃爽俱全，全家都爱看的电影，唤醒孩子们对蓝天的向往。五一首选，高分佳作，正在热映中。', '动作', '2023-4-28', 154, 7.5);
INSERT INTO `t_movie` VALUES (11, '独行月球', '/images/movie/1683101779794.jpg', '张吃鱼', '沈腾   马丽', '122分钟', '国语', '人类为抵御小行星的撞击，拯救地球，在月球部署了月盾计划。陨石提前来袭，全员紧急撤离时，维修工独孤月（沈腾 饰）因为意外，错过了领队马蓝星（马丽 饰）的撤离通知，一个人落在了月球。不料月盾计划失败，独孤月成为了“宇宙最后的人类”，开始了他在月球上破罐子破摔的生活……', '科幻', '2022-10-1', 353, 7.5);
INSERT INTO `t_movie` VALUES (12, '侏罗纪世界3', '/images/movie/1683101958434.jpg', '科林·特雷沃罗', '克里斯·帕拉特', '147分钟', '英语', '电影将故事的开篇设定在了努布拉岛被摧毁四年之后。如今，恐龙在世界各 地与人类共存，并猎食。这一脆弱的平衡将重塑未来，并最终决定人类能否 在这颗与史上最可怕生物共享的星球上继续站在食物链的顶端。', '科幻', '2022-8-17', 575, 9.0);
INSERT INTO `t_movie` VALUES (13, '阿凡达：水之道', '/images/movie/1683101669103.jpg', '詹姆斯·卡梅隆', '佐伊·索尔达娜', '192分钟', '英语', '《阿凡达：水之道》设定在上一部影片的剧情落幕十余年后，讲述了萨利一家（杰克、奈蒂莉和孩子们）的故事：危机未曾消散，一家人拼尽全力彼此守护、奋力求生，并历经艰险磨难。杰克和奈蒂莉组建了家庭，他们的孩子也逐渐成长，为这个家庭带来了许多欢乐。然而危机未曾消散，萨利一家拼尽全力彼此守护、奋力求生，最终来到潘多拉星球临海的岛礁族寻求庇护。岛礁族首领特诺瓦里与罗娜尔为萨利一家提供了庇护所，这个部族的成员都是天生的潜水好手，也和海洋中的各种生物建立了密切联系。拥有流线型身躯的蛇颈水兽就和前作中丛林部族的重铠马一样，是岛礁部族信赖的伙伴。在影片中，潘多拉更多奇特自然景观将会揭开神秘的面纱。碧蓝深邃的海底世界，前所未见的海洋物种，世外桃源一般的岛礁，《阿凡达：水之道》将呈现完全不同于前作的全新地貌，从以幽暗为主色调的雨林来到波澜壮阔的海洋，带来无比强烈的视觉冲击。《阿凡达：水之道》由詹姆斯·卡梅隆执导。詹姆斯·卡梅隆、里克·杰法和阿曼达·斯尔沃联合操刀编剧，故事则由詹姆斯·卡梅隆、里克·杰法、阿曼达·斯尔沃、乔什·弗莱曼和夏恩·萨雷诺共同完成。詹姆斯·卡梅隆和乔恩·兰道担任制片人，戴维·瓦尔德斯和里查德·贝纳姆出任执行制片人。《阿凡达：水之道》将于12月16日在影院上映。', '科幻', '2022-12-26', 585, 6.5);
INSERT INTO `t_movie` VALUES (14, '满江红', '/images/movie/1683008437711.jpg', '张艺谋', '沈腾', '159分钟', '国语', '张艺谋最新高口碑悬疑喜剧感动热映中，沈腾、易烊千玺、张译、雷佳音、岳云鹏赴局探案有惊有喜，震撼演绎中国式传奇故事！南宋绍兴年间，岳飞死后四年，秦桧率兵与金国会谈。会谈前夜，金国使者死在宰相驻地，所携密信也不翼而飞。小兵张大（沈腾 饰）与亲兵营副统领孙均（易烊千玺 饰）机缘巧合被裹挟进这巨大阴谋之中，宰相秦桧（雷佳音 饰）命两人限一个时辰之内找到凶手。伴随危机四伏的深入调查，宰相府总管何立（张译 饰）、副总管武义淳（岳云鹏 饰）、舞姬瑶琴（王佳怡 饰）等人卷入局中，案件的背后似乎隐藏着一场更大的阴谋。局中有局、人心叵测，一夜之间风云变幻，各方势力暗流涌动……', '剧情', '2023-1-22', 10, 6.5);
INSERT INTO `t_movie` VALUES (15, '雷神4：爱与雷霆', '/images/movie/1683102062807.jpg', '塔伊加·维迪提', '克里斯·海姆斯沃斯', '119分钟', '英语', '在漫威影业出品的《雷神4：爱与雷霆》中，雷神索尔踏上了一段前所未有的旅程，一场对自我发现的探寻。然而，“屠神者”格尔 (Gorr the God Butcher) 出现，誓要屠戮众神，索尔的退休计划随之被迫中断。为了摆平危机，索尔找来女武神 (King Valkyrie)、科恩格(Korg) 以及前女友简·福斯特(Jane Foster) 助力。令索尔意外的是，简神奇地挥起了雷霆之锤 (Mjolnir)，成为了神威雷神 (the Mighty Thor)。众神踏上了一场危机四伏的宇宙冒险，尝试揭开“屠神者”格尔复仇背后的秘密，阻止他酿成大祸。', '喜剧', '2022-9-15', 355, 7.0);
INSERT INTO `t_movie` VALUES (16, ' 汪汪队立大功大电影', '/images/movie/1683102374683.jpg', '卡尔·布伦克尔 ', '伊恩·阿米蒂奇 ', '86分钟', '英语', '汪汪队出发救援！邪恶的海丁那成为了冒险湾的市长，并且准备对这座城市进行大肆破坏。小男孩莱德和他英勇的汪汪队小狗们必须打起十二分精神，准备迎接全新的挑战。与此同时，小狗阿奇不得不面对他在冒险湾复杂的过去。好在这时团队迎来了新的盟友，聪明的腊肠犬贝贝。带着升级的武器和装备，汪汪队已经准备好随时为拯救冒险湾的居民们而战！作为风靡全球的《汪汪队立大功》首部大电影，除了动画片中的原班人马外，伊恩·阿米蒂奇、马尔赛·马丁、罗恩·帕多、雅拉·沙希迪、金·卡戴珊、兰道尔·朴、戴克斯·夏普德、泰勒·派瑞、吉米·坎摩尔、威尔·布鲁斯宾等众星也将加盟这部影片。', '动漫', '2023-11-21', 658, 7.0);
INSERT INTO `t_movie` VALUES (17, '奇迹：笨小孩', '/images/movie/1683102480088.jpg', '文牧野', '易烊千玺', '106分钟', '国语', '二十岁的景浩（易烊千玺 饰）独自带着年幼的妹妹来到深圳生活，兄妹俩生活温馨却拮据。机缘巧合之下，景浩得到一个机会，本以为美好生活即将来临，却不料遭遇重创。在时间和金钱的双重压力下，毫无退路的景浩决定孤注一掷，而他陷入困境的平凡人生，又能否燃起希望的火花？电影《奇迹·笨小孩》是中宣部国家电影局 2021 年重点电影项目，也是 2021 年重点建党百年献礼片，描述十八大以后新时代年轻人在深圳创业的影片。', '剧情', '2022-1-24', 757, 7.0);
INSERT INTO `t_movie` VALUES (18, '神探大战', '/images/movie/1683102680878.jpg', '韦家辉', '刘青云', '101分钟', '粤语', '连环命案、私刑执法、预告杀人、以暴制暴...一群号称“神探”的团伙掀起了一场香港有史以来最邪恶的犯罪！患有精神疾病的“癫佬神探”李俊（刘青云 饰）为查真凶独闯犯罪现场！以“神探夫妇”陈仪（蔡卓妍 饰）和方礼信（林峯 饰）为首的重案组也开启了与杀戮赛跑的缉凶之路！敌友之间，正邪边缘，死亡审判的真相究竟是什么？真正的“神探”到底是谁？', '悬疑', '2022-7-8', 88, 7.0);
INSERT INTO `t_movie` VALUES (19, '哆啦A梦：大雄的宇宙小战争 2021', '/images/movie/1683102586498.jpg', '山口晋', '哆啦A梦  大雄', '109分钟', '日语', '大雄意外结识拇指外星人帕比，在哆啦A梦的帮助下，与大家一起穿越星际共同去守护匹里卡星，并开展了一段奇妙的宇宙冒险。', '动漫', '2022-5-27', 575, 7.0);
INSERT INTO `t_movie` VALUES (20, '奇异博士2：疯狂多元宇宙', '/images/movie/1683102785247.jpg', '斯科特·德瑞克森  山姆·雷米', '本尼迪克特·康伯巴奇', '130分钟', '英语', '外媒报道称，《奇异博士2》计划于明年春天展开六个月的拍摄工作，预计于2020年上映。演员本尼迪克特·康伯巴奇将获得750万英镑（约合6572万元）的片酬饰演奇异博士并完成电影。', '恐怖', '2022-5-6', 57, 7.5);
INSERT INTO `t_movie` VALUES (29, '大侦探皮卡丘', '/images/movie/1557131178228.jpg', '卡梅隆', '皮卡丘', '104分钟', '英语', '蒂姆·古德曼（贾斯提斯·史密斯 饰） 为寻找下落不明的父亲来到莱姆市，意外与父亲的前宝可梦搭档大侦探皮卡丘（瑞恩·雷诺兹 配音）相遇，并惊讶地发现自己是唯一能听懂皮卡丘说话的人类，他们决定组队踏上揭开真相的刺激冒险之路。探案过程中他们邂逅了各式各样的宝可梦，并意外发现了一个足以毁灭整个宝可梦宇宙的惊天阴谋。', '冒险', '2023-5-24', 358, 7.0);
INSERT INTO `t_movie` VALUES (33, '长津湖之水门桥', '/images/movie/1683102908894.jpg', '徐克  陈凯歌 ', '吴京', '149分钟', '国语', '影片以抗美援朝战争第二次战役中的长津湖战役为背景，讲述了在结 束了新兴里和下碣隅里的战斗之后，七连战士们又接到了更艰巨的任务……', '剧情', '2022-5-4', 124, 7.0);
INSERT INTO `t_movie` VALUES (34, '四海', '/images/movie/1683102989711.jpg', '韩寒', '刘昊然', '130分钟', '国语', '在码头做摩托车特技表演顺便拉客的年轻人吴仁耀，他多年不见的浪荡父亲吴仁腾；梦想大城市生活的餐馆服务员周欢颂和他浮夸真诚的哥哥周欢歌。一支从没有赢过一场比赛的“不败传说”车队频频出战，一群可笑又可爱的小人物命运交织。阿耀和欢颂都立志活成自己亲人的反面，想彼此取暖，彼此独立，却又总不在一个频道上。世事无常，他们不得不背井离乡，迎接一场未知旅途，阿耀的一身技能竟会用在一个自己都意想不到的场合，他的亲情友情和爱情最终又将会是如何…', '恐怖', '2022-2-1', 278, 7.0);
INSERT INTO `t_movie` VALUES (35, '壮志凌云2：独行侠', '/images/movie/1683103055435.jpg', '约瑟夫·科辛斯基', '汤姆·克鲁斯', '131分钟', '国语', '作为海军顶尖飞行员服役30多年后，皮特·米切尔（代号：“独行侠”）（汤姆·克鲁斯 饰演）决定打破体制的限制，成为一名试飞员接受更大的挑战。当他接到命令，为一项高难度特殊任务训练一群“高空利剑”项目的毕业生时，他遇到了已故的好友兼雷达截获官，代号“笨鹅”的尼克·布拉德肖中尉之子布莱德利·布拉德肖中尉（代号：“公鸡”）。 面对不确定的未来和难以释怀的心魔，独行侠必须战胜内心深处的恐惧。因此，他参与了一项需要巨大牺牲才能完成的任务。', '科幻', '2022-5-27', 1, 7.0);
INSERT INTO `t_movie` VALUES (36, '瞬息全宇宙', '/images/movie/1683103145617.jpg', '关家永', '杨紫琼', '118分钟', '英语', '55岁的美国华裔移民伊芙琳（杨紫琼 饰）家庭事业两崩溃。在老父亲生日大寿这天，除了要阻止女儿（许玮伦 饰）暴走出柜、替无用丈夫（关继威 饰）擦屁股，还得去税务局向古板大婶（杰米·李·柯蒂斯 饰）解释不太妙的税务问题。才踏进大楼电梯，软烂丈夫竟摇身一变演起黑客帝国，声称自己是另一个宇宙的版本，而秀莲也是千万宇宙里的其中一个。还来不及理解，邪恶势力已在多元宇宙中蔓延，世界即将毁灭，只有在这个宇宙里，“一无是处”的伊芙琳才能拯救世界……', '剧情', '2022-11-11', 24, 7.0);
INSERT INTO `t_movie` VALUES (37, '狙击手', '/images/movie/1683103335370.jpg', '张艺谋', '章宇', '180分钟', '国语', '影片根据抗美援朝战争“冷枪冷炮”运动中神枪手群体事迹改编。1952年冬至1953年初，中国人民志愿军与联合国军在朝鲜战场形成僵持，双方发起了低强度的密集狙击战，史称“冷枪冷炮运动”。在连长（张译 饰）带领下的狙击五班战士枪法过人，成为敌军的心头大患，班长刘文武（章宇 饰）更成为重点狙击对象。为重创狙击五班，敌方调配精英狙击小队，配以最先进的武器装备，更迫使狙击五班战士大永（陈永胜 饰）等人为救同伴进入其设好的险境之地。但正当敌军打响自己如意算盘之时，他们未料到，被他们当作诱饵的侦察兵亮亮（刘奕铁 饰）身上其实隐藏着更大的秘密......', '剧情', '2022-4-20', 96, 0.0);
INSERT INTO `t_movie` VALUES (38, '外太空的莫扎特', '/images/movie/1683103221903.jpg', '陈思诚', '荣梓杉', '156分钟', '国语', '任大望（黄渤 饰）一心想把喜好天文的儿子任小天（荣梓杉 饰）培养成钢琴演奏家，为此父子争吵不断。一天，神秘外星人莫扎特意外出现，从此，莫扎特帮助任小天开启了和爸爸“斗智斗勇”的生活。令任小天没有想到的是，莫扎特来到地球竟另有任务……', '喜剧', '2022-7-21', 20, 7.0);
INSERT INTO `t_movie` VALUES (39, '流浪地球2', '/images/movie/1683009105966.jpg', '郭帆', '吴京', '173分钟', '国语', '太阳即将毁灭，人类在地球表面建造出巨大的推进器，寻找新的家园，然而宇宙之路危机四伏，为了拯救地球，流浪地球时代的年轻人再次挺身而出，展开争分夺秒的生死之战...', '科幻', '2022-2-1', 12428, 0.0);
INSERT INTO `t_movie` VALUES (40, '123', '/images/movie/1685540890726.jpg', '刘星', '林老虎', '132分钟', '粤语', '这个电影真得绝了', '喜剧', '2023-5-1', 0, NULL);
INSERT INTO `t_movie` VALUES (41, '321', '/images/movie/1685925483634.jpg', '嗨嗨', '你来啦', '125分钟', '粤语', 'usbhguaduwgdwqbdgcdu9wqd', '言情', '2023-6-1', 0, NULL);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `schedule_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `order_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下单手机',
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户下单时间',
  `ticket_num` int(1) UNSIGNED NULL DEFAULT NULL COMMENT '购买电影票数',
  `ticket_total_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '电影票单价',
  `order_seat_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '座位信息',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `phone_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机取票码',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `t_order_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_order_ibfk_2`(`schedule_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `t_schedule` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (75, 1, 53, '13414850282', '2023-5-7', 3, 294.00, '[26,25,35]', '1', '612368');
INSERT INTO `t_order` VALUES (79, 50, 50, '13672606065', '2023-5-10', 1, 56.00, '[35]', '0', '823445');
INSERT INTO `t_order` VALUES (80, 50, 60, '13672606065', '2023-5-10', 2, 90.00, '[25,24]', '0', '961831');
INSERT INTO `t_order` VALUES (81, 25, 55, '13877777766', '2023-5-10', 3, 168.36, '[25,35,36]', '0', '393432');
INSERT INTO `t_order` VALUES (82, 29, 53, '13482638273', '2023-5-10', 1, 98.00, '[27]', '0', '149857');
INSERT INTO `t_order` VALUES (84, 35, 53, '13457555444', '2023-5-10', 4, 392.00, '[24,5,15,14]', '0', '285591');
INSERT INTO `t_order` VALUES (85, 35, 60, '13457555444', '2023-5-10', 2, 90.00, '[26,36]', '0', '194678');
INSERT INTO `t_order` VALUES (87, 1, 53, '13414850282', '2023-5-11', 3, 294.00, '[45,46,36]', '0', '897439');
INSERT INTO `t_order` VALUES (88, 1, 54, '13414850282', '2023-5-11', 4, 176.00, '[25,26,36,35]', '0', '481319');
INSERT INTO `t_order` VALUES (91, 1, 68, '13414850282', '2023-5-12', 4, 136.00, '[25,26,36,35]', '1', '572118');
INSERT INTO `t_order` VALUES (94, 1, 87, '13414850282', '2023-5-15', 4, 308.00, '[25,26,36,35]', '1', '987546');
INSERT INTO `t_order` VALUES (95, 1, 82, '13414850282', '2023-5-15', 4, 260.00, '[25,26,36,35]', '1', '751292');
INSERT INTO `t_order` VALUES (96, 1, 87, '13414850282', '2023-5-15', 2, 154.00, '[45,46]', '0', '135615');
INSERT INTO `t_order` VALUES (97, 1, 87, '13414850282', '2023-5-15', 1, 77.00, '[37]', '1', '586315');
INSERT INTO `t_order` VALUES (98, 1, 87, '13414850282', '2023-5-15', 1, 77.00, '[34]', '1', '666362');
INSERT INTO `t_order` VALUES (99, 1, 67, '13414850282', '2023-5-24', 4, 264.00, '[25,27,46,34]', '1', '323495');
INSERT INTO `t_order` VALUES (100, 1, 80, '13414850282', '2023-5-25', 4, 152.00, '[16,26,25,15]', '1', '577429');
INSERT INTO `t_order` VALUES (101, 1, 80, '13414850282', '2023-6-4', 2, 76.00, '[35,36]', '1', '821579');
INSERT INTO `t_order` VALUES (120, 55, 68, '15994186534', '2023-5-18', 4, 136.00, '[45,42,44,43]', '0', '145721');
INSERT INTO `t_order` VALUES (122, 55, 114, '15994186534', '2023-5-18', 3, 189.00, '[25,44,56]', '0', '461213');
INSERT INTO `t_order` VALUES (123, 55, 109, '15994186534', '2023-5-18', 4, 2260.00, '[24,25,35,34]', '1', '467934');
INSERT INTO `t_order` VALUES (127, 55, 112, '15994186534', '2023-5-30', 4, 800.00, '[24,25,26,27]', '0', '738218');
INSERT INTO `t_order` VALUES (129, 55, 117, '15994186534', '2023-5-31', 4, 600.00, '[15,24,34,45]', '0', '515515');
INSERT INTO `t_order` VALUES (130, 55, 118, '15994186534', '2023-5-31', 4, 400.00, '[34,36,35,37]', '0', '563823');
INSERT INTO `t_order` VALUES (131, 55, 92, '15994186534', '2023-5-31', 4, 356.00, '[25,36,35,45]', '0', '658589');
INSERT INTO `t_order` VALUES (135, 55, 116, '15994186534', '2023-6-5', 2, 400.00, '[46,47]', '1', '145567');

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule`  (
  `schedule_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '排片id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `cinema_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `hall_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名字',
  `show_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映日期',
  `show_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '电影售价',
  `seat_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '座位信息',
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `hall_id`(`hall_name`) USING BTREE,
  INDEX `t_schedule_ibfk_1`(`movie_id`) USING BTREE,
  INDEX `t_schedule_ibfk_2`(`cinema_id`) USING BTREE,
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_schedule_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `t_cinema` (`cinema_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES (20, 39, 2, '2号激光厅', '2023-6-20', '20:05', 200.00, NULL);
INSERT INTO `t_schedule` VALUES (21, 39, 6, '2号激光厅', '2023-6-11', '12:05', 100.00, '[15,16,48,44,23,24]');
INSERT INTO `t_schedule` VALUES (50, 20, 5, '1号激光厅', '2023-6-22', '20:05', 56.00, '[35]');
INSERT INTO `t_schedule` VALUES (53, 13, 6, '1号激光厅', '2023-6-20', '12:05', 98.00, '[35,27,24,5,15,14,45,46,36]');
INSERT INTO `t_schedule` VALUES (54, 16, 4, '1号激光厅', '2023-7-10', '20:05', 44.00, '[25,26,36,35]');
INSERT INTO `t_schedule` VALUES (55, 19, 6, '1号激光厅', '2023-6-14', '16:05', 56.12, '[25,35,36]');
INSERT INTO `t_schedule` VALUES (56, 17, 8, '1号激光厅', '2023-6-16', '16:05', 38.10, '[45,46,47,48,56,57,24,42,21,44,16,28,29,39,25,26,27,3,12,32,38,37,19]');
INSERT INTO `t_schedule` VALUES (60, 6, 2, '1号激光厅', '2023-6-22', '08:05', 45.00, '[25,24,26,36]');
INSERT INTO `t_schedule` VALUES (63, 4, 2, '1号激光厅', '2023-6-23', '08:05', 46.10, NULL);
INSERT INTO `t_schedule` VALUES (67, 12, 6, '1号激光厅', '2023-11-18', '16:05', 66.00, '[25,27,46,34]');
INSERT INTO `t_schedule` VALUES (68, 1, 1, '1号激光厅', '2023-7-21', '16:05', 34.00, '[25,26,36,35,45,42,44,43,49,58,48]');
INSERT INTO `t_schedule` VALUES (69, 29, 5, '2号激光厅', '2023-6-20', '20:05', 56.00, '[47]');
INSERT INTO `t_schedule` VALUES (70, 20, 5, '1号激光厅', '2023-6-24', '16:05', 56.00, '[]');
INSERT INTO `t_schedule` VALUES (74, 34, 4, '1号激光厅', '2023-6-26', '12:05', 78.90, NULL);
INSERT INTO `t_schedule` VALUES (75, 3, 6, '1号激光厅', '2023-6-21', '16:05', 36.70, NULL);
INSERT INTO `t_schedule` VALUES (76, 35, 4, '1号激光厅', '2023-6-24', '12:05', 76.00, NULL);
INSERT INTO `t_schedule` VALUES (77, 3, 2, '1号激光厅', '2023-6-31', '12:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (78, 13, 2, '1号激光厅', '2023-6-30', '20:05', 78.00, '[14,15]');
INSERT INTO `t_schedule` VALUES (79, 1, 7, '1号激光厅', '2023-7-11', '08:05', 45.00, '[25,36,33,57,13,16,18]');
INSERT INTO `t_schedule` VALUES (80, 4, 8, '1号激光厅', '2023-8-14', '20:05', 38.00, '[16,26,25,15,35,36]');
INSERT INTO `t_schedule` VALUES (81, 37, 4, '1号激光厅', '2023-7-30', '12:05', 76.00, NULL);
INSERT INTO `t_schedule` VALUES (82, 1, 1, '1号激光厅', '2023-7-21', '20:05', 65.00, '[25,26,36,35]');
INSERT INTO `t_schedule` VALUES (83, 18, 2, '1号激光厅', '2023-7-30', '12:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (84, 36, 7, '1号激光厅', '2023-11-22', '12:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (85, 37, 5, '2号激光厅', '2023-7-24', '20:05', 56.00, NULL);
INSERT INTO `t_schedule` VALUES (86, 33, 7, '1号激光厅', '2023-7-30', '16:05', 83.00, NULL);
INSERT INTO `t_schedule` VALUES (87, 13, 8, '1号激光厅', '2023-7-24', '16:05', 77.00, '[25,26,36,35,45,46,37,34]');
INSERT INTO `t_schedule` VALUES (88, 3, 6, '1号激光厅', '2023-7-23', '20:05', 53.00, NULL);
INSERT INTO `t_schedule` VALUES (89, 34, 5, '2号激光厅', '2023-7-31', '20:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (90, 10, 2, '1号激光厅', '2023-11-30', '12:05', 56.00, '[45,46,36,35]');
INSERT INTO `t_schedule` VALUES (91, 18, 5, '2号激光厅', '2023-7-25', '20:05', 78.00, NULL);
INSERT INTO `t_schedule` VALUES (92, 7, 1, '1号激光厅', '2023-8-31', '16:05', 89.00, '[25,36,35,45]');
INSERT INTO `t_schedule` VALUES (94, 9, 2, '1号激光厅', '2019-7-30', '16:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (96, 35, 2, '1号激光厅', '2019-7-24', '16:05', 34.00, NULL);
INSERT INTO `t_schedule` VALUES (98, 38, 2, '1号激光厅', '2019-7-17', '16:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (101, 4, 7, '1号激光厅', '2019-8-9', '20:05', 45.00, NULL);
INSERT INTO `t_schedule` VALUES (102, 1, 2, '1号激光厅', '2023-4-28', '16:05', 1000.00, NULL);
INSERT INTO `t_schedule` VALUES (107, 7, 4, '2号激光厅', '2023-5-31', '12:05', 200.00, '[16,36]');
INSERT INTO `t_schedule` VALUES (108, 9, 2, '2号激光厅', '2023-5-25', '12:05', 123.00, NULL);
INSERT INTO `t_schedule` VALUES (109, 9, 1, '九号巨幕厅', '2023-5-31', '16:05', 565.00, '[24,25,35,34,56,57,47]');
INSERT INTO `t_schedule` VALUES (111, 39, 2, '2号激光厅', '2023-5-31', '16:05', 200.00, '[46,48,59]');
INSERT INTO `t_schedule` VALUES (112, 39, 1, '1号激光厅', '2023-5-31', '12:05', 200.00, '[24,25,26,27]');
INSERT INTO `t_schedule` VALUES (113, 3, 1, '1号激光厅', '2023-5-30', '12:05', 96.00, NULL);
INSERT INTO `t_schedule` VALUES (114, 4, 1, '1号激光厅', '2023-5-29', '12:05', 63.00, '[25,44,56]');
INSERT INTO `t_schedule` VALUES (115, 9, 1, '2号激光厅', '2023-5-28', '20:05', 63.00, NULL);
INSERT INTO `t_schedule` VALUES (116, 13, 1, '2号激光厅', '2023-6-30', '12:05', 200.00, '[23,35,25,24,46,47]');
INSERT INTO `t_schedule` VALUES (117, 18, 1, '2号激光厅', '2023-6-21', '16:05', 150.00, '[15,24,34,45]');
INSERT INTO `t_schedule` VALUES (118, 34, 1, '2号激光厅', '2023-6-29', '12:05', 100.00, '[34,36,35,37]');
INSERT INTO `t_schedule` VALUES (119, 40, 1, '2号激光厅', '2023-6-29', '16:05', 213.00, NULL);
INSERT INTO `t_schedule` VALUES (120, 41, 1, '九号巨幕厅', '2023-6-21', '16:05', 200.00, '[35,36,34,33]');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户出生年月日',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户签名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'LyuJ1ong', '/images/avatar/man.jpg', '123456', '13414850282', '男', '2019-8-12', '我命由我不由天');
INSERT INTO `t_user` VALUES (19, '张三', '/images/avatar/1557241550286.jpg', '123', '13423232323', '男', '2019-4-8', '66666');
INSERT INTO `t_user` VALUES (23, '13478565555', '/images/avatar/monkey.png', '123456', '13478565555', '男', NULL, '加油');
INSERT INTO `t_user` VALUES (25, '13877777766', '/images/avatar/monkey.png', '123456', '13877777766', '男', NULL, '生而无畏');
INSERT INTO `t_user` VALUES (29, '13482638273', '/images/avatar/monkey.png', '123456', '13482638273', '女', NULL, '向前跑，用尽全部力气');
INSERT INTO `t_user` VALUES (30, '13428372632', '/images/avatar/monkey.png', '123456', '13428372632', '女', NULL, '生活不止眼前的枸杞，还有诗和远方');
INSERT INTO `t_user` VALUES (35, '13457555444', '/images/avatar/monkey.png', '123456', '13457555444', '男', NULL, 'to be');
INSERT INTO `t_user` VALUES (36, '13415656565', '/images/avatar/monkey.png', '123456', '13415656565', '女', NULL, 'Oh');
INSERT INTO `t_user` VALUES (37, '13428273363', '/images/avatar/monkey.png', '123456', '13428273363', '女', NULL, 'JavaScript');
INSERT INTO `t_user` VALUES (44, '小李', '/images/avatar/monkey.png', '123456', '13414232321', '男', NULL, '一起加油');
INSERT INTO `t_user` VALUES (46, '王大锤', '/images/avatar/1557241132762.jpg', '123456', '13412121211', '男', '1990-06-16', '开心就好');
INSERT INTO `t_user` VALUES (48, '大奔', '/images/avatar/monkey.png', '123456', '13414850215', '男', '2019-5-2', '777777');
INSERT INTO `t_user` VALUES (49, '13414851033', '/images/avatar/monkey.png', '123456', '13414851033', '女', NULL, '99999');
INSERT INTO `t_user` VALUES (50, '13672606065', '/images/avatar/monkey.png', '999999', '13672606065', '男', '', '7777777');
INSERT INTO `t_user` VALUES (51, '王五', '/images/avatar/1557474974747.jpg', '123456', '13478343221', '男', '2019-5-1', '66666666666666666666');
INSERT INTO `t_user` VALUES (52, '老王', '/images/avatar/monkey.png', '123', '13414850242', '女', '2019-7-8', '帅');
INSERT INTO `t_user` VALUES (53, '13411111111', '/images/avatar/monkey.png', '123456', '13411111111', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (54, '13499090909', '/images/avatar/monkey.png', '123456', '13499090909', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (55, 'kailai123', '/images/avatar/monkey.png', '123456', '15994186534', '女', '1970-1-16', '你好啊');

-- ----------------------------
-- Table structure for t_wishmovie
-- ----------------------------
DROP TABLE IF EXISTS `t_wishmovie`;
CREATE TABLE `t_wishmovie`  (
  `wishMovie_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '想看电影id',
  `user_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(4) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  PRIMARY KEY (`wishMovie_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_1`(`user_id`) USING BTREE,
  INDEX `t_wishmovie_ibfk_2`(`movie_id`) USING BTREE,
  CONSTRAINT `t_wishmovie_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_wishmovie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `t_movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_wishmovie
-- ----------------------------
INSERT INTO `t_wishmovie` VALUES (74, 1, 20);
INSERT INTO `t_wishmovie` VALUES (76, 1, 9);
INSERT INTO `t_wishmovie` VALUES (77, 46, 13);
INSERT INTO `t_wishmovie` VALUES (78, 1, 17);
INSERT INTO `t_wishmovie` VALUES (79, 1, 33);
INSERT INTO `t_wishmovie` VALUES (82, 50, 13);
INSERT INTO `t_wishmovie` VALUES (85, 50, 29);
INSERT INTO `t_wishmovie` VALUES (86, 50, 12);
INSERT INTO `t_wishmovie` VALUES (87, 50, 6);
INSERT INTO `t_wishmovie` VALUES (88, 25, 20);
INSERT INTO `t_wishmovie` VALUES (89, 25, 29);
INSERT INTO `t_wishmovie` VALUES (90, 25, 34);
INSERT INTO `t_wishmovie` VALUES (91, 29, 29);
INSERT INTO `t_wishmovie` VALUES (92, 29, 9);
INSERT INTO `t_wishmovie` VALUES (93, 29, 34);
INSERT INTO `t_wishmovie` VALUES (95, 23, 3);
INSERT INTO `t_wishmovie` VALUES (96, 1, 35);
INSERT INTO `t_wishmovie` VALUES (110, 1, 15);
INSERT INTO `t_wishmovie` VALUES (112, 1, 13);
INSERT INTO `t_wishmovie` VALUES (115, 1, 12);
INSERT INTO `t_wishmovie` VALUES (117, 1, 7);
INSERT INTO `t_wishmovie` VALUES (118, 1, 10);
INSERT INTO `t_wishmovie` VALUES (123, 50, 39);
INSERT INTO `t_wishmovie` VALUES (129, 55, 17);
INSERT INTO `t_wishmovie` VALUES (130, 55, 39);

SET FOREIGN_KEY_CHECKS = 1;
