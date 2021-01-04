#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS bk_h;
#创建新的数据库，并设置存储的编码
CREATE DATABASE bk_h CHARSET=UTF8;
#进入数据库
USE bk_h;

#创建用户表
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(20) UNIQUE,
  password  VARCHAR(128)
);
#插入数据
#一次性插入多条数据，使用NULL会避开主键约束，变为0
INSERT INTO user VALUES(1,'yubaibai','e10adc3949ba59abbe56e057f20f883e');

#轮播图表
CREATE TABLE Banners(
  banner VARCHAR(100),
  Url VARCHAR(100)
);

#创建new arrivals主页
CREATE TABLE New(
  new VARCHAR(100),
  Url VARCHAR(100)
);

#创建bestsell主页
CREATE TABLE Bestsell(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  b_img VARCHAR(100),
  title VARCHAR(64),
  price DECIMAL(7,2) DEFAULT 299, 
  Url VARCHAR(100)
);

#创建series主页
CREATE TABLE Series(
  Series VARCHAR(100),
  Url VARCHAR(100)
);

#详情页数据库之轮播图
CREATE TABLE One(
  One VARCHAR(100),
  Url VARCHAR(100)
);

#插入详情页数据库之轮播图
INSERT INTO One VALUES('/public/img/xq_swiper/one/1.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/2.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/3.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/4.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/5.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/6.jpeg','#');
INSERT INTO One VALUES('/public/img/xq_swiper/one/7.jpeg','#');

#详情页之主页
-- CREATE TABLE Details(
--   did INT PRIMARY KEY AUTO_INCREMENT,
--   d_title VARCHAR(64),
--   title VARCHAR(100),
--   price DECIMAL(7,2) DEFAULT 299,  #99999.99
--   t_title VARCHAR(64),
--   one_img VARCHAR(200), #详情页图片
--   two_img VARCHAR(200), #详情页图片
--   three_img VARCHAR(200), #详情页图片
--   four_img VARCHAR(200), #详情页图片
--   five_img VARCHAR(200), #详情页图片
--   six_img VARCHAR(200), #详情页图片
--   seven_img VARCHAR(200), #详情页图片
--   eight_img VARCHAR(200), #详情页图片
--   nine_img VARCHAR(200), #详情页图片
--   spec VARCHAR(10)  #分类查询
-- );

#插入详情页之主页数据
-- INSERT INTO Details VALUES(1,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(2,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(3,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(4,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(5,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(6,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(7,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(8,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');
-- INSERT INTO Details VALUES(9,'高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg','高光时刻');

#创建商品页表
CREATE TABLE Product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  img  VARCHAR(200), #商品页图片
  p_title VARCHAR(64),
  title VARCHAR(100),
  price DECIMAL(7,2) DEFAULT 299,  #99999.99
  pro_title VARCHAR(64),
  one_img VARCHAR(200), #详情页图片
  two_img VARCHAR(200), #详情页图片
  three_img VARCHAR(200), #详情页图片
  four_img VARCHAR(200), #详情页图片
  five_img VARCHAR(200), #详情页图片
  six_img VARCHAR(200), #详情页图片
  seven_img VARCHAR(200), #详情页图片
  eight_img VARCHAR(200), #详情页图片
  nine_img VARCHAR(200) #详情页图片
);

#插入商品页数据
INSERT INTO Product VALUES(1,'/public/img/product/1.jpeg','幽都系列','白色提花字母弹力发带',85,'白色提花字母发带','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(2,'/public/img/product/2.jpeg','KILLER BUNNY','红眼镶嵌条形字母吊坠钛钢耳环',299,'红眼镶嵌','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(3,'/public/img/product/3.jpeg','KILLER BUNNY','立体错位红眼镶嵌钛耳钉',268,'红眼镶嵌','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(4,'/public/img/product/4.jpeg','KILLER BUNNY','立体红眼镶嵌不对称钛钢耳钉',199,'立体不对称','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(5,'/public/img/product/5.jpeg','KILLER BUNNY','红眼镶嵌杀手兔装饰钛钢戒指',248,null,'/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(6,'/public/img/product/6.jpeg','KILLER BUNNY','红眼镶嵌箭形吊坠钛钢耳环',268,'眼镶嵌箭形','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(7,'/public/img/product/7.jpeg','KILLER BUNNY','金银拼色立体箭形交叉钛钢手环',268,'立体箭形','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(8,'/public/img/product/8.jpeg','KILLER BUNNY','杀手兔吊坠可拆卸钛钢项链',399,null,'/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(9,'/public/img/product/9.jpeg','KILLER BUNNY','镶钻耳钉戒指组合可拆分戒指',299,'可拆分组合','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(10,'/public/img/product/10.jpeg','高光时刻','爱心型闪光吊坠钛钢金银拼色手链',499,'爱心吊坠拼色手链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(11,'/public/img/product/11.jpeg','高光时刻','金银拼色闪光大爱心钻吊坠戒指',429,'心钻吊坠拼色戒指','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(12,'/public/img/product/12.jpeg','高光时刻','爱心钻吊坠折叠钛钢戒指',399,'心钻折叠戒指','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(13,'/public/img/product/13.jpeg','高光时刻','金银拼色闪光心钻吊坠钛钢项链',529,'心钻吊坠项链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(14,'/public/img/product/14.jpeg','高光时刻','心钻戒指吊坠锁骨链',529,'心钻戒指吊坠项链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(15,'/public/img/product/15.jpeg','高光时刻','心型闪光吊坠钛钢项链金银拼色搭锁骨链',499,'心型闪光吊坠','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(16,'/public/img/product/16.jpeg','高光时刻','蝴蝶扣装饰钛钢耳饰耳钉',299,'蝴蝶扣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(17,'/public/img/product/17.jpeg','高光时刻','心形钻多种戴法钛钢耳饰创意气质潮耳线耳钉耳环',399,'心形钻多种戴法','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(18,'/public/img/product/18.jpeg','BLACK HEAD','磁盘吊坠钛钢项链',299,null,'/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(19,'/public/img/product/19.jpeg','机械花园2.0','银色光面异形装饰钛钢领夹',469,'BH&AUBRUINO联名款 双层链条灵动个性','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(20,'/public/img/product/20.jpeg','机械花园2.0','趣味多功能可拆卸组合吊坠钛钢项链',799,'吊坠可拆卸单独佩戴 随意组合 趣味性强','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(21,'/public/img/product/21.jpeg','机械花园2.0','机械花朵装饰黑色超纤皮革单肩包',799,'机械花朵装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(22,'/public/img/product/22.jpeg','机械花园2.0','机械花朵装饰黑色超纤皮革手机包',499,'机械花朵装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(23,'/public/img/product/23.jpeg','机械花园2.0','金银拼色旋转组合钛钢套戒',399,'BH&AUBRUINO联名  金银拼色 旋转组合 钛钢','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(24,'/public/img/product/24.jpeg','机械花园2.0','金银拼色机械花瓣钛钢吊坠项链',399,'拼色花朵设计 做工精细','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(25,'/public/img/product/25.jpeg','机械花园2.0','金银拼色铆钉流苏吊坠钛钢耳环',699,'BH&AUBRUINO联名  金银拼色 铆钉 流苏 钛钢','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(26,'/public/img/product/26.jpeg','机械花园2.0','金银拼色机械花朵装饰铆钉夹片钛钢手环',799,'可旋转拼色花朵设计  开口可调节','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(27,'/public/img/product/27.jpeg','机械花园2.0','金银拼色三叶花瓣装饰钛钢耳夹/耳钉',599,'BH&AUBRUINO联名 金银拼色 三叶花瓣装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(28,'/public/img/product/28.jpeg','机械花园2.0','金银拼色花朵装饰钛钢耳钉',399,'金银拼色花朵装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(29,'/public/img/product/29.jpeg','七宗罪','简约长方形双指钛钢戒指/项链潮吴克群',318,'原创简约长方形双指钛钢戒指/项链吴克群','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(30,'/public/img/product/30.jpeg','house of Hermes','满钻一字免穿刺钛钢装饰唇环无唇洞',199,'满钻一字唇环设计 免穿刺无洞佩戴','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(31,'/public/img/product/31.jpeg','house of Hermes','大型多层细环镶钻钛钢耳环',299,'多层细环镶钻钛钢耳环 欧美 夸张 oversize','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(32,'/public/img/product/32.jpeg','house of Hermes','镶钻链条装饰钛钢开口戒指',199,'镶钻链条装饰 开口元素','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(33,'/public/img/product/33.jpeg','house of Hermes','LOGO字母链条装饰身体链',999,'个性字母身体链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(34,'/public/img/product/34.jpeg','house of Hermes','双层叠戴链条钛钢可调节手链',299,'双层叠戴手链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(35,'/public/img/product/35.jpeg','house of Hermes','多层细环镶钻钛钢手环',299,'多层细环镶钻','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(36,'/public/img/product/36.jpeg','house of Hermes','金属球形流苏钛钢耳挂',199,'金属球形流苏','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(37,'/public/img/product/37.jpeg','house of Hermes','五角星吊坠大圈钛钢耳环',399,'五角星大圈','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(38,'/public/img/product/38.jpeg','house of Hermes','五角星双链条钛钢项链',499,'五角星双层链条','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(39,'/public/img/product/39.jpeg','house of Hermes','银色钻石吊坠钛钢发饰套件',248,'银色钻石','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(40,'/public/img/product/40.jpeg','house of Hermes','长链流苏钛钢臂环',499,null,'/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(41,'/public/img/product/41.jpeg','house of Hermes','圆环按扣钛钢装饰脐钉',168,'圆环按扣脐钉','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(42,'/public/img/product/42.jpeg','house of Hermes','多链条钻石吊坠钛钢装饰手链',248,'多链条钻石吊坠钛钢装饰手链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(43,'/public/img/product/43.jpeg','house of Hermes','小钻吊坠钛钢装饰眉钉',128,'小钻吊坠钛钢装饰眉钉','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(44,'/public/img/product/44.jpeg','house of Hermes','钻石吊坠装饰钛钢鼻钉',128,'钻石吊坠装饰钛钢鼻钉','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(45,'/public/img/product/45.jpeg','house of Hermes','链条钻石装饰钛钢脐钉',168,'原创设计','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(46,'/public/img/product/46.jpeg','house of Hermes','黑头钻石镶嵌吊坠装饰手链链条渐变大小原创设计小众',299,'银色链条大小渐变镶钻可拆卸钛钢手链','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(47,'/public/img/product/47.jpeg','house of Hermes','银色链条大小渐变镶钻可拆卸钛钢项链',499,'镶钻吊坠可拆卸，链条渐变大小','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(48,'/public/img/product/48.jpeg','house of Hermes','渐变链条镶钻钛钢耳饰',268,'镶钻装饰','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(49,'/public/img/product/49.jpeg','house of Hermes','钻石渐变大小装饰吊坠钛钢脐环',168,'耳钉脐环两用','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(50,'/public/img/product/50.jpeg','house of Hermes','五角星装饰螺旋小圈钛钢耳钉',268,'五角星螺旋小圈耳钉设计，镜面效果简洁闪耀','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(51,'/public/img/product/51.jpeg','house of Hermes','logo字母吊坠装饰宽面钛钢戒指',248,'B字母和条形带钻logo悬挂设计增加立体灵动','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(52,'/public/img/product/52.jpeg','house of Hermes','半耳挂式五角星钛钢耳钉',168,'五角星耳挂式耳钉设计，耳挂与耳蜗贴和','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(53,'/public/img/product/53.jpeg','AREA 51','开关按钮吊坠钛钢项链',248,null,'/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(54,'/public/img/product/54.jpeg','AREA 51','银色麦田怪圈大圈钛钢装饰耳环',299,'夸张镜面耳环，中间做了细线镂空处理','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(55,'/public/img/product/55.jpeg','AREA 51','51数字吊坠钛钢耳钉',369,'可拆卸耳夹，增加佩戴后的灵动效果','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(56,'/public/img/product/56.jpeg','AREA 51','51数字吊坠方块经纬装饰钛钢项链',499,'增加佩戴后的灵动效果，方块元素增加未来感','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(57,'/public/img/product/57.jpeg','AREA 51','方块经纬度装饰钛钢手链',299,'镂空部分的数字是51区的经纬度','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(58,'/public/img/product/58.jpeg','AREA 51','立体外星人造型钛钢戒指',168,'外星人造型形态，镜面设计增添了未来感','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(59,'/public/img/product/59.jpeg','AREA 51','外星人手脸浮雕钛钢耳钉',269,'面部加手的处理，增添了外星人的神秘感','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');
INSERT INTO Product VALUES(60,'/public/img/product/60.jpeg','AREA 51','金银拼色外星人吊坠钛钢手链',269,'吊坠拼色，外星人图案，更有立体感','/public/img/xq_details/one/1.jpg','/public/img/xq_details/one/2.jpg','/public/img/xq_details/one/3.jpg','/public/img/xq_details/one/4.jpg','/public/img/xq_details/one/5.jpg','/public/img/xq_details/one/6.jpg','/public/img/xq_details/one/7.jpg','/public/img/xq_details/one/8.jpg','/public/img/xq_details/one/9.jpg');



#插入轮播数据
INSERT INTO Banners VALUES('/public/img/swipe/1.jpg','#');
INSERT INTO Banners VALUES('/public/img/swipe/2.jpg','#');
INSERT INTO Banners VALUES('/public/img/swipe/3.jpg','#');

#插入new arrivals主页数据
INSERT INTO New VALUES('/public/img/new arrivals/1.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/2.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/3.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/4.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/5.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/6.jpeg','#');
INSERT INTO New VALUES('/public/img/new arrivals/8.jpeg','#');

#插入bestsell主页数据
INSERT INTO Bestsell VALUES(1,'/public/img/bestsell/1.jpeg','蝴蝶扣装饰钛钢耳饰耳钉','299 ','#');
INSERT INTO Bestsell VALUES(2,'/public/img/bestsell/2.jpeg','心形钻多种戴法钛钢耳饰创意气质潮耳线耳钉耳环','399 ','#');
INSERT INTO Bestsell VALUES(3,'/public/img/bestsell/3.jpeg','心型闪光吊坠钛钢项链金银拼色搭锁骨链','499 ','#');
INSERT INTO Bestsell VALUES(4,'/public/img/bestsell/4.jpeg','金银拼色闪光心钻吊坠钛钢项链','529 ','#');
INSERT INTO Bestsell VALUES(5,'/public/img/bestsell/5.jpeg','心钻戒指吊坠锁骨链','529 ','#');
INSERT INTO Bestsell VALUES(6,'/public/img/bestsell/6.jpeg','爱心型闪光吊坠钛钢金银拼色手链','499 ','#');
INSERT INTO Bestsell VALUES(7,'/public/img/bestsell/7.jpeg','爱心钻吊坠折叠钛钢戒指','399 ','#');
INSERT INTO Bestsell VALUES(8,'/public/img/bestsell/8.jpeg','金银拼色闪光大爱心钻吊坠戒指','429 ','#');

#插入series主页数据
INSERT INTO Series VALUES('/public/img/series/boy.jpg','#');
INSERT INTO Series VALUES('/public/img/series/gir.jpg','#');
INSERT INTO Series VALUES('/public/img/series/lover.jpg','#');
INSERT INTO Series VALUES('/public/img/series/white.jpg','#');

