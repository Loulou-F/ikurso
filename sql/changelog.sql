-- Pour passer en V1 :

-- supprime les lignes "non française"
delete from personoj where lingvo!='fr';

ALTER TABLE demandaro CONVERT TO CHARACTER SET utf8;

-- suppression des tables mw_
DROP TABLE `mw_archive`, `mw_categorylinks`, `mw_groups`, `mw_hitcounter`, `mw_image`, `mw_imagelinks`, `mw_interwiki`, `mw_ipblocks`, `mw_logging`, `mw_math`, `mw_objectcache`, `mw_oldimage`, `mw_page`, `mw_pagelinks`, `mw_querycache`, `mw_recentchanges`, `mw_revision`, `mw_searchindex`, `mw_site_stats`, `mw_text`, `mw_user`, `mw_user_groups`, `mw_user_rights`, `mw_validate`, `mw_watchlist`;
-- suppression des tables wikipedias :
DROP TABLE `wikiarchive`, `wikicategorylinks`, `wikiexternallinks`, `wikihitcounter`, `wikiimage`, `wikiimagelinks`, `wikiinterwiki`, `wikiipblocks`, `wikijob`, `wikilogging`, `wikimath`, `wikiobjectcache`, `wikioldimage`, `wikipage`, `wikipagelinks`, `wikiquerycache`, `wikirecentchanges`, `wikirevision`, `wikisearchindex`, `wikisite_stats`, `wikitemplatelinks`, `wikitext`, `wikitrackbacks`, `wikitranscache`, `wikiuser`, `wikiuser_groups`, `wikiuser_newtalk`, `wikivalidate`, `wikiwatchlist`;

ALTER TABLE  `protokolo` CHANGE  `teksto`  `teksto` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL


-- Pour passer en V2 :
delete from kursoj where lingvo<>'FR';
delete from landoj where lingvo<>'FR';
delete from lecionoj where lingvo<>'FR';
delete from monatoj where lingvo<>'FR';
delete from personoj where lingvo<>'FR';
delete from protokolo where lingvo<>'FR';
delete from rajtoj where lingvo<>'FR';

ALTER TABLE kursoj DROP lingvo;
ALTER TABLE landoj DROP lingvo;
ALTER TABLE lecionoj DROP lingvo;
ALTER TABLE monatoj DROP lingvo;
ALTER TABLE protokolo DROP lingvo;
ALTER TABLE rajtoj DROP lingvo;
ALTER TABLE personoj CHANGE `ekdato` `ekdato` DATE NOT NULL;
ALTER TABLE personoj CHANGE `naskigxdato` `naskigxdato` DATE DEFAULT NULL;
Drop table lingvoj;


-- pour passer en V3
update `personoj` set naskigxdato=NULL where id in (10,1683,1681,147,92,96,731,116,117,222,121,122,124,156,189,171,190,236,239,277,289,290,469,307,311,314,317,329,330,342,361,375,395,397,402,411,416,432,435,443,505,453,467,471,472,486,1326,526,516,520,523,527,533,547,549,564,578,2213,592,591,609,619,625,633,639,642,650,662,667,679,716,717,735,747,760,771,777,788,794,804,806,831,833,836,841,846,864,858,859,865,870,873,875,876,879,881,894,923,941,1141,960,963,1140,968,983,987,988,990,999,1011,1020,1025,1037,1040,1052,1054,1060,1061,1138,6939,1137,1096,1101,1103,1105,1113,1114,1120,1123,1124,1129,1134,1135,1145,1146,1147,1148,1149,1155,1156,1157,1167,1168,1169,1175,1176,1179,1180,1199,1187,1189,1192,1202,2786,1213,1220,1232,1251,1256,1259,1263,1264,1283,1293,1301,1302,1303,1307,1309,1314,1320,1329,1332,1351,1353,1354,1367,1394,1422,1447,1451,1460,1463,1471,1482,1494,1525,1519,1547,1566,1568,2628,2631,1579,1585,1586,1593,1594,1601,1612,1623,1644,1640,1657,1662,1690,1774,1687,1688,1694,1700,1720,1722,1729,1750,1783,1794,1801,1809,1813,1822,1831,1838,1857,1868,1871,1877,1884,1889,1892,1893,1894,1896,1897,1901,1902,2157,1915,1923,1924,1932,1939,1994,1947,1948,1950,1978,1979,1988,5288,2129,2010,2018,2028,2038,2040,2041,2062,2067,2077,2081,2100,2102,2137,2154,2155,2196,2206,2220,2231,2234,2237,2239,2242,2256,2258,2269,2272,2295,2304,2315,2333,2340,2344,2347,2350,2355,2370,2371,2402,5840,2426,2433,2434,2445,2447,5722,2694,2489,2501,2507,2511,2519,2523,2743,2744,2531,2534,2536,2539,2558,2565,2568,2600,2598,2601,2606,2613,2624,2658,2671,2693,2714,2717,2729,2733,2945,2747,2748,2751,2753,2754,2760,2766,2777,2792,2798,2826,2831,2834,3606,2842,2843,2856,2857,2859,2867,2870,2871,2878,2879,2883,2884,2887,2888,2890,2911,2913,2915,2928,2941,2954,2962,2978,2979,2987,2990,2991,2995,2996,2997,2998,3002,3003,3005,3006,3019,3008,3011,3014,3022,3025,3036,3052,3053,3056,3065,3071,3074,3076,3079,3087,3089,3099,3101,3106,3109,3110,3115,3113,3114,3120,3131,3133,3142,3149,3157,3176,3177,3224,3184,3190,3194,3200,3202,3206,3210,3213,3556,3239,3240,3244,3255,3258,3286,3298,3290,3292,3313,3300,3304,3317,3318,3323,3325,3328,3403,3337,3339,3346,3347,3356,3367,3369,3374,3376,3383,3387,3389,3406,3407,3412,3414,3416,3420,3428,3436,3447,3450,3454,3459,3469,3471,3476,3481,3483,3494,3493,3495,3502,3504,3508,3512,3518,3524,3526,3527,3529,3530,3533,3542,3612,3554,3567,3577,3589,3619,3608,3613,3621,3623,3624,3629,3650,3656,3672,3913,3680,3687,3692,3697,3701,3700,3735,3714,3736,3723,3729,3730,3731,3737,3745,3746,3748,3750,3756,3759,3762,3766,3772,3791,3796,3870,3872,3806,3812,3814,3817,3821,3832,3839,3845,3855,3859,3861,3862,3863,3865,3873,3882,3883,3884,3908,3888,4137,3903,3904,3905,3907,3909,3910,3914,3919,3930,3933,3937,3953,3955,3965,3967,3973,3974,3981,3982,3991,3992,3994,3996,4000,4002,4003,4004,4010,4018,4022,4023,4025,4029,4033,4034,4036,4037,4040,4052,4047,4064,4071,4072,4078,4075,4083,4087,4089,4096,4101,4103,4109,4111,4119,4154,4764,4147,4150,4153,4160,4161,4172,4174,4182,4186,4191,4193,4211,4213,4216,4219,4225,4232,4239,4240,4242,4243,4244,4245,4248,4250,4255,4270,4272,4282,4296,4298,4315,4308,4310,4312,4318,4324,4327,4337,4338,4339,4346,4351,4352,4360,4366,4368,4370,4371,4372,4383,4385,4421,4386,4388,4401,4407,4413,4417,4427,4429,6515,4439,4449,4452,4456,4458,4460,4468,4482,4483,4496,4504,4520,4527,4529,4530,4536,4539,4540,4541,4551,4553,5233,4554,4556,4557,4560,4797,4587,4590,4593,4604,4609,4623,4630,4631,4634,4638,4639,4646,4647,4652,4657,4658,4656,4661,4665,4672,4681,4684,4687,4693,4697,4704,4718,4722,4733,4737,4741,4747,4765,4767,4768,4770,4781,6180,4786,4790,4805,4806,4810,4812,4814,4816,4828,4831,4834,4839,4843,4845,4846,4850,4851,4853,4855,4858,4860,4863,4864,4865,4866,4869,4870,4873,4885,4879,4880,4883,4889,4904,4918,4953,4993,4995,4996,4997,5000,5001,5003,5010,5016,5017,5019,5020,5022,5023,5030,5034,5039,5040,5048,5051,5056,5062,5064,5071,5074,5078,5079,5084,5085,5089,5099,5102,5103,5109,5113,5117,5118,5129,5131,5146,5133,5135,5144,5152,5169,5173,6600,5183,5186,5187,5190,5247,5192,5193,5194,5198,5200,5202,5208,5209,6594,5210,5214,5216,5219,5220,5224,5228,5238,5292,5244,5246,5251,5255,5259,5263,5269,5272,5283,5279,5280,5289,5550,5298,5314,5315,5322,5335,5324,5325,5327,5333,5340,5341,5343,5347,5360,5362,5367,5371,5378,5389,5391,5392,5409,5412,5415,5416,5423,5424,5425,5428,5431,5445,5447,5455,5458,5461,5465,5473,5475,5478,5484,5486,5493,5492,5497,5498,5499,5514,5516,5528,5529,5534,5545,5566,5549,5551,6750,6751,5554,5570,5563,5578,5581,5584,5587,5588,5589,5591,5592,5593,5595,5596,5601,5602,5603,5605,5614,5616,5617,5625,5626,5634,5635,5636,5637,5639,5643,5654,5656,5660,5664,5665,5667,5672,5674,5675,5677,5686,5692,5694,5703,5706,5711,5712,5718,5733,5730,5731,5737,5740,5744,5745,5746,5747,5751,5752,5769,5755,5765,5767,5770,5778,5780,5782,5783,5791,5792,5793,5798,5810,5807,5815,5817,5819,5821,5827,5830,5835,5843,5849,5851,5852,5860,5864,5867,5870,5876,5879,5881,5884,5886,5888,5890,5895,5896,5897,5900,5904,5909,5910,5914,5919,5920,5924,5947,5948,5951,5952,5954,5956,5959,5960,5961,5962,5963,5966,5967,5968,5970,5971,5977,5980,5987,5989,6507,5994,5999,6000,6002,6003,6004,6014,6021,6022,6042,6047,6057,6059,6060,6063,6065,6071,6077,6088,6078,6080,6085,6092,6096,6108,6112,6113,6116,6118,6121,6126,6130,6131,6142,6148,6151,6152,6156,6158,6160,6167,6168,6170,6176,6185,6189,6191,6194,6179,6205,6206,6207,6208,6220,6221,6227,6232,6237,6240,6243,6245,6390,6250,6252,6260,6270,6271,6274,6276,6282,6285,6290,6294,6296,6302,6303,6304,6312,6316,6320,6340,6333,6335,6337,6339,6345,6348,6350,6351,6354,6358,6363,6364,6366,6375,6383,6384,6388,6393,6397,6401,6403,6404,6405,6407,6411,6413,6414,6417,6420,6422,6429,6434,6435,6439,6447,6448,6453,6454,6458,6461,6463,6470,6472,6484,6486,6487,6490,6494,6493,6496,6556,6498,6503,6504,6511,6523,6525,6529,6533,6543,6545,6547,6548,6550,6553,6566,6570,6574,6571,6573,6579,6583,6592,6607,6616,6621,6631,6643,6660,6661,6662,6663,6664,6669,6674,6675,6679,6681,6684,6696,6698,6699,6704,6707,6714,6715,6716,6717,6718,6720,6721,6722,6723,6724,6727,6730,6732,6739,6742,6743,6757,6759,6763,6768,6774,7419,6781,6783,6790,6791,6798,6799,6805,6806,6808,6811,6815,6816,6817,6823,6826,6828,6831,6834,6836,6841,6844,6845,6846,6849,6850,6858,6859,6862,6868,6869,6879,6884,6889,6894,6897,6900,6918,6905,6910,6915,6922,6929,6930,6941,6942,6944,6946,6958,6951,6955,6978,6980,6983,6985,6986,6988,6991,7001,7002,7006,7008,7009,7015,7019,7020,7023,7032,7034,7035,7036,7040,7041,7046,7047,7048,7070,7074,7076,7078,7080,7082,7084,7090,7094,7098,7102,7106,7107,7112,7113,7114,7122,7125,7138,7144,7153,7157,7162,7163,7164,7166,7167,7171,7172,7175,7177,7179,7190,7197,7200,7198,7203,7209,7210,7216,7220,7221,7223,7226,7228,7230,7233,7236,7239,7240,7243,7245,7246,7251,7252,7254,7256,7296,7297,7260,7265,7266,7274,7282,7283,7285,7288,7289,7294,7295,7298,7301,7302,7312,7316,7317,7322,7326,7327,7331,7336,7339,7340,7344,7350,7351,7356,7371,7373,7374,7377,7378,7379,7383,7384,7386,7389,7393,7394,7400,7429,7430,7432,7433,7434,7439,7442,7449,7453,7457,7459,7460,7471,7473,7475,7476,7481,7482,7487,7488,7491,7494,7499,7500,7509,7511,7513,7518,7522,7523,7524,7526,7530,7539,7541,7544,7549,7554,7558,7556,7560,7561,7563,7564,7566,7572,7576,7580,7583,7584,7589,7590,7595,7596,7598,7599,7601,7608,7611,7614,7627,7629,7630,7634,7639,7641,7643,7648,7651,7652,7653,7659,7663,7693,7673,7683,7687,7691,7692,7694,7696,7698,7701,7702,7706,7721,7724,7725,7730,7732,7748,7752,7756,7765);
ALTER TABLE  `personoj` ADD  `lasteniro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER  `ekdato` ;
ALTER TABLE personoj DROP lingvo;
ALTER TABLE personoj DROP sistemo;

-- pour passer en V4
ALTER TABLE  `personoj` ADD  `stop_rappel` ENUM(  'J',  'N' ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT  'N';
CREATE TABLE takso_leciono ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`dato` TIMESTAMP NOT NULL,
`persono_id` int(11) NOT NULL,
`leciono_id` int(11) NOT NULL,
`intereso` INT NOT NULL , 
`malfacileco` INT NOT NULL , 
`komento` TEXT NOT NULL , 
PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- pour passer en V5
ALTER TABLE  `lecionoj` ADD  `unua` BOOL NOT NULL DEFAULT  '0',
ADD  `lasta` BOOL NOT NULL DEFAULT  '0';
update lecionoj set unua=1 where numero=1;
update lecionoj set lasta=1 where numero=10 and kurso='CG';
update lecionoj set lasta=1 where numero=25 and kurso='GR';
DROP TABLE  IF EXISTS lecioneroj;
CREATE TABLE `lecioneroj` ( `id` INT AUTO_INCREMENT , `leciono_id` INT , `titolo` TEXT , `tipo` ENUM('VORTARO','QCM','TEKSTO','EKZERCARO') NULL , `enhavo` TEXT NULL , `ordo` INT, PRIMARY KEY (`id`),`unua` BOOL NOT NULL DEFAULT  '0',`lasta` BOOL NOT NULL DEFAULT  '0') ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Indications sur la prononciation', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Les terminaisons usuelles', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Vocabulaire', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Un peu de grammaire...', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Exemples de phrases', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Exercices', 'EKZERCARO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'QCM', 'QCM', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'épilogue', 'TEKSTO', '8',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Le féminin des noms : suffixe <i>-in</i>', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Terminaison <i>-n</i> du complément d’objet direct', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Autres compléments', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Préfixe <i>mal-</i>', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Forme négative', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Vocabulaire', 'VORTARO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Exercices - deuxième leçon, 1<sup>ère</sup> partie', 'EKZERCARO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Exercices - deuxième leçon, 2<sup>ème</sup> partie', 'EKZERCARO', '8',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Exercices - deuxième leçon, 3<sup>ème</sup> partie', 'EKZERCARO', '9',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'QCM', 'QCM', '10',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Épilogue', 'TEKSTO', '11',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Ordre des mots', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Exercices - troisième leçon, 1<sup>ère</sup> partie', 'EKZERCARO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Vocabulaire', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Proverbe', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Adverbes en <i>-e</i>', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Formation des syllabes', 'TEKSTO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Exercices - troisième leçon, 2<sup>ème</sup> partie', 'EKZERCARO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Les nombres cardinaux', 'TEKSTO', '8',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Exercices - troisième leçon, 3<sup>ème</sup> partie', 'EKZERCARO', '9',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Verbes intransitifs et transitifs', 'TEKSTO', '10',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Exercices - troisième leçon, 4<sup>ème</sup> partie', 'EKZERCARO', '11',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Épilogue', 'TEKSTO', '12',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'La forme interrogative', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Exercices - quatrième leçon, 1<sup>ère</sup> partie', 'EKZERCARO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'L’alphabet (rappel)', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Les voyelles', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Les consonnes', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Les diphtongues', 'TEKSTO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Vocabulaire', 'VORTARO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Récit', 'TEKSTO', '8',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Pratique du vocabulaire - quatrième leçon, 2ème partie', 'EKZERCARO', '9',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Exercices - quatrième leçon, 3ème partie', 'EKZERCARO', '10',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Épilogue', 'TEKSTO', '11',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Éléments pour converser', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Les corrélatifs', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Un peu de pratique', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'La flexion des corrélatifs', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Proverbe', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Exercices - cinquième leçon', 'EKZERCARO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Épilogue', 'TEKSTO', '7',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Révision des terminaisons', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Comment poser des questions', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Rappel sur la prononciation', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Révision des corrélatifs', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Proverbe', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Les prépositions', 'TEKSTO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Premier récit et vocabulaire', 'TEKSTO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Prépositions (suite)', 'TEKSTO', '8',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Second récit et vocabulaire', 'TEKSTO', '9',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Exercices - sixième leçon, 2<sup>ème</sup> partie', 'EKZERCARO', '10',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Traduction de "il y a"', 'TEKSTO', '11',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Exercices - sixième leçon, 3<sup>ème</sup> partie', 'EKZERCARO', '12',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Complément d’objet indirect', 'TEKSTO', '13',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'L’accusatif peut remplacer certaines prépositions', 'TEKSTO', '14',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Exercices - sixième leçon, 4<sup>ème</sup> partie', 'EKZERCARO', '15',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Adverbes de lieu indiquant le mouvement', 'TEKSTO', '16',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Exercices - sixième leçon, 5<sup>ème</sup> partie', 'EKZERCARO', '17',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Épilogue', 'TEKSTO', '18',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Préfixes', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Suffixes', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Exercices - septième leçon', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Proverbes', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Expression de l’heure', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Épilogue', 'TEKSTO', '6',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Le reste de la conjugaison...', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Proverbes', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Exercices - huitième leçon, 1<sup>ère</sup> partie', 'EKZERCARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Exercices - huitième leçon, 2<sup>ème</sup> partie', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Pronom personnel et adjectif possessif réfléchis', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Exercices - huitième leçon, 3<sup>ème</sup> partie', 'EKZERCARO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Retour sur l’accent tonique', 'TEKSTO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Épilogue', 'TEKSTO', '8',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Un air connu...', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'L’élision', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Quelques adverbes primaires en <i>-aŭ</i>', 'TEKSTO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Divers mots en <i>-aŭ</i>', 'TEKSTO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Autres mots invariables', 'TEKSTO', '5',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Proverbes', 'TEKSTO', '6',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Des extraits de la presse espérantiste', 'TEKSTO', '7',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Exercices - neuvième leçon', 'EKZERCARO', '8',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '71', 'Examen', 'EKZERCARO', '1',1,1);
-- table qui permet d'indiquer la progression d'un élève
CREATE TABLE personoj_lecioneroj ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`dato` TIMESTAMP NOT NULL,
`persono_id` int(11) NOT NULL,
`lecionero_id` int(11) NOT NULL,
PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
-- modification pour gérer la validation d'une inscription
ALTER TABLE personoj ADD COLUMN `aktivigo` varchar(40) DEFAULT NULL;
ALTER TABLE personoj ADD COLUMN `aktivigita` BOOL NOT NULL DEFAULT  '0';
ALTER TABLE personoj ADD COLUMN `pasvorto_md5` varchar(40) DEFAULT NULL;
update personoj set pasvorto_md5=MD5(pasvorto);
update personoj set aktivigita='1'; -- pour rendre "actif" tous les comptes déjà existant
delete from landoj where id=77;
insert into landoj (kodo,nomo) values ('TR','Turquie'); 
-- ajout des sections pour Gerda Malaperis
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Lasu min…', 'TEKSTO', '5',0,1);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Rakonto', 'TEKSTO', '1',1,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Klarigoj', 'TEKSTO', '2',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Vortlisto', 'VORTARO', '3',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Ezercoj', 'EKZERCARO', '4',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Lasu min…', 'TEKSTO', '5',0,1);
-- table pour les réponses des élèves
DROP TABLE IF EXISTS respondoj ;
CREATE TABLE respondoj ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`dato` TIMESTAMP NOT NULL,
`persono_id` int(11) NOT NULL,
`lecionero_id` int(11) NOT NULL,
`kodo` varchar(40),
`demando` TEXT,
`respondo` TEXT,
PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
-- modification pour avoir des utilisateurs sans cours choisi :
ALTER TABLE `personoj` CHANGE `kurso` `kurso` VARCHAR(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '';

-- correction dans la table des leçons --
UPDATE lecioneroj SET titolo = 'Épilogue' WHERE id= 8;
UPDATE lecioneroj SET titolo = 'Exercice 1' WHERE id=15;
UPDATE lecioneroj SET titolo = 'Exercice 2' WHERE id=16;
UPDATE lecioneroj SET titolo = 'Exercice 3' WHERE id=17;
UPDATE lecioneroj SET titolo = 'Exercice 1' WHERE id=21;
UPDATE lecioneroj SET titolo = 'Exercice 2' WHERE id=26;
UPDATE lecioneroj SET titolo = 'Exercice 3' WHERE id=28;
UPDATE lecioneroj SET titolo = 'Exercice 4' WHERE id=30;
UPDATE lecioneroj SET titolo = 'Exercice 1' WHERE id=33;
UPDATE lecioneroj SET titolo = 'Exercice 2 : pratique du vocabulaire' WHERE id=40;
UPDATE lecioneroj SET titolo = 'Exercices 3 et 4' WHERE id=41;
UPDATE lecioneroj SET titolo = 'Exercices 1 et 2' WHERE id=48;
UPDATE lecioneroj SET titolo = 'Second récit et vocabulaire' WHERE id=58;
UPDATE lecioneroj SET titolo = 'Exercice 2' WHERE id=61;
UPDATE lecioneroj SET titolo = 'Exercice 3' WHERE id=64;
UPDATE lecioneroj SET titolo = 'Exercice 4' WHERE id=66;
UPDATE lecioneroj SET titolo = 'Exercices' WHERE id=70;
UPDATE lecioneroj SET titolo = 'Exercice 1' WHERE id=76;
UPDATE lecioneroj SET titolo = 'Exercice 2' WHERE id=77;
UPDATE lecioneroj SET titolo = 'Exercice 3' WHERE id=79;
UPDATE lecioneroj SET titolo = 'Exercice' WHERE id=89;

-- correction dans la table de leçons pour Gerda (exercices) --
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 94;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 99;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 104;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 109;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 114;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 119; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 184; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 189; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 194; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 199;
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 204; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 209; 
UPDATE `lecioneroj` SET `titolo` = 'Ekzercoj' WHERE `id` = 214;

-- Passage en V6
update `lecioneroj` set tipo='EKZERCARO' where leciono_id=68 and ordo='3';
CREATE TABLE personoj_lecionoj ( 
`id` INT NOT NULL AUTO_INCREMENT , 
`dato` TIMESTAMP NOT NULL,
`persono_id` int(11) NOT NULL,
`leciono_id` int(11) NOT NULL,
PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- passage en V7
UPDATE `lecioneroj` SET lasta=0 WHERE `leciono_id` = 71 and ordo=1;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '71', 'Bravo !', 'TEKSTO', '2',0,1);
-- correction Epilogue leçon 9
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Épilogue', 'TEKSTO', NULL, '9', '0', '1');
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 89;

-- passage en V8
-- correction de la section "expression de l'heure" qui contient un exercice :
UPDATE `lecioneroj` SET `tipo` = 'EKZERCARO' WHERE `id` = 72;
-- décalage de toutes les sections de la leçon 2 pour y intégrer le QCM récapitulatif :
update `lecioneroj` set ordo=id-7 WHERE leciono_id=60;
update `lecioneroj` set unua=0 WHERE id=9;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Récapitulatif de la leçon 1', 'QCM', '1',1,0);	
-- décalage des section de la leçon 1 pour intégrer les premières phrases de discution :
update `lecioneroj` set ordo=id+1 WHERE leciono_id=59 and id>=7;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Mes premiers mots', 'VORTARO', '7',0,0);	
-- séparation en deux parties de la page sur l'heure
update `lecioneroj` set ordo=7 WHERE id=73;
update `lecioneroj` set tipo='TEKSTO' WHERE id=72;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Exercices', 'EKZERCARO', '6',0,0);
-- décalage pour insérer les phrases de disctuion pour la deuxième leçon:
update `lecioneroj` set ordo=12 WHERE id=18;
update `lecioneroj` set ordo=13 WHERE id=19;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Comment ça va ?', 'VORTARO', '11',0,0);
update `lecioneroj` set ordo=11 WHERE id=30;

-- passage en V9
update `lecioneroj` set ordo=10 WHERE id=7;
update `lecioneroj` set ordo=11 WHERE id=8;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Qui est qui ?', 'QCM', '8',0,0);
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Je me présente', 'EKZERCARO', '9',0,0);
update `lecioneroj` set titolo='Ekzercoj' WHERE titolo= 'Ezercoj';
update respondoj set kodo='ekz01_18' where lecionero_id=6 and kodo='ekz01_16';
update respondoj set kodo='ekz01_17' where lecionero_id=6 and kodo='ekz01_15';
update respondoj set kodo='ekz01_16' where lecionero_id=6 and kodo='ekz01_14';
update respondoj set kodo='ekz01_15' where lecionero_id=6 and kodo='ekz01_13';	
update respondoj set kodo='ekz01_14' where lecionero_id=6 and kodo='ekz01_12';
-- oublie de l'islande comme pays :
INSERT INTO  `landoj` (`id` ,`kodo` ,`nomo`) VALUES (NULL ,  'IS',  'Islande');
-- 3ème niveau :
INSERT INTO `kursoj` (`id`, `kodo`, `nomo`) VALUES (NULL, '3N', 'Cours de 3ème niveau');
INSERT INTO `lecionoj` (`id`, `numero`, `titolo`, `retpagxo`, `kurso`, `unua`, `lasta`) VALUES (NULL, '1', 'Prezentu vin', 'leciono01.php', '3N', '1', '0'); -- 129
INSERT INTO `lecionoj` (`id`, `numero`, `titolo`, `retpagxo`, `kurso`, `unua`, `lasta`) VALUES (NULL, '2', 'Estingi fajron', 'leciono02.php', '3N', '0', '0');
INSERT INTO `lecionoj` (`id`, `numero`, `titolo`, `retpagxo`, `kurso`, `unua`, `lasta`) VALUES (NULL, '3', 'Mia plej ŝatata filmo', 'leciono03.php', '3N', '0', '0');
INSERT INTO `lecionoj` (`id`, `numero`, `titolo`, `retpagxo`, `kurso`, `unua`, `lasta`) VALUES (NULL, '4', 'Kio okazos ?', 'leciono04.php', '3N', '0', '0');
-- 1ere lecon
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '129', 'Prezentu vin', 'EKZERCARO', NULL, '1', '1', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '129', 'Envoi des exercices', 'TEKSTO', NULL, '2', '0', '1');
-- 2eme lecon
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Estingi fajron per sonoj - Vocabulaire', 'VORTARO', NULL, '1', '1', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Question - 1ère partie', 'QCM', NULL, '2', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Questions - 2ème partie', 'QCM', NULL, '3', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Questions - 3ème partie', 'QCM', NULL, '4', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Questions - 4ème partie', 'EKZERCARO', NULL, '5', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '130', 'Envoi des exercices', 'TEKSTO', NULL, '6', '0', '1');
-- 3eme lecon
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '131', 'Mia plej ŝatata filmo', 'EKZERCARO', NULL, '1', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '131', 'Divenu alies filmojn', 'TEKSTO', NULL, '2', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '131', 'Envoi des exercices', 'TEKSTO', NULL, '3', '0', '1');
-- 4ème leçon
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '132', 'Kio ozazos ?', 'EKZERCARO', NULL, '1', '1', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '132', 'Solvo', 'EKZERCARO', NULL, '2', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '132', 'Envoi des exercices', 'TEKSTO', NULL, '3', '0', '1');
-- ajout partie à la fin de chaque chapitre Gerda pour l'envoi des exercices
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 95;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 100;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 105;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 110;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 115;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 120;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 125;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 130;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 135;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 140;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 145;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 150;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 155;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 160;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 165;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 170;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 175;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 180;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 185;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 190;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 195;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 200;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 205;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 210;
UPDATE `lecioneroj` SET `lasta` = '0' WHERE `lecioneroj`.`id` = 215;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '64', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '65', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '66', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '67', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '70', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '71', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '72', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '73', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '74', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '75', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '76', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '77', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '78', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '79', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '80', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '81', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '82', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '83', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '84', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '85', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '86', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '87', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '88', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '89', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '90', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '91', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '92', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '93', 'Sendi la ekzercojn', 'TEKSTO', NULL, '6', '0', '1');
--- modification du nom de l'épilogues pour les leçons de DLEK
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 8;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 19;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 31;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 42;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 49;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 67;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 73;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 81;
UPDATE `lecioneroj` SET `titolo` = 'Épilogue et envoi des exercices' WHERE `lecioneroj`.`id` = 217;
UPDATE `lecioneroj` SET `titolo` = 'Envoi des exercices' WHERE `lecioneroj`.`id` = 216;
--- autres corrections dans les intertitres des leçons de DLEK
UPDATE `lecioneroj` SET `titolo` = 'Exercice 1' WHERE `lecioneroj`.`id` = 59;
UPDATE `lecioneroj` SET `titolo` = 'Questions - 2<sup>e</sup> partie' WHERE `lecioneroj`.`id` = 229;
UPDATE `lecioneroj` SET `titolo` = 'Questions - 3<sup>e</sup> partie' WHERE `lecioneroj`.`id` = 230;
UPDATE `lecioneroj` SET `titolo` = 'Questions - 4<sup>e</sup> partie' WHERE `lecioneroj`.`id` = 231;
--- correction lignes ajoutée à tort 
DELETE FROM `lecioneroj` WHERE `lecioneroj`.`id` = 306;
DELETE FROM `lecioneroj` WHERE `lecioneroj`.`id` = 307;
DELETE FROM `lecioneroj` WHERE `lecioneroj`.`id` = 323;
DELETE FROM `lecioneroj` WHERE `lecioneroj`.`id` = 308;
DELETE FROM `lecioneroj` WHERE `lecioneroj`.`id` = 309;
-- Axel peut prendre 5 élèves du cours 3ème niveau
INSERT INTO `korektebla_kurso` (`korektanto`, `kurso`, `kiom_lernantoj`) VALUES ('12', '3N', '5');

-- On ajoute quelques réponses pour l'exercice sur les films :
INSERT INTO `respondoj` (`id`, `dato`, `persono_id`, `lecionero_id`, `kodo`, `demando`, `respondo`) VALUES (NULL, CURRENT_TIMESTAMP, '10', '232', 'ekz03_01', '1 Mia plej ŝatata filmo temas pri :', 'Dum la dua mondmilito en Francio, iu familio de kamparanoj akceptas orfean kvin-jaran knabineton, kies gepatroj estis mortitaj dum bombatako. La filo de la familio, 11-jaraĝa knabo, kaj tiu knabino amikiĝas kaj ofte ludas kune. Post enteriĝo de la hundo de la knabineto, ili komencas ludi strangan ludon: iom post iom kreas etan tombejon, kie ili enteriĝas insektojn kaj etajn bestojn. La muziko de tiu filmo, ludata per gitaro, iĝis tre fama.');
INSERT INTO `respondoj` (`id`, `dato`, `persono_id`, `lecionero_id`, `kodo`, `demando`, `respondo`) VALUES (NULL, CURRENT_TIMESTAMP, '10', '232', 'ekz03_02', '2 Mia plej ŝatata filmo nomiĝas :', 'Jeux interdits');

INSERT INTO `respondoj` (`id`, `dato`, `persono_id`, `lecionero_id`, `kodo`, `demando`, `respondo`) VALUES (NULL, CURRENT_TIMESTAMP, '518', '232', 'ekz03_01', '1 Mia plej ŝatata filmo temas pri :', 'Tiu filmo, farita de fama angla komediogrupo, estas komika kaj satira filmo, kiu rakontas la vivon de iu ulo, kiu naskiĝis en la sama tago kiel Jesuo. Ni tiam vidas lin kiam li estas plenkreskulo. Li aliĝas al iu terorista grupo, kiu agas kontraŭ la Romanioj. Iun tagon, por eskapi la Romaniojn, li agas kiel li estus iu religiano, kaj li prelegas antaŭ multaj homoj. La homamaso kredas, ke li estas la Mesio, kaj tio okazos diversajn amuzajn scenojn. En la fino de la filmo, ni vidas lin, alkroĉita ĉe granda kruĉo, samtempe kiel kelkaj rabistoj, kaj tiam, ĉiuj komencas kanti kaj fajfi kantojn, kiu diras ke "oni ĉiam rigardu la bonan flankon de la vivo".');
INSERT INTO `respondoj` (`id`, `dato`, `persono_id`, `lecionero_id`, `kodo`, `demando`, `respondo`) VALUES (NULL, CURRENT_TIMESTAMP, '518', '232', 'ekz03_02', '2 Mia plej ŝatata filmo nomiĝas :', 'La vie de Brian');

-- passage en V10
CREATE TABLE `vortoj` ( `id` INT NOT NULL AUTO_INCREMENT , `eo` VARCHAR(128) NOT NULL , `fr` VARCHAR(128) NOT NULL ,`tipo` ENUM('adj','adv','conjonction','nom','nombre','phrase','pronom','préposition','verbe') NULL , `lecionero_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB  CHARSET=utf8 COLLATE utf8_general_ci;
CREATE TABLE `personoj_vortoj` ( `id` INT NOT NULL AUTO_INCREMENT , `persono_id` INT NOT NULL , `vorto_id` INT NOT NULL , `nombrilo` INT NOT NULL , `venontaFojo` DATETIME NOT NULL ,PRIMARY KEY (`id`)) ENGINE = InnoDB  CHARSET=utf8 COLLATE utf8_general_ci;

-- penser à charger les mots qui se trouvent dans le google doc

-- passage en V11
DROP TABLE `phpbb_auth_access`, `phpbb_banlist`, `phpbb_categories`, `phpbb_chatbox`, `phpbb_chatbox_backup`, `phpbb_chatbox_session`, `phpbb_config`, `phpbb_disallow`, `phpbb_forums`, `phpbb_forum_prune`, `phpbb_groups`, `phpbb_posts`, `phpbb_posts_text`, `phpbb_privmsgs`, `phpbb_privmsgs_text`, `phpbb_ranks`, `phpbb_search_results`, `phpbb_search_wordlist`, `phpbb_search_wordmatch`, `phpbb_sessions`, `phpbb_smilies`, `phpbb_themes`, `phpbb_themes_name`, `phpbb_topics`, `phpbb_topics_watch`, `phpbb_users`, `phpbb_user_group`, `phpbb_vote_desc`, `phpbb_vote_results`, `phpbb_vote_voters`, `phpbb_words`;
DROP TABLE `phpmv_archives`, `phpmv_a_category`, `phpmv_a_config`, `phpmv_a_file`, `phpmv_a_keyword`, `phpmv_a_newsletter`, `phpmv_a_page`, `phpmv_a_partner_name`, `phpmv_a_partner_url`, `phpmv_a_provider`, `phpmv_a_resolution`, `phpmv_a_search_engine`, `phpmv_a_site`, `phpmv_a_vars_name`, `phpmv_a_vars_value`, `phpmv_category`, `phpmv_groups`, `phpmv_ip_ignore`, `phpmv_link_vp`, `phpmv_link_vpv`, `phpmv_newsletter`, `phpmv_page`, `phpmv_page_md5url`, `phpmv_page_url`, `phpmv_query_log`, `phpmv_site`, `phpmv_site_partner`, `phpmv_site_partner_url`, `phpmv_site_url`, `phpmv_users`, `phpmv_users_link_groups`, `phpmv_vars`, `phpmv_version`, `phpmv_visit`;

-- correction vocabulaire
DELETE FROM `vortoj` WHERE `vortoj`.`id` = 30;
DELETE FROM `personoj_vortoj` WHERE `personoj_vortoj`.`vorto_id` = 30;

UPDATE `lecioneroj` SET `titolo` = 'Mes premières phrases' WHERE `lecioneroj`.`id` = 219;

-- correction vocabulaire
UPDATE `vortoj` SET `fr` = 'collectionner, rassembler' WHERE `vortoj`.`eo` LIKE 'kolekti';
UPDATE `vortoj` SET `fr` = 'beau-fils, gendre' WHERE `vortoj`.`eo` LIKE 'bofilo';
UPDATE `vortoj` SET `eo` = 'gesinoroj' WHERE `vortoj`.`eo` LIKE 'gesinorooj';

UPDATE `personoj_vortoj` WHERE `personoj_vortoj`.`vorto_id` = 30;

-- ajout d'une colonne pour simplifier la recherche de la dernière section vue
UPDATE nuna_kurso SET lastdato = '1999-05-11' WHERE CAST(lastdato AS CHAR(20)) = '0000-00-00';
ALTER TABLE nuna_kurso CHANGE `ekdato` `ekdato` DATE NULL,CHANGE `lastdato` `lastdato` DATE NULL;
UPDATE nuna_kurso SET lastdato = NULL WHERE CAST(lastdato AS CHAR(20)) = '1999-05-11';

-- ajout d'une section sur la musique dans la leçon 4
-- voir plus loin pour les modifs car on ajoute aussi une section pour un nouvel exercice
-- update lecioneroj set ordo=12 where id=42;

-- ajout d'une section pour la date dans la leçon 4
-- voir plus loin pour les modifs car on ajoute aussi une section pour un nouvel exercice
-- UPDATE `lecioneroj` SET ordo=13 WHERE `leciono_id`=62 and `ordo`=12; 
-- UPDATE `lecioneroj` SET ordo=12 WHERE `leciono_id`=62 and `ordo`=11; 
-- UPDATE `lecioneroj` SET ordo=11 WHERE `leciono_id`=62 and `ordo`=10; 
-- UPDATE `lecioneroj` SET ordo=10 WHERE `leciono_id`=62 and `ordo`=9; 
-- UPDATE `lecioneroj` SET ordo=9 WHERE `leciono_id`=62 and `ordo`=8; 


-- ajout d'une section pour les corrélatifs dans la leçon 1
-- les sections 9, 10 et 11 deviennent 11, 12 et 13
-- insertion de nouvelles sections 9 et 10
UPDATE `lecioneroj` SET ordo=13 WHERE `leciono_id`=59 and `ordo`=11;
UPDATE `lecioneroj` SET ordo=12 WHERE `leciono_id`=59 and `ordo`=10;
UPDATE `lecioneroj` SET ordo=11 WHERE `leciono_id`=59 and `ordo`=9;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 1' WHERE `leciono_id`=59 and `titolo` = 'Exercices';
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Premières questions', 'TEKSTO', NULL, '9', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '59', 'Exercices 2 et 3', 'EKZERCARO', NULL, '10', '0', '0');

-- ajout d'une section pour la date et une section pour l'exercice sur la date dans la leçon 4
-- la section 11 devient 14
-- les sections 8, 9 et 10 deviennent 10, 11 et 12
-- création nouvelles sections 8, 9 et 13
-- le nouvel exercice est le 2, les anciens exercices 3 et 4 devient 4 et 5
UPDATE `lecioneroj` SET ordo=14 WHERE `leciono_id`=62 and `ordo`=11;
UPDATE `lecioneroj` SET ordo=12 WHERE `leciono_id`=62 and `ordo`=10;
UPDATE `lecioneroj` SET ordo=11 WHERE `leciono_id`=62 and `ordo`=9;
UPDATE `lecioneroj` SET ordo=10 WHERE `leciono_id`=62 and `ordo`=8;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'La date', 'TEKSTO', NULL, '8', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'Exercice 2 : la date', 'EKZERCARO', NULL, '9', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '62', 'La chanson espérantophone', 'TEKSTO', NULL, '13', '0', '0');
UPDATE `lecioneroj` SET `titolo` = 'Exercice 3 : pratique du vocabulaire' WHERE `leciono_id`=62 and `titolo` = 'Exercice 2 : pratique du vocabulaire';
UPDATE `lecioneroj` SET `titolo` = 'Exercices 4 et 5' WHERE `leciono_id`=62 and `titolo` = 'Exercices 3 et 4';


-- décalage des exercices de la leçon 4 après insertion de l'exercice sur les dates
UPDATE `respondoj` SET `kodo` = 'ekz04_28', `demando` = '28 Avez-vous vu la nouvelle pièce de théâtre ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_24';
UPDATE `respondoj` SET `kodo` = 'ekz04_27', `demando` = '27 Avez-vous deux euros et trente centimes (euro = eŭro, centime = cendo) ?' WHERE `lecionero_id` = 41 AND `kodo` LIKE 'ekz04_23';
UPDATE `respondoj` SET `kodo` = 'ekz04_26', `demando` = '26 Est-ce que sa femme est la mère de ton amie ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_22';
UPDATE `respondoj` SET `kodo` = 'ekz04_25', `demando` = '25 Avez-vous goûté le gâteau ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_21';
UPDATE `respondoj` SET `kodo` = 'ekz04_24', `demando` = '24 Est-ce que le lait est froid ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_20';
UPDATE `respondoj` SET `kodo` = 'ekz04_23', `demando` = '23 Ta mère vient-elle d’Europe ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_19';
UPDATE `respondoj` SET `kodo` = 'ekz04_22', `demando` = '22 Sont-ils de bons amis ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_18';
UPDATE `respondoj` SET `kodo` = 'ekz04_21', `demando` = '21 Est-ce que le frère de la fille malade écrivait mal ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_17';
UPDATE `respondoj` SET `kodo` = 'ekz04_20', `demando` = '20 Vendent-ils du thé et du café dans la nouvelle boutique ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_16';
UPDATE `respondoj` SET `kodo` = 'ekz04_19', `demando` = '19 Est-ce que la nouvelle institutrice a oublié le livre dans une pièce de l’école ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_15';
UPDATE `respondoj` SET `kodo` = 'ekz04_18', `demando` = '18 Est-ce que le père lavera les petites tasses dans la maison de Fatima ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_14';
UPDATE `respondoj` SET `kodo` = 'ekz04_17', `demando` = '17 Est-ce qu’un garçon en bonne santé boit du lait ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_13';
UPDATE `respondoj` SET `kodo` = 'ekz04_16', `demando` = '16 Est-ce que les enfants vont danser dans l’école ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_12';
UPDATE `respondoj` SET `kodo` = 'ekz04_15', `demando` = '15 A-t-il oublié de porter du pain à la sœur de Petro ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_11';
UPDATE `respondoj` SET `kodo` = 'ekz04_14', `demando` = '14 Est-ce que son fils a oublié le thé et le lait ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_10';
UPDATE `respondoj` SET `kodo` = 'ekz04_13', `demando` = '13 Est-ce que ton père collectionne les timbres de mon pays ? (collectionner = KOLEKTI)' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_09';
UPDATE `respondoj` SET `kodo` = 'ekz04_12', `demando` = '12 Simeono atendas en la butiko. Li jam havas du ovojn, sed li deziras aĉeti sandviĉon. Li manĝos ilin vespere.' WHERE `lecionero_id` = 40 AND `kodo` = 'ekz04_08';
UPDATE `respondoj` SET `kodo` = 'ekz04_11', `demando` = '11 La infanoj kuras al la lernejo, kaj en la lernejo ili skribos la novan lecionon.' WHERE `lecionero_id` = 40 AND `kodo` = 'ekz04_07';
UPDATE `respondoj` SET `kodo` = 'ekz04_10', `demando` = '10 Petro, la filo de Fatima, kolektas poŝtmarkojn kaj bildojn el ĵurnaloj. Maria, lia fratino, promenas bicikle.' WHERE `lecionero_id` = 40 AND `kodo` = 'ekz04_06';
UPDATE `respondoj` SET `kodo` = 'ekz04_09', `demando` = '9 Fatima deziras aĉeti novajn ŝuojn al la infanoj.' WHERE `lecionero_id` = 40 AND `kodo` = 'ekz04_05';
UPDATE `respondoj` SET `kodo` = 'ekz04_08', `demando` = '8 Simeono estas la edzo de Fatima. Li amas ŝin. Li, la edzino kaj la infanoj loĝas en Eŭropo, en granda domo.' WHERE `lecionero_id` = 40 AND `kodo` = 'ekz04_04';

-- ajout en base du nouveau vocabulaire de la leçon 1
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kie','où','pronom',3);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('jen','voici','adv',3);

-- ajout en base du nouveau vocabulaire de la leçon 2
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kiel','comment, comme','pronom',221);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('tiel','ainsi, comme ça','pronom',221);

-- ajout en base du nouveau vocabulaire de la leçon 4
insert into vortoj (eo,fr,tipo,lecionero_id) values ('dato','date','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('hodiaŭ','aujourd''hui','adv',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('morgaŭ','demain','adv',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('hieraŭ','hier','adv',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('lundo','lundi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('mardo','mardi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('merkredo','mercredi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('jaŭdo','jeudi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('vendredo','vendredi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('sabato','samedi','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('dimanĉo','dimanche','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('januaro','janvier','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('februaro','février','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('marto','mars','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('aprilo','avril','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('majo','mai','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('junio','juin','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('julio','juillet','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('aŭgusto','août','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('septembro','septembre','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('oktobro','octobre','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('novembro','novembre','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('decembro','décembre','nom',271);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('iu','quelqu''un','pronom',38);

-- ajout de deux sections dans la leçon 3
UPDATE `lecioneroj` SET ordo=14 WHERE `leciono_id`=61 and `ordo`=12;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Qu''est-ce que c''est ?', 'TEKSTO', NULL, '12', '0', '0');
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '61', 'Exercice 5', 'EKZERCARO', NULL, '13', '0', '0');

-- ajout en base du nouveau vocabulaire pour la leçon 3
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kio','quoi, que','pronom',274);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('tio','ce, cela, ça','pronom',274);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kiom da','combien de','pronom',27);

-- ajout corrélatifs dans la leçon 2
insert into vortoj (eo,fr,tipo,lecionero_id) values ('neniam','jamais','adv',13);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('nenio','rien','pronom',13);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('nenie','nulle part','adv',13);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('neniu','personne','pronom',13);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kato','chat','nom',14);

-- ajout correlatifs de la leçon 5
insert into vortoj (eo,fr,tipo,lecionero_id) values ('ĉiu','chaque, chacun','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('tiu','ce, cet(te)','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kial','pourquoi','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('tie','ici, là','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('tiam','à ce moment là, alors','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('iam','à un moment, un jour, une fois','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('neniom','aucun','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kies','de qui, à qui, donc, duquel','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('ties','de celui-là, à celui-là','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('nenies','de personne','adj',44);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('ĉies','de chacun, de tout le monde','adj',44);

-- ajout du type pour le vocabulaire de Gerda :
ALTER TABLE  `vortoj` CHANGE  `tipo`  `tipo` ENUM(  'adj',  'adv',  'conjonction',  'expression',  'interjection',  'nom',  'nombre',  'phrase',  'pronom',  'préfixe',  'préposition',  'verbe' ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL;

-- Passage en V12
UPDATE personoj SET lasteniro = '1999-05-11' WHERE CAST(lasteniro AS CHAR(20)) = '0000-00-00';
UPDATE personoj SET lasteniro = '1999-05-11' WHERE CAST(lasteniro AS CHAR(20)) = '0000-00-00 00:00:00';
UPDATE personoj SET naskigxdato = null WHERE CAST(naskigxdato AS CHAR(20)) = '0000-00-00';
ALTER TABLE `personoj` DROP `pasvorto`;

-- amélioration de l'outil memorilo (à ajouter directement en prod)
CREATE TABLE personoj_vortoj_respondoj ( persono_id INT NOT NULL , vorto_id INT NOT NULL , dato TIMESTAMP NOT NULL , bona BOOLEAN NOT NULL , respondo VARCHAR(128) NOT NULL ) ENGINE = InnoDB;
ALTER TABLE personoj_vortoj ADD lastfojo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER venontaFojo;

-- V12 : ajout prépositions dans la leçon 2
-- les sections 5 à 13 deviennent 6 à 14
-- insertion d'une nouvelle section 5 (nouvel exercice)
UPDATE `lecioneroj` SET ordo=14 WHERE `leciono_id`=60 and `ordo`=13;
UPDATE `lecioneroj` SET ordo=13 WHERE `leciono_id`=60 and `ordo`=12;
UPDATE `lecioneroj` SET ordo=12 WHERE `leciono_id`=60 and `ordo`=11;
UPDATE `lecioneroj` SET ordo=11 WHERE `leciono_id`=60 and `ordo`=10;
UPDATE `lecioneroj` SET ordo=10 WHERE `leciono_id`=60 and `ordo`=9;
UPDATE `lecioneroj` SET ordo=9 WHERE `leciono_id`=60 and `ordo`=8;
UPDATE `lecioneroj` SET ordo=8 WHERE `leciono_id`=60 and `ordo`=7;
UPDATE `lecioneroj` SET ordo=7 WHERE `leciono_id`=60 and `ordo`=6;
UPDATE `lecioneroj` SET ordo=6 WHERE `leciono_id`=60 and `ordo`=5;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 4' WHERE `leciono_id`=60 and `titolo` = 'Exercice 3';
UPDATE `lecioneroj` SET `titolo` = 'Exercice 3' WHERE `leciono_id`=60 and `titolo` = 'Exercice 2';
UPDATE `lecioneroj` SET `titolo` = 'Exercice 2' WHERE `leciono_id`=60 and `titolo` = 'Exercice 1';
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '60', 'Exercice 1', 'EKZERCARO', NULL, '5', '0', '0');
-- décalage des exercices de la leçon 2 après insertion de l'exercice sur les prépositions
UPDATE `respondoj` SET `kodo` = 'ekz02_28', `demando` = '28 bela - esti - fratino - knabino - mia.' WHERE `lecionero_id` = 17 AND `kodo` = 'ekz02_24';
UPDATE `respondoj` SET `kodo` = 'ekz02_27', `demando` = '27 forgesi - mi - papero - porti.' WHERE `lecionero_id` = 17 AND `kodo` = 'ekz02_23';	
UPDATE `respondoj` SET `kodo` = 'ekz02_26', `demando` = '26 amiko - bona - limonado - vendi - via.' WHERE `lecionero_id` = 17 AND `kodo` = 'ekz02_22';
UPDATE `respondoj` SET `kodo` = 'ekz02_25', `demando` = '25 akvo - bela - birdo - la - pura - trinki.' WHERE `lecionero_id` = 17 AND `kodo` = 'ekz02_21';
UPDATE `respondoj` SET `kodo` = 'ekz02_24', `demando` = '24 amikino - la - malvarma - mia - sukeri - teo.' WHERE `lecionero_id` = 17 AND `kodo` = 'ekz02_20';
UPDATE `respondoj` SET `kodo` = 'ekz02_23', `demando` = '23 {La virino} ne sukeris mian teon.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_19';
UPDATE `respondoj` SET `kodo` = 'ekz02_22', `demando` = '22 {Miaj fratoj} kaptis malsanan birdon.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_18';
UPDATE `respondoj` SET `kodo` = 'ekz02_21', `demando` = '21 {La viro} havas novan amikon.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_17';
UPDATE `respondoj` SET `kodo` = 'ekz02_20', `demando` = '20 {Mia frato} neniam lavas la tasojn.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_16';
UPDATE `respondoj` SET `kodo` = 'ekz02_19', `demando` = '19 {La akvo} estas varma.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_15';
UPDATE `respondoj` SET `kodo` = 'ekz02_18', `demando` = '18 {La butikoj} estas malpuraj.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_14';
UPDATE `respondoj` SET `kodo` = 'ekz02_17', `demando` = '17 {La bela birdo} ĉiam trinkas akvon.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_13';
UPDATE `respondoj` SET `kodo` = 'ekz02_16', `demando` = '16 {Mia amikino} estas bela.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_12';
UPDATE `respondoj` SET `kodo` = 'ekz02_15', `demando` = '15 {La kuko} estas bela.' WHERE `lecionero_id` = 16 AND `kodo` = 'ekz02_11';
UPDATE `respondoj` SET `kodo` = 'ekz02_14', `demando` = '14 De l’eau froide ne lave pas (&quot;ne lavas&quot;) un petit garçon.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_10';
UPDATE `respondoj` SET `kodo` = 'ekz02_13', `demando` = '13 La nouvelle boutique a vendu de la mauvaise limonade.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_09';
UPDATE `respondoj` SET `kodo` = 'ekz02_12', `demando` = '12 Le bel oiseau attrapa un petit insecte.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_08';
UPDATE `respondoj` SET `kodo` = 'ekz02_11', `demando` = '11 Personne ne lavera les petites tasses.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_07';
UPDATE `respondoj` SET `kodo` = 'ekz02_10', `demando` = '10 Le frère bien portant avait une petite s&oelig;ur malade.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_06';
UPDATE `respondoj` SET `kodo` = 'ekz02_09', `demando` = '9 La petite fille a rencontré les s&oelig;urs laides.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_05';
UPDATE `respondoj` SET `kodo` = 'ekz02_08', `demando` = '8 Les bons amis feront toujours un beau gâteau.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_04';
UPDATE `respondoj` SET `kodo` = 'ekz02_07', `demando` = '7 Le grand instituteur a rencontré les nouveaux amis.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_03';
UPDATE `respondoj` SET `kodo` = 'ekz02_06', `demando` = '6 La nouvelle boutique vend des gâteaux secs.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_02';
UPDATE `respondoj` SET `kodo` = 'ekz02_05', `demando` = '5 Un garçon en bonne santé boit du lait chaud.' WHERE `lecionero_id` = 15 AND `kodo` = 'ekz02_01';

-- ajout vocabulaire dans leçon 2 + décalage du vocabulaire qui était appris dans une autre leçon
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'antaŭ' AND `lecionero_id` = 85;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'kato' AND `lecionero_id` = 14;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'domo' AND `lecionero_id` = 38;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'akvo' AND `lecionero_id` = 14;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'libro' AND `lecionero_id` = 38;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'promeni' AND `lecionero_id` = 22;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'vidi' AND `lecionero_id` = 14;
UPDATE `vortoj` SET `lecionero_id` = '276' WHERE `eo` = 'birdo' AND `lecionero_id` = 14;
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('sub','avant, devant','préposition',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('sur','sur, au-dessus','préposition',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('super','au-dessus de, par-dessus','préposition',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('floro','fleur','nom',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('suno','soleil','nom',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('tablo','table','nom',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('arbo','arbre','nom',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('biciklo','vélo','nom',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('flugi','voler (oiseau, avion, ...)','verbe',276);
INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('pluvo','pluie','nom',276);

-- ajout d'index pour l'outil memorilo :
ALTER TABLE  `personoj_vortoj` ADD INDEX  `persono_index` (  `persono_id` );
ALTER TABLE  `personoj_vortoj` ADD INDEX  `vorto_index` (  `vorto_id` );
ALTER TABLE  `personoj_lecioneroj` ADD INDEX  `persono_index` (  `persono_id` );

-- décalage sections de la leçon 4
-- mise à jour du vocabulaire correspondant
DELETE FROM `lecioneroj` WHERE `leciono_id`=62 and `id` = 35;
DELETE FROM `lecioneroj` WHERE `leciono_id`=62 and `id` = 36;
UPDATE `lecioneroj` SET ordo=4 WHERE `leciono_id`=62 and `ordo`=6;
UPDATE `lecioneroj` SET ordo=5 WHERE `leciono_id`=62 and `ordo`=7;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 3 : la date' WHERE  `leciono_id`=62 and `id` =272;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 4 : pratique du vocabulaire' WHERE `leciono_id`=62 and `id` =40;
UPDATE `lecioneroj` SET `titolo` = 'Exercices 5 et 6' WHERE `leciono_id`=62 and `id` =41;
INSERT into lecioneroj (leciono_id,titolo,tipo,enhavo,ordo,unua,lasta) values ('62', 'Encore des compléments', 'TEKSTO', NULL, '6', '0', '0');
INSERT into lecioneroj (leciono_id,titolo,tipo,enhavo,ordo,unua,lasta) values ('62', 'Exercice 2', 'EKZERCARO', NULL, '7', '0', '0');

INSERT into vortoj (eo,fr,tipo,lecionero_id) values ('ĝardeno','jardin','nom',38);

-- décalage des exercices de la leçon 4 après insertion de l'exercice sur les prépositions
UPDATE `respondoj` SET `kodo` = 'ekz04_32', `demando` = 'Avez-vous vu la nouvelle pièce de théâtre ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_28';
UPDATE `respondoj` SET `kodo` = 'ekz04_31', `demando` = 'Avez-vous deux euros et trente centimes (euro = eŭro, centime = cendo) ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_27';
UPDATE `respondoj` SET `kodo` = 'ekz04_30', `demando` = 'Est-ce que sa femme est la mère de ton amie ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_26';
UPDATE `respondoj` SET `kodo` = 'ekz04_29', `demando` = 'Avez-vous goûté le gâteau ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_25';
UPDATE `respondoj` SET `kodo` = 'ekz04_28', `demando` = 'Est-ce que le lait est froid ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_24';
UPDATE `respondoj` SET `kodo` = 'ekz04_27', `demando` = 'Ta mère vient-elle d’Europe ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_23';
UPDATE `respondoj` SET `kodo` = 'ekz04_26', `demando` = 'Sont-ils de bons amis ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_22';
UPDATE `respondoj` SET `kodo` = 'ekz04_25', `demando` = 'Est-ce que le frère de la fille malade écrivait mal ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_21';
UPDATE `respondoj` SET `kodo` = 'ekz04_24', `demando` = 'Vendent-ils du thé et du café dans la nouvelle boutique ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_20';
UPDATE `respondoj` SET `kodo` = 'ekz04_23', `demando` = 'Est-ce que la nouvelle institutrice a oublié le livre dans une pièce de l’école ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_19';
UPDATE `respondoj` SET `kodo` = 'ekz04_22', `demando` = 'Est-ce que le père lavera les petites tasses dans la maison de Fatima ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_18';
UPDATE `respondoj` SET `kodo` = 'ekz04_21', `demando` = 'Est-ce qu’un garçon en bonne santé boit du lait ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_17';
UPDATE `respondoj` SET `kodo` = 'ekz04_20', `demando` = 'Est-ce que les enfants vont danser dans l’école ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_16';
UPDATE `respondoj` SET `kodo` = 'ekz04_19', `demando` = 'A-t-il oublié de porter du pain à la sœur de Petro ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_15';
UPDATE `respondoj` SET `kodo` = 'ekz04_18', `demando` = 'Est-ce que son fils a oublié le thé et le lait ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_14';
UPDATE `respondoj` SET `kodo` = 'ekz04_17', `demando` = 'Est-ce que ton père collectionne les timbres de mon pays ?' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_13';
UPDATE `respondoj` SET `kodo` = 'ekz04_16', `demando` = 'Simeono atendas en la butiko. Li jam havas du ovojn, sed li deziras aĉeti sandviĉon. Li manĝos ilin vespere.' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_12';
UPDATE `respondoj` SET `kodo` = 'ekz04_15', `demando` = 'La infanoj kuras al la lernejo, kaj en la lernejo ili skribos la novan lecionon.' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_11';
UPDATE `respondoj` SET `kodo` = 'ekz04_14', `demando` = 'Petro, la filo de Fatima, kolektas poŝtmarkojn kaj bildojn el ĵurnaloj. Maria, lia fratino, promenas bicikle.' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_10';
UPDATE `respondoj` SET `kodo` = 'ekz04_13', `demando` = 'Fatima deziras aĉeti novajn ŝuojn al la infanoj.' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_09';
UPDATE `respondoj` SET `kodo` = 'ekz04_12', `demando` = 'Simeono estas la edzo de Fatima. Li amas ŝin. Li, la edzino kaj la infanoj loĝas en Eŭropo, en granda domo.' WHERE `lecionero_id` = 41 AND `kodo` = 'ekz04_08';
UPDATE `respondoj` SET `kodo` = 'ekz04_11', `demando` = 'En kiu jaro aperis (APERI = paraître) la Unua Libro de Esperanto?' WHERE `lecionero_id` = 272 AND `kodo` = 'ekz04_07';
UPDATE `respondoj` SET `kodo` = 'ekz04_10', `demando` = 'Kiam estas la Nacia Tago en via lando? (NACIA = national-e)' WHERE `lecionero_id` = 272 AND `kodo` = 'ekz04_06';
UPDATE `respondoj` SET `kodo` = 'ekz04_09', `demando` = 'Hodiaŭ estas ĵaŭdo la 30-a de novembro. Kiu dato estos morgaŭ?' WHERE `lecionero_id` = 272 AND `kodo` = 'ekz04_05';
UPDATE `respondoj` SET `kodo` = 'ekz04_08', `demando` = 'Kiom da tagoj estas en unu jaro?' WHERE `lecionero_id` = 272 AND `kodo` = 'ekz04_04';

-- fusion des 2 pages de préposition et ajout exercice leçon 6
-- décalage des numéros des autres exercices

UPDATE `lecioneroj` SET `ordo` = '8' WHERE `id` = 56; 
UPDATE `lecioneroj` SET `titolo` = 'Exercice 1', `tipo` = 'EKZERCARO', `ordo` = '7' WHERE `id` = 57; 
UPDATE `lecioneroj` SET `titolo` = 'Exercice 2' WHERE `id` = 59; 
UPDATE `lecioneroj` SET `titolo` = 'Exercice 3' WHERE `id` = 61; 
UPDATE `lecioneroj` SET `titolo` = 'Exercice 4' WHERE `id` = 64; 
UPDATE `lecioneroj` SET `titolo` = 'Exercice 5' WHERE `id` = 66;

-- décalage des exercices de la leçon 6 après insertion de l'exercice sur les prépositions
UPDATE `respondoj` SET `kodo` = 'ekz06_36', `demando` = '36 Mi* veturis al la zoologia* ĝardeno* kun Petro*. Li* tre deziris veturi tie*. En la zoo* li admiris ursoj* kaj simioj*. Kiam la blanka urso vidis Petro*, ĝi kuris en la akvo*. Ni atendis kvin minutoj*  por vidi, kio* la urso* faros poste, sed ĝi* ne iris el la akvo* kaj en la akvo* ĝi nenio* faris. Ni revenis Montrealo* vespere*.' WHERE `lecionero_id` = 66 AND `kodo` = 'ekz06_27';
UPDATE `respondoj` SET `kodo` = 'ekz06_35', `demando` = '35 D-ro (Doktoro) Zamenhof naskiĝis JE* la 15a de decembro 1859. (naskiĝi = naître)' WHERE `lecionero_id` = 64 AND `kodo` = 'ekz06_26';
UPDATE `respondoj` SET `kodo` = 'ekz06_34', `demando` = '34 La strato estas larĝa JE* 50 metroj.' WHERE `lecionero_id` = 64 AND `kodo` = 'ekz06_25';
UPDATE `respondoj` SET `kodo` = 'ekz06_33', `demando` = '33 Mi feriis DUM tri semajnoj.' WHERE `lecionero_id` = 64 AND `kodo` = 'ekz06_24';
UPDATE `respondoj` SET `kodo` = 'ekz06_32', `demando` = '32 Faru vian aferon, Dio zorgos PRI la cetero. (proverbe : faru = fais [impératif])' WHERE `lecionero_id` = 64 AND `kodo` = 'ekz06_23';
UPDATE `respondoj` SET `kodo` = 'ekz06_31', `demando` = '31 arkta - blankaj - En - estas - kontinento - la - ursoj.' WHERE `lecionero_id` = 61 AND `kodo` = 'ekz06_22';
UPDATE `respondoj` SET `kodo` = 'ekz06_30', `demando` = '30 estis - Kio - la - por - tagmanĝo - ?' WHERE `lecionero_id` = 61 AND `kodo` = 'ekz06_21';
UPDATE `respondoj` SET `kodo` = 'ekz06_29', `demando` = '29 apud - Ĉu - enirejo ? - estis - kaĝoj - la - multaj' WHERE `lecionero_id` = 61 AND `kodo` = 'ekz06_20';
UPDATE `respondoj` SET `kodo` = 'ekz06_28', `demando` = '28 Kiajn amikojn vi vizitis en Montrealo ?' WHERE `lecionero_id` = 61 AND `kodo` = 'ekz06_19';
UPDATE `respondoj` SET `kodo` = 'ekz06_27', `demando` = '27 Kie okazis la kongreso, en kiu vi partoprenis? Ĉu en Granby?' WHERE `lecionero_id` = 61 AND `kodo` = 'ekz06_18';
UPDATE `respondoj` SET `kodo` = 'ekz06_26', `demando` = '26 En kia klubo vi estas membro?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_17';
UPDATE `respondoj` SET `kodo` = 'ekz06_25', `demando` = '25 Per kio vi veturis al la Zoologia Ĝardeno?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_16';
UPDATE `respondoj` SET `kodo` = 'ekz06_24', `demando` = '24 Kiajn ursojn vi vidis en la zoo?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_15';
UPDATE `respondoj` SET `kodo` = 'ekz06_23', `demando` = '23 Kie estis la blanka urso?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_14';
UPDATE `respondoj` SET `kodo` = 'ekz06_22', `demando` = '22 Kio plaĉis al via frato?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_13';
UPDATE `respondoj` SET `kodo` = 'ekz06_21', `demando` = '21 Kion vi vizitis en Granby?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_12';
UPDATE `respondoj` SET `kodo` = 'ekz06_20', `demando` = '20 Kion vi manĝis por la tagmanĝo?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_11';
UPDATE `respondoj` SET `kodo` = 'ekz06_19', `demando` = '19 Kiajn amikojn vi vizitis en Montrealo?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_10';
UPDATE `respondoj` SET `kodo` = 'ekz06_18', `demando` = '18 Kie okazis la kongreso, en kiu vi partoprenis? Ĉu en Granby?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_09';
UPDATE `respondoj` SET `kodo` = 'ekz06_17', `demando` = '17 En kia klubo vi estas membro?' WHERE `lecionero_id` = 59 AND `kodo` = 'ekz06_08';

-- mot nouveaux leçon 6
insert into vortoj (eo,fr,tipo,lecionero_id) values ('kastelo','château','nom',57);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('marŝi','marcher','verbe',57);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('ĉapelo','chapeau','nom',57);
insert into vortoj (eo,fr,tipo,lecionero_id) values ('vojo','chemin, route','nom',57);

------------------
-- Passage en V13
------------------

ALTER TABLE personoj_vortoj_respondoj CONVERT TO CHARACTER SET utf8;
ALTER TABLE  `personoj_lecionoj` ADD  `komentario` TEXT NULL ;
ALTER TABLE personoj_vortoj_respondoj ADD INDEX vorto_index ( vorto_id );
-- ajout des consignes des exercices en base :
ALTER TABLE `respondoj` ADD `komando` TEXT NOT NULL AFTER `kodo`;

--- ajout section 7 (page vocabulaire) dans la leçon 7 juste avant l'épilogue
--UPDATE `lecioneroj` SET `ordo` = '8' WHERE `ordo` = 7;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '68', 'Vocabulaire', 'TEKSTO', NULL, '7', '0', '0');

------------------
-- Passage en V14
------------------
ALTER TABLE `respondoj` ADD `normaligita` TEXT ;

-- ajout exercice 4 dans la leçon 7 du DLEK

UPDATE `lecioneroj` SET `titolo` = 'Exercices 1 et 2' WHERE `leciono_id` = 68 AND `ordo` = 3;
UPDATE `lecioneroj` SET `titolo` = 'Exercices 3 et 4' WHERE `leciono_id` = 68 AND `ordo` = 6;

-- ajout exercice dans la leçon 8 du DLEK

UPDATE `lecioneroj` SET `ordo` = '9' WHERE `leciono_id` = 69 AND `ordo` = 8; 
UPDATE `lecioneroj` SET `ordo` = '8' WHERE `leciono_id` = 69 AND `ordo` = 7; 
UPDATE `lecioneroj` SET `ordo` = '7', `titolo` = 'Exercice 4' WHERE `leciono_id` = 69 AND `ordo` = 6; 
UPDATE `lecioneroj` SET `ordo` = '6' WHERE `leciono_id` = 69 AND `ordo` = 5; 
UPDATE `lecioneroj` SET `ordo` = '5', `titolo` = 'Exercice 3' WHERE `leciono_id` = 69 AND `ordo` = 4; 
UPDATE `lecioneroj` SET `ordo` = '4', `titolo` = 'Exercice 2' WHERE `leciono_id` = 69 AND `ordo` = 3; 
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Exercice 1', 'EKZERCARO', NULL, '3', '0', '0');

-- décalage des réponses des exercices 2, 3 et 4 (qui étaient auparavant 1, 2 et 3)

UPDATE `respondoj` SET `kodo` = 'ekz08_11', `demando` = '11 Si elle venait à 8h nous pourrions manger à 8h30.' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_01';
UPDATE `respondoj` SET `kodo` = 'ekz08_12', `demando` = '12 Je désire qu’elle vienne à 8h mais je crois qu’elle ne viendra pas avant 9h.' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_02';
UPDATE `respondoj` SET `kodo` = 'ekz08_13', `demando` = '13 Va là-bas, assieds-toi et ouvre le sucrier !' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_03';
UPDATE `respondoj` SET `kodo` = 'ekz08_14', `demando` = '14 Cet imbécile veut me rencontrer à l’étable. Qu’il [y] aille en premier, et qu’il m’attende. Je viendrai quand je voudrai.' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_04';
UPDATE `respondoj` SET `kodo` = 'ekz08_15', `demando` = '15 Que faire ? (Qu’est-ce que je «dois-faire» ?)' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_05';
UPDATE `respondoj` SET `kodo` = 'ekz08_16', `demando` = '16 Il croyait que je ne viendrais pas avant 9h mais je suis venue à 8h moins 5.' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_06';
UPDATE `respondoj` SET `kodo` = 'ekz08_17', `demando` = '17 Sur le point de chanter, il se mit à rire. (préfixe ek-)' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_07';
UPDATE `respondoj` SET `kodo` = 'ekz08_18', `demando` = '18 Elle se mit à rougir en griffonnant le nom du garçon.' WHERE `lecionero_id` = 76 AND `kodo` = 'ekz08_08';
UPDATE `respondoj` SET `kodo` = 'ekz08_19', `demando` = '19 <br>Juĝisto:  Ĉu vi do asertas, ke vi iris en la domon opiniante, ke ĝi estas via domo ?<br>Akuzato: Jes, sinjoro juĝisto.<br>Juĝisto:  Sed kial vi forkuris, kiam la sinjorino envenis ?<br>Akuzato: Mi opiniis, ke ŝi estas mia edzino !' WHERE `lecionero_id` = 77 AND `kodo` = 'ekz08_09';
UPDATE `respondoj` SET `kodo` = 'ekz08_20', `demando` = '20 <br>Patrino en tramo: Joĉjo, kial vi sidas kun fermitaj okuloj ? Ĉu vi estas laca ?<br>Joĉjo: Ne ! Ne plaĉas al mi vidi starantajn virinojn.' WHERE `lecionero_id` = 77 AND `kodo` = 'ekz08_10';
UPDATE `respondoj` SET `kodo` = 'ekz08_21', `demando` = '21 <br>- Incitas min, ke mia edzino daŭre parolas pri sia antaŭa edzo.<br>- Tio estas nenio ! La mia paroladas pri sia estonta edzo !' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_11';
UPDATE `respondoj` SET `kodo` = 'ekz08_22', `demando` = '22 <br>En kafejo:<br>- Kial vi rigardadas al la pordo ?<br>- Mi observadas, ĉu ne iu foriras kun mia surtuto. Kun la via jam antaŭ dek minutoj foriris iu.' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_12';
UPDATE `respondoj` SET `kodo` = 'ekz08_23', `demando` = '23 <br>La junaj geedzoj havis konflikton hejme, kaj poste dum la aŭto-veturado ili ambaŭ obstine silentis. Preterpasante aron da azenoj la edzo diris moke:<br>- Ĉu parencoj de vi ?<br>- Jes, boparencoj !' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_13';

-- rectification suite à une coquille dans l'ex. 1 de la leçon 6.7
UPDATE `respondoj` SET `demando` = '11 Ni konstruis kastelon ... sablo.' WHERE `lecionero_id` = 57 AND `kodo` = 'ekz06_11';

------------------
-- Passage en V15
------------------
CREATE TABLE ekzercoj ( `id` INT NOT NULL AUTO_INCREMENT , `komando` TEXT NOT NULL , `lecionero_id` INT NOT NULL , `komando_detalo` TEXT NULL , `ekzemplo` TEXT NULL , `typo` ENUM('traduko','verkado') NOT NULL , `x2u` BOOLEAN NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;
CREATE TABLE ekzerceroj ( `id` INT NOT NULL AUTO_INCREMENT ,`ekzerco_id` int(11) NOT NULL, `kodo` VARCHAR(10) NOT NULL , `numero` INT NOT NULL, `demando` TEXT NOT NULL ,`respondo` text NOT NULL, `bildo` VARCHAR(64) NOT NULL ,`forigita` BOOLEAN NOT NULL DEFAULT  '0',`korektebla` BOOLEAN NOT NULL DEFAULT  '0', PRIMARY KEY (`id`)) ENGINE = InnoDB;

-- suppression des tables inutiles :
DROP TABLE eraraj_mesagxoj;
DROP TABLE demandaro;
DROP TABLE ferioj;
DROP TABLE import_arthur_email;
DROP TABLE persono_demandaro;
DROP TABLE vikio;

ALTER TABLE `personoj_lecioneroj`  ADD `poentoj` INT  NULL DEFAULT '0'  AFTER `lecionero_id`;
ALTER TABLE `respondoj` ADD `ekzercero_id` INT NULL AFTER `lecionero_id`;
ALTER TABLE `respondoj` ADD `forigita` BOOL NOT NULL DEFAULT  '0' ;

-- ajout des données pour la correction automatique
CREATE TABLE `ekzercoj` (
  `id` int(11) NOT NULL,
  `komando` text NOT NULL,
  `lecionero_id` int(11) NOT NULL,
  `komando_detalo` text,
  `ekzemplo` text,
  `typo` enum('traduko','verkado') NOT NULL,
  `x2u` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `ekzercoj`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ekzercoj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  CREATE TABLE `ekzerceroj` (
  `id` int(11) NOT NULL,
  `ekzerco_id` int(11) NOT NULL,
  `kodo` varchar(10) NOT NULL,
  `numero` int(11) NOT NULL,
  `demando` text NOT NULL,
  `respondo` text,
  `normaligita` text,
  `bildo` varchar(64) DEFAULT NULL,
  `forigita` tinyint(1) NOT NULL DEFAULT '0',
  `korektebla` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  ALTER TABLE `ekzerceroj`
  ADD PRIMARY KEY (`id`);

  ALTER TABLE `ekzerceroj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


-- ajout d'un exercice en section 8.8

UPDATE `lecioneroj` SET `ordo` = '10' WHERE `leciono_id` = 69 AND `ordo` = 9; 
UPDATE `lecioneroj` SET `ordo` = '9' WHERE `leciono_id` = 69 AND `ordo` = 8; 
UPDATE `lecioneroj` SET `ordo` = '8', `titolo` = 'Exercice 5' WHERE `leciono_id` = 69 AND `ordo` = 7; 
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '69', 'Exercice 4', 'EKZERCARO', NULL, '7', '0', '0');

--- décalage des réponses de l'exercice 4 qui devient l'exercice 5

UPDATE `respondoj` SET `kodo` = 'ekz08_30', `demando` = '30 <br>- Incitas min, ke mia edzino daŭre parolas pri sia antaŭa edzo.<br>- Tio estas nenio ! La mia paroladas pri sia estonta edzo !' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_21';
UPDATE `respondoj` SET `kodo` = 'ekz08_31', `demando` = '31 <br>En kafejo:<br>- Kial vi rigardadas al la pordo ?<br>- Mi observadas, ĉu ne iu foriras kun mia surtuto. Kun la via jam antaŭ dek minutoj foriris iu.' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_22';
UPDATE `respondoj` SET `kodo` = 'ekz08_32', `demando` = '32 <br>La junaj geedzoj havis konflikton hejme, kaj poste dum la aŭto-veturado ili ambaŭ obstine silentis. Preterpasante aron da azenoj la edzo diris moke:<br>- Ĉu parencoj de vi ?<br>- Jes, boparencoj !' WHERE `lecionero_id` = 79 AND `kodo` = 'ekz08_23';

-- ajout de la durée pour les sections
ALTER TABLE  `lecioneroj` ADD  `dauxro` INT NULL ;
update lecioneroj set dauxro='5' where id=1;
update lecioneroj set dauxro='5' where id=2;
update lecioneroj set dauxro='6' where id=3;
update lecioneroj set dauxro='10' where id=4;
update lecioneroj set dauxro='5' where id=5;
update lecioneroj set dauxro='8' where id=6;
update lecioneroj set dauxro='7' where id=219;
update lecioneroj set dauxro='11' where id=253;
update lecioneroj set dauxro='5' where id=269;
update lecioneroj set dauxro='17' where id=270;
update lecioneroj set dauxro='12' where id=254;
update lecioneroj set dauxro='4' where id=7;
update lecioneroj set dauxro='5' where id=8;
update lecioneroj set dauxro='7' where id=218;
update lecioneroj set dauxro='6' where id=9;
update lecioneroj set dauxro='7' where id=10;
update lecioneroj set dauxro='6' where id=11;
update lecioneroj set dauxro='5' where id=276;
update lecioneroj set dauxro='3' where id=12;
update lecioneroj set dauxro='5' where id=13;
update lecioneroj set dauxro='6' where id=14;
update lecioneroj set dauxro='18' where id=15;
update lecioneroj set dauxro='7' where id=16;
update lecioneroj set dauxro='7' where id=17;
update lecioneroj set dauxro='6' where id=221;
update lecioneroj set dauxro='4' where id=18;
update lecioneroj set dauxro='5' where id=19;
update lecioneroj set dauxro='7' where id=20;
update lecioneroj set dauxro='5' where id=21;
update lecioneroj set dauxro='6' where id=22;
update lecioneroj set dauxro='2' where id=23;
update lecioneroj set dauxro='7' where id=24;
update lecioneroj set dauxro='1' where id=25;
update lecioneroj set dauxro='8' where id=26;
update lecioneroj set dauxro='7' where id=27;
update lecioneroj set dauxro='13' where id=28;
update lecioneroj set dauxro='5' where id=29;
update lecioneroj set dauxro='8' where id=30;
update lecioneroj set dauxro='4' where id=274;
update lecioneroj set dauxro='8' where id=275;
update lecioneroj set dauxro='5' where id=31;
update lecioneroj set dauxro='10' where id=32;
update lecioneroj set dauxro='4' where id=33;
update lecioneroj set dauxro='6' where id=34;
update lecioneroj set dauxro='3' where id=37;
update lecioneroj set dauxro='10' where id=38;
update lecioneroj set dauxro='6' where id=277;
update lecioneroj set dauxro='5' where id=278;
update lecioneroj set dauxro='9' where id=271;
update lecioneroj set dauxro='12' where id=272;
update lecioneroj set dauxro='5' where id=39;
update lecioneroj set dauxro='10' where id=40;
update lecioneroj set dauxro='25' where id=41;
update lecioneroj set dauxro='7' where id=273;
update lecioneroj set dauxro='5' where id=42;
update lecioneroj set dauxro='7' where id=43;
update lecioneroj set dauxro='12' where id=44;
update lecioneroj set dauxro='3' where id=45;
update lecioneroj set dauxro='5' where id=46;
update lecioneroj set dauxro='1' where id=47;
update lecioneroj set dauxro='25' where id=48;
update lecioneroj set dauxro='5' where id=49;
update lecioneroj set dauxro='6' where id=50;
update lecioneroj set dauxro='4' where id=51;
update lecioneroj set dauxro='3' where id=52;
update lecioneroj set dauxro='5' where id=53;
update lecioneroj set dauxro='3' where id=54;
update lecioneroj set dauxro='8' where id=55;
update lecioneroj set dauxro='16' where id=57;
update lecioneroj set dauxro='7' where id=56;
update lecioneroj set dauxro='6' where id=58;
update lecioneroj set dauxro='17' where id=59;
update lecioneroj set dauxro='2' where id=60;
update lecioneroj set dauxro='15' where id=61;
update lecioneroj set dauxro='4' where id=62;
update lecioneroj set dauxro='4' where id=63;
update lecioneroj set dauxro='11' where id=64;
update lecioneroj set dauxro='6' where id=65;
update lecioneroj set dauxro='9' where id=66;
update lecioneroj set dauxro='5' where id=67;
update lecioneroj set dauxro='21' where id=68;
update lecioneroj set dauxro='16' where id=69;
update lecioneroj set dauxro='20' where id=70;
update lecioneroj set dauxro='7' where id=71;
update lecioneroj set dauxro='12' where id=72;
update lecioneroj set dauxro='10' where id=220;
update lecioneroj set dauxro='2' where id=279;
update lecioneroj set dauxro='5' where id=73;
update lecioneroj set dauxro='7' where id=74;
update lecioneroj set dauxro='3' where id=75;
update lecioneroj set dauxro='14' where id=280;
update lecioneroj set dauxro='28' where id=76;
update lecioneroj set dauxro='20' where id=77;
update lecioneroj set dauxro='3' where id=78;
update lecioneroj set dauxro='25' where id=79;
update lecioneroj set dauxro='4' where id=80;
update lecioneroj set dauxro='5' where id=81;
update lecioneroj set dauxro='9' where id=82;
update lecioneroj set dauxro='2' where id=83;
update lecioneroj set dauxro='6' where id=84;
update lecioneroj set dauxro='4' where id=85;
update lecioneroj set dauxro='4' where id=86;
update lecioneroj set dauxro='4' where id=87;
update lecioneroj set dauxro='5' where id=88;
update lecioneroj set dauxro='32' where id=89;
update lecioneroj set dauxro='5' where id=217;
update lecioneroj set dauxro='45' where id=90;
update lecioneroj set dauxro='5' where id=216;

-- modifs suite à la réécriture de la leçon 2 sur le COD
UPDATE lecioneroj SET titolo = 'Le complément d’objet direct', dauxro = '10' WHERE id=10


-----------------------------------------
-- Passage en V16

----------------
-- ATTENTION --
-- Pensez à exécuter les scripts suivants :
-- remplir_ekzercero_id.php en priorité et en premier
-- remplir_gxusta.php
-- remplir_normaligita.php ?
-- remplir_poentoj.php ?

-- s'assurer que le champ "gxusta" et le champ "ekzercero_id" est bien rempli dans la table respondoj

-- Faire ensuite un :  ALTER TABLE `respondoj` DROP `lecionero_id`,DROP `kodo`,DROP `komando`,DROP `demando`;


CREATE TABLE `eventoj` (
  `id` int(11) NOT NULL,
  `persono_id` int(11) NOT NULL,
  `komenco` date NOT NULL,
  `fino` date DEFAULT NULL,
  `tipo` enum('France','Europe','Ailleurs','Événements mondiaux') NOT NULL,
  `priskribo` text NOT NULL,
  `lando` varchar(100) NOT NULL,
  `departemento` int(11) DEFAULT NULL,
  `url` text NOT NULL,
  `mail` text NOT NULL,
  `forigita` int(11) DEFAULT NULL -- identifiant de la personne qui a supprimé la donnée
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `respondoj` ADD `gxusta` BOOLEAN NULL AFTER `forigita`;
ALTER TABLE `respondoj` ADD `ekzercero_id` INT NULL AFTER `lecionero_id`;
ALTER TABLE `ekzercoj` ADD `korektebla` BOOLEAN NOT NULL AFTER `x2u`;
ALTER TABLE `ekzercoj` CHANGE `typo` `typo` ENUM('traduko-1','traduko-2','traduko-3','verkado-1','verkado-2','verkado-3','verkado-4','verkado-5','verkado-6','stelo-1','stelo-2','truoj-1','truoj-2','kompletigu','ordigu','elektu') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;
ALTER TABLE `respondoj` CHANGE `lecionero_id` `lecionero_id` INT(11) NULL;
ALTER TABLE `respondoj` CHANGE `komando` `komando` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL;


insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (1,'Traduisez les phrases en espéranto.',6,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (2,'Traduisez les phrases en espéranto.',270,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (3,'Formez cinq phrases ayant un sens en combinant les mots de la leçon.',270,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (4,'A votre tour',254,'','','verkado-2',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (5,'En vous aidant des images, recopiez chaque phrase en complétant avec la préposition qui convient.',276,'Utilisez une fois chacune des prépositions suivantes : antaŭ, sur, super, sub.<br/>Le vocabulaire nouveau se trouve au bas de cette page.','','truoj-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (6,'Traduisez les phrases en espéranto.',15,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (7,'Remplacez la portion de phrase entre { } par le pronom personnel approprié.',16,'Choisissez parmi les pronoms suivants : li, ŝi, ĝi ou ili','Ex.: {La knabo} vendas kukojn. → Li vendas kukojn.','kompletigu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (8,'Formez des phrases ayant un sens en utilisant les mots donnés.',17,'Attention : vous pouvez être amené à conjuguer les verbes et à mettre des mots à l’accusatif.','','ordigu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (9,'Considérez les phrases suivantes et répondez en français aux questions :',21,'','','verkado-2',0,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (10,'Traduisez en espéranto.',26,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (11,'Traduisez les phrases en espéranto.',28,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (12,'Traduisez en espéranto en écrivant les nombres en toutes lettres.',30,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (13,'Écrivez une question pour chaque image, puis donnez la réponse à cette question.',275,'Utilisez le vocabulaire que vous avez vu dans les 3 premières leçons, ainsi que les mots interrogatifs suivants : kio, kiu, kie.<br/>Pensez à utiliser l’accusatif lorsque c’est nécessaire !','','traduko-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (14,'Transformez les phrases suivantes en questions, selon le modèle.',33,'','Exemple : Mia frato manĝis la kukon. → Ĉu mia frato manĝis la kukon?','verkado-5',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (15,'Recopiez chaque phrase en complétant avec la préposition qui convient.',278,'Chaque phrase de cet exercice correspond à une image. Recopiez chaque phrase en remplaçant [ … ] par la préposition qui convient. Vous devez utiliser seulement une fois chacune des prépositions suivantes : <b>apud</b>, <b>ĉe</b>, <b>al</b>, <b>de</b>, <b>el</b>.','','truoj-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (16,'Répondez en espéranto en faisant des phrases complètes et en écrivant les nombres en toutes lettres.<br/>N’hésitez pas à chercher sur Internet les réponses que vous ne connaissez pas !',272,'','','verkado-6',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (17,'Traduisez en français.',40,'','','traduko-2',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (18,'Traduisez les questions en espéranto (sans y répondre)',41,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (19,'Répondez maintenant en espéranto.',41,'','','verkado-6',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (20,'Transformez chaque phrase en interrogation en remplaçant le texte entre accolades par un corrélatif en <b>KI-</b>.',48,'','Exemples :<br/>Ŝi amas {min} → Kiun ŝi amas ?<br/>{Ŝi} amas min → Kiu amas min ?<br/>Li promenas kun {belaj} knabinoj → Kun kiaj knabinoj li promenas ?','verkado-5',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (21,'Traduisez en espéranto',48,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (22,'Donnez le sens des corrélatifs suivants.',53,'','','traduko-1',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (23,'Recopiez chaque phrase en complétant avec la préposition qui convient.',57,'Chaque phrase de cet exercice correspond à une image. Recopiez chaque phrase en remplaçant [ … ] par la préposition qui convient. Vous devez utiliser seulement une fois chacune des prépositions suivantes : <b>por</b>, <b>ĉe</b>, <b>malantaŭ</b>, <b>el</b>, <b>ĝis</b>, <b>per</b>, <b>dum</b>, <b>inter</b>.','','truoj-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (24,'Répondez en espéranto aux questions suivantes, selon les deux récits que vous avez lus précédemment.',59,'','','verkado-6',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (25,'Formez des phrases avec les mots suivants puis traduisez-les en français.',61,'','','verkado-6',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (26,'Remplacez la préposition des phrases suivantes par la forme n de l’accusatif.',64,'','Vi similas al via patro. → Vi similas vian patron.','verkado-5',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (27,'Recopiez le texte qui suit en remplaçant les * par la terminaison de l’accusatif ou par rien du tout selon le cas.',66,'','Ŝi* aĉetas ŝuoj* al la infanoj* → Ŝi aĉetas ŝuojn al la infanoj.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (28,'Traduisez les mots en français',70,'','','traduko-1',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (29,'Traduisez les mots en espéranto.',70,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (30,'Répondez aux questions suivantes en espéranto.',220,'','','verkado-6',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (31,'Kioma horo estas?',220,'Ecrivez quelle heure est indiquée sur chacune des images ci-dessus. Veuillez répondre en espéranto, en écrivant les nombres en toutes lettres.','Estas la sesa kaj kvarono. ou Estas la sesa kaj dek kvin.','verkado-4',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (32,'Complétez les phrases selon le modèle.',280,'','La virino, kiu legas, estas ______.<br/>→ La virino, kiu legas, estas leganta virino.<br/>La libro, kiun la virino legas, estas ______.<br/>→ La libro, kiun la virino legas, estas legata libro.','stelo-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (33,'Traduisez en espéranto en utilisant la terminaison verbale appropriée.',76,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (34,'Traduisez en français.',77,'','','traduko-2',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (35,'Complétez les phrases selon le modèle.',281,'','Maria manĝis ___ kukon. (Elle a mangé le gâteau de son frère)<br/>→ Maria manĝis lian kukon.<br/>Maria manĝis ___ kukon. (Elle a mangé son propre gâteau)<br/>→ Maria manĝis sian kukon.','stelo-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (36,'Traduisez ces textes en français.',79,'','','traduko-2',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (37,'Traduisez les articles suivants puisés dans diverses revues.',89,'','','traduko-2',0,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (38,'Mettez les mots suivants au pluriel.',90,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (39,'Donnez le féminin des noms suivants',90,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (40,'Donnez le contraire des mots suivants.',90,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (41,'Mettez les phrases suivantes à la forme interrogative (ĉu).',90,'','','verkado-5',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (42,' Traduisez les phrases suivantes en prenant soin d’appliquer la règle de l’accusatif (-n) au complément d’objet direct.',90,'','','traduko-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (43,'Recopiez les phrases en choisissant la bonne réponse parmi celles qui sont proposées (emploi de l’adjectif possessif).',90,'','','stelo-1',0,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (44,'Recopiez les phrases en choisissant le bon corrélatif.',90,'','','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (45,'Recopiez les phrases en choisissant la bonne réponse parmi celles qui sont proposées.',90,'','','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (46,'Indiquez le préfixe ou le suffixe correspondant à l’explication puis fournissez-en un exemple.',90,'','','traduko-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (47,'Thème - Traduisez.',90,'','','traduko-2',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (48,'Version - Traduisez.',90,'','','traduko-2',0,0);

-- GERDA MALAPERIS

insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (49,'Demandoj',94,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (50,'Demandoj: Formu frazojn.',94,'','{ -a al -as grand- ir- mi -o spegul- } → Mi iras al granda spegulo.<br/>{ -as -as est- kiu li mi ne sci- } → Mi ne scias, kiu li estas.','ordigu',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (51,'Modifu la frazojn.',94,'','Vi laboras malmulte → Laboru multe!','verkado-5',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (52,'Demandoj.',99,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (53,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',99,'','Turnu vin iomete, [ĉu / se] vi volas.<br/>→ Turnu vin iomete, se vi volas.<br/>Cet exercice attire votre attention sur la différence de sens entre<br/>ĉu (interrogation) et se (condition) :<br>mi ne vidas, ĉu estas io inter mi kaj vi : <br/>je ne vois pas s''il y a quelque chose entre vous et moi. (Y a-t-il quelque chose ? Je ne vois pas.)<br/>mi ne vidas, se estas io inter mi kaj vi. : <br/>s''il y a quelque chose entre moi et vous, alors je ne vois pas. (Cette chose m''empêche de voir.)','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (54,'Demandoj.',104,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (55,'Formu frazojn.',104,'','{ -as aspekt- ĉu kiel la -o -o student- ul- ? } → Ĉu la ulo aspektas kiel studento?','ordigu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (56,'Demandoj.',109,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (57,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',109,'','[Mi/Min] diris [tio/tion] al [vi/vin].<br/>→ <b>Mi</b> diris <b>tion</b> al <b>vi</b>.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (58,'Demandoj.',114,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (59,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',114,'','[Kiam/Se] li estus studento, mi lin konus.<br/>→ <b>Se</b> li estus studento, mi lin konus.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (60,'Demandoj.',119,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (61,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',119,'','[Li/Lin] metas [ĝi/ĝin] en la [poŝo/poŝon].<br/>→ <b>Li</b> metas <b>ĝin</b> en la <b>poŝon</b>.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (62,'Demandoj.',124,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (63,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',124,'','[Mi/Min] restis tie unu [semajno/semajnon].<br/>→ <b>Mi</b> restis tie unu <b>semajnon</b>.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (64,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',124,'','Ĉu Tom estas same alta [kiel/ol] Bob, aŭ ĉu li estas pli alta [kiel/ol] Bob?<br/>→ Ĉu Tom estas same alta <b>kiel</b> Bob, aŭ ĉu li estas pli alta <b>ol</b> Bob?','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (65,'Demandoj.',129,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (66,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',129,'','','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (67,'Elektu la ĝustan vorton kaj skribu la tutan frazon.',129,'','Vi parolu pri [vi/si].<br/>→ Vi parolu pri <b>vi</b>.','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (68,'Elektu la ĝustan pronomon, kompletigu ĝin kaj skribu la tutan frazon.',129,'','Mi konas [mi* / si*] vizaĝon. → Mi konas <b>mian</b> vizaĝon.<br/>Atente rigardu la tutan ekzercon unue!','stelo-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (69,'Demandoj.',134,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (70,'Kompletigu la frazon per la ĝusta demandovorto.',134,'La demandovortoj jam lernitaj estas: kio, kion, kiu, kiun, kiel, kiam, kial, kie, kien, ĉu.',' ______ vi iras? - Mi iras al la urbo. <br/>→ <b>Kien</b> vi iras? - Mi iras al la urbo.','stelo-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (71,'Demandoj.',139,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (72,'Kopiu la frazojn kaj anstataŭigu la stelon per la ĝusta vorto aŭ vortero.',139,'','Tom [*] Linda estas student[*]. → Tom <b>kaj</b> Linda estas student<b>oj</b>.','stelo-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (73,'Demandoj.',144,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (74,'Plenigu per la ĝusta formo: <b>iĝ</b> aŭ <b>ig</b> kaj skribu la tutan frazon.',144,'','Tio facil____as la laboron. La laboro facil____as.<br/>→ Tio facil<b>ig</b>as la laboron. La laboro facil<b>iĝ</b>as.','stelo-2',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (75,'Demandoj.',149,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (76,'Forigu la vortojn kun {}.',149,'','Marko ŝatas {la} aŭton {de Marko}. → Marko ŝatas sian aŭton.<br/>{Petro} ŝatas {la} aŭton {de Ivano}. → <b>Li</b> ŝatas <b>lian</b> aŭton.','kompletigu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (77,'Demandoj.',154,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (78,'Trovu la vortojn.',154,'La vortoj estas:<br/>agi, alia, ami, angulo, aspekti, blondo, demandi, direkti, dum, grava, iri, kara, knabo, mano, mistera, montri, nun, permesi, peti, prava, preferi, serioza, saluti, spiono, stari, stranga, studento, tago, universitato, vizaĝo','faradi → faradi : agi','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (79,'Demandoj.',159,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (80,'Trovu la vortojn.',159,'La vortoj estas:<br/>absurda, aĵo, deziri, drogo, eta, evidenta, fakto, fora, ideo, imagi, instrui, kaŝi, kiam, komuniki, koni, konsenti, lerni, mesaĝo, nomo, paro, peco, plena, promeni, pulvoro, respondi, sekreto, subita, super, ŝajni, temo','parto → parto : peco','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (81,'Demandoj.',164,'','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (82,'Trovu la vortojn.',164,'La vortoj estas:<br/>ambaŭ, aŭto, aŭtomato, baldaŭ, bruo, ĉambro, diskuti, dormi, ekster, el, flegi, helpi, informi, kapo, konscia, kuraci, nokto, observi, opinio, perdi, piedo, resti, risko, ruĝa, sama, sekvi, semajno, vespero, vivi, voki','ne alia → ne alia : sama','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (83,'Demandoj.',169,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (84,'Metu la ĝustan vorton.',169,'Ĉiu mankanta vorto estas unu el: kiel, kia, kian, kiaj, kiajn.','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (85,'Demandoj.',174,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (86,'Enmetu unu el tiuj vortoj en ĉiun lokon.',174,'Nun vi scias kvar vortojn, kiuj aspektas simile: per, por, pri, pro.<br/><b>per</b> montras <b>ilon</b>: Mi venis per aŭto.<br/><b>por</b> montras <b>celon</b>: Mi aĉetis kafon por vi (por trinki). (celo = tio, kion oni volas havi aŭ fari.)<br/><b>pri</b> montras <b>temon</b>: Mi parolis/lernis pri historio.<br/><b>pro</b> montras <b>kialon</b>: Ŝi ŝatas lin pro liaj blondaj haroj.','','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (87,'Anstataŭigu la vortojn inter "{}" per la ĝusta pronomo.',174,'Forigu la vortojn kun "{}"!','{Tom} scias, ke {Linda} rigardas al {Tom}.<br/>→ Li scias, ke <b>ŝi</b> rigardas al <b>li</b>.','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (88,'Demandoj.',179,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (89,'Trovu la vortojn.',179,'La vortoj estas:<br/>amiko, aventuro, bani, bluo, danĝero, danki, ege, epoko, facila, fuŝi, homo, kial, kie, klaso, kompati, kredi, mezo, minuto, okulo, rondo, sana, sen, silenti, sveni, ŝati, tradicio, unua, urĝa, vorto, zorgi','centro → centro : mezo','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (90,'Demandoj.',184,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (91,'Trovu la vortojn.',184,'La vortoj estas:<br/>aĉeti, afabla, akcepti, apud, aranĝi, ĉiam, dolori, fermi, fini, funkcii, glaso, ĝemi, ĝeni, heziti, klara, kontenta, larĝa, maniero, manki, miksi, miri, morti, objekto, oportuna, ordo, panei, plezuro, polico, porti, ricevi, ripari, ripeti, saĝa, seĝo, seka, soifi, sufiĉa, tia, trinki, veturi','speco de agado → speco de agado : maniero','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (92,'Demandoj.',189,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (93,'Trovu la vortojn.',189,'La vortoj estas:</br>bedaŭri, brako, daŭri, esperi, feliĉa, fenestro, forgesi, ĝentila, ĝoji, horo, ie, iam, infano, interesi, kanti, komenci, koncerni, kovri, krii, kuri, kuraĝa, kutimi, laca, laŭta, libera, lito, ludi, marŝi, momento, monto, movi, nacio, nenie, patro, perfekta, persono, pezi, plendi, plori, preciza, proponi, pura, rajti, rakonti, ridi, rimarki, roko, simili, situacio, soni, stulta, ŝlosi, veki, voĉo, vojo','senti vivan plezuron → <b>ĝoji</b>','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (94,'Demandoj.',194,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (95,'Trovu la vortojn.',194,'La vortoj estas:<br/>bruna, dekstra, dolĉa, flanko, fojo, flugi, frua, gratuli, grupo, hieraŭ, ĵus, kelnero, koloro, kuko, mateno, meblo, milito, muziko, nazo, noto, okazi, pano, papero, plafono, plano, plata, poŝto, raporti, reala, rompi, soldato, speco, sporto, strato, supo, ŝanco, tasko, telero, vendi, vesti','kunligita aro → kunligita aro : <b>grupo</b>','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (96,'Demandoj.',199,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (97,'Trovu la vortojn.',199,'La vortoj estas:<br/>aparato, aperi, bezoni, dokumento, edzo, elporti, filo, frato, gardi, hejmo, historio, horloĝo, ĵeti, kapti, konduki, kontroli, lasta, legi, letero, mono, motivo, obei, obstina, pasi, plaĉi, preni, preskaŭ, problemo, promesi, riĉa, sata, serĉi, skribi, solvi, suferi, ŝanĝi, ŝteli, teruro, tipo, uzi','ekpreni kaj firme teni → ekpreni kaj firme teni : <b>kapti</b>','elektu',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (98,'Demandoj.',204,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (99,'Transformu la frazojn uzante participon.',204,'','Mi serĉas monujon, kiun mi perdis. → Mi serĉas <b>perditan<b/> monujon.','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (100,'Demandoj.',209,'','','verkado-1',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (101,'Forigu la vortojn skribitajn grandlitere, uzante participon.',209,'','ĈAR la studentoj LIN OBSERVIS, li ne kuraĝis foriri.<br/>→ Observate de la studentoj li ne kuraĝis foriri.','verkado-1',1,1);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (102,'',214,'KARA KAJ ESTIMATA LEGINTO,<br/>Vi legis ĉi tiun aventuron ĝis la fino. Sendube vi estas kontenta, ke ĉio finiĝis bone. Sed ĉu vi rimarkis, ke en la rakonto grava kontraŭdiro troviĝas? Alivorte, en unu loko la aŭtoro diras ion, kaj en alia li diras la kontraŭon. Vi ne rimarkis, ĉu vere?  Bedaŭrinde! Nun vi devos relegi la tutan tekston por trovi, pri kio temas. Legu atente, kaj se post unu legado vi ne trovis, relegu duan fojon, trian fojon, ktp. Certe vi fine trovos. Kaj se ne, nu, la vortoj kaj esprimmanieroj de Esperanto pli bone metiĝos en vian kapeton…                        ','','verkado-2',1,0);
insert into ekzercoj(id,komando,lecionero_id,komando_detalo,ekzemplo,typo,x2u,korektebla) values (103,'Respondu libere',214,'Ĉar tiu ĉi estas la lasta ĉapitro de la GERDA-kurso, ne estas demandoj pri la teksto, kaj ne estas ekzercoj. En ilia loko estas demandoj pri la tuta kurso, pri via opinio pri la kurso. Mi esperas, ke vi zorge respondos ilin, ĉar viaj respondoj helpos nin plibonigi la kurson.<br/>Respondu per multegaj vortoj!','','verkado-1',1,0);


-- Question de DLEK	

insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (1,1,'ekz01_01',1,'Le thé est chaud.','La teo estas varma.','la teo estas varma','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (2,1,'ekz01_02',2,'Ton biscuit est sec.','Via biskvito estas seka.','via biskvito estas seka','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (3,1,'ekz01_03',3,'Votre ami était beau.','Via amiko estis bela.','via amiko estis bela','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (4,1,'ekz01_04',4,'Les nouveaux instituteurs seront grands.','La novaj instruistoj estos grandaj.','la novaj instruistoj estos grandaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (5,1,'ekz01_05',5,'Mon frère est leur instituteur.','Mia frato estas ilia instruisto.','mia frato estas ilia instruisto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (6,1,'ekz01_06',6,'Vos fils seront ses amis (à lui).','Viaj filoj estos liaj amikoj.','viaj filoj estos liaj amikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (7,2,'ekz01_07',7,'Quels gâteaux étaient secs ?','Kiuj kukoj estis sekaj?','kiuj kukoj estis sekaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (8,2,'ekz01_08',8,'Où est le pain ?','Kie estas la pano?','kie estas la pano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (9,2,'ekz01_09',9,'Un garçon en bonne santé est toujours beau.','Sana knabo estas ĉiam bela.','sana knabo estas cxiam bela|sana knabo cxiam estas bela','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (10,2,'ekz01_10',10,'Elle habitera dans une grande ville.','Ŝi loĝos en granda urbo.','sxi logxos en granda urbo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (11,2,'ekz01_11',11,'Le pain est à toi (« le pain est tien »).','La pano estas via.','la pano estas via','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (12,2,'ekz01_12',12,'Qui est le nouvel instituteur ?','Kiu estas la nova instruisto?','kiu estas la nova instruisto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (13,2,'ekz01_13',13,'Voici des biscuits. Lesquels sont bons ?','Jen biskvitoj. Kiuj estas bonaj?','jen biskvitoj kiuj estas bonaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (14,3,'ekz01_14',14,'Formez une phrase ayant un sens en combinant les mots de la leçon.','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (15,3,'ekz01_15',15,'Formez une phrase ayant un sens en combinant les mots de la leçon.','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (16,3,'ekz01_16',16,'Formez une phrase ayant un sens en combinant les mots de la leçon.','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (17,3,'ekz01_17',17,'Formez une phrase ayant un sens en combinant les mots de la leçon.','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (18,3,'ekz01_18',18,'Formez une phrase ayant un sens en combinant les mots de la leçon.','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (19,4,'ekz01_19',19,'Je me présente','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (20,5,'ekz02_01',1,'La birdo flugas ... la akvo.','La birdo flugas <b>super</b> la akvo.','la birdo flugas super la akvo|super','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (21,5,'ekz02_02',2,'La bicikloj estas ... la domo.','La bicikloj estas <b>antaŭ</b> la domo.','la bicikloj estas antaux la domo|antaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (22,5,'ekz02_03',3,'Ili promenas ... la pluvo.','Ili promenas <b>sub</b> la pluvo.','ili promenas sub la pluvo|sub','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (23,5,'ekz02_04',4,'La libroj estas ... la tablo.','La libroj estas <b>sur</b> la tablo.','la libroj estas sur la tablo|sur','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (24,6,'ekz02_05',5,'Un garçon en bonne santé boit du lait chaud.','Sana knabo trinkas varman lakton.','sana knabo trinkas varman lakton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (25,6,'ekz02_06',6,'La nouvelle boutique vend des gâteaux secs.','La nova butiko vendas sekajn kukojn.','la nova butiko vendas sekajn kukojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (26,6,'ekz02_07',7,'Le grand instituteur a rencontré les nouveaux amis.','La granda instruisto renkontis la novajn amikojn.','la granda instruisto renkontis la novajn amikojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (27,6,'ekz02_08',8,'Les bons amis feront toujours un beau gâteau.','La bonaj amikoj faros ĉiam bonan kukon.','la bonaj amikoj faros cxiam bonan kukon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (28,6,'ekz02_09',9,'La petite fille a rencontré les sœurs laides.','La malgranda knabino renkontis la malbelajn fratinojn.','la malgranda knabino renkontis la malbelajn fratinojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (29,6,'ekz02_10',10,'Le frère bien portant avait une petite sœur malade.','La sana frato havis malsanan fratinon.','la sana frato havis malsanan fratinon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (30,6,'ekz02_11',11,'Personne ne lavera les petites tasses.','Neniu lavos la malgrandajn tasojn.','neniu lavos la malgrandajn tasojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (31,6,'ekz02_12',12,'Le bel oiseau attrapa un petit insecte.','La bela birdo kaptis malgrandan insekton.','la bela birdo kaptis malgrandan insekton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (32,6,'ekz02_13',13,'La nouvelle boutique a vendu de la mauvaise limonade.','La nova butiko vendis malbonan limonadon.','la nova butiko vendis malbonan limonadon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (33,6,'ekz02_14',14,'De l’eau froide ne lave pas ("ne lavas") un petit garçon.','Malvarma akvo ne lavas malgrandan knabon.','malvarma akvo ne lavas malgrandan knabon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (34,7,'ekz02_15',15,'{La kuko} estas bela.','<b>Ĝi</b> estas bela.','gxi estas bela','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (35,7,'ekz02_16',16,'{Mia amikino} estas bela.','<b>Ŝi</b> estas bela.','sxi estas bela','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (36,7,'ekz02_17',17,'{La bela birdo} ĉiam trinkas akvon.','<b>Ĝi</b> ĉiam trinkas akvon.','gxi cxiam trinkas akvon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (37,7,'ekz02_18',18,'{La butikoj} estas malpuraj.','<b>Ili</b> estas malpuraj.','ili estas malpuraj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (38,7,'ekz02_19',19,'{La akvo} estas varma.','<b>Ĝi</b> estas varma.','gxi estas varma','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (39,7,'ekz02_20',20,'{Mia frato} neniam lavas la tasojn.','<b>Li</b> neniam lavas la tasojn.','li neniam lavas la tasojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (40,7,'ekz02_21',21,'{La viro} havas novan amikon.','<b>Li</b> havas novan amikon.','li havas novan amikon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (41,7,'ekz02_22',22,'{Miaj fratoj} kaptis malsanan birdon.','<b>Ili</b> kaptis malsanan birdon.','ili kaptis malsanan birdon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (42,7,'ekz02_23',23,'{La virino} ne sukeris mian teon.','<b>Ŝi</b> ne sukeris mian teon.','sxi ne sukeris mian teon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (43,8,'ekz02_24',24,'amikino - la - malvarma - mia - sukeri - teo.','Mia amikino sukeras la malvarman teon.','mia amikino sukeras la malvarman teon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (44,8,'ekz02_25',25,'akvo - bela - birdo - la - pura - trinki.','La bela birdo trinkas puran akvon.','la bela birdo trinkas puran akvon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (45,8,'ekz02_26',26,'amiko - bona - limonado - vendi - via.','Via amiko vendas bonan limonadon.','via amiko vendas bonan limonadon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (46,8,'ekz02_27',27,'forgesi - mi - papero - porti.','Mi forgesis porti paperon.','mi forgesis porti paperon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (47,8,'ekz02_28',28,'bela - esti - fratino - knabino - mia.','Mia fratino estas bela knabino.','mia fratino estas bela knabino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (48,9,'ekz03_01',1,'Mian fraton lavis mia patrino.<br/>* Qui a été lavé ?<br/>* Qui a lavé ?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (49,9,'ekz03_02',2,'Instruistojn viajn fratinoj niaj vidis.<br/>* Qui a vu ?<br/>* Qui a été vu ?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (50,10,'ekz03_03',3,'Mon frère se promènera le matin. (adv.: «matinalement»)','Mia frato matene promenas.','mia frato matene promenas|mia frato promenas matene','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (51,10,'ekz03_04',4,'Son ami a répondu chaleureusement. (adv.: dérivé de «chaud»)','Lia amiko varme respondis.','lia amiko respondis varme|lia amiko varme respondis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (52,10,'ekz03_05',5,'La plume marron écrit bien. (adv.: dérivé de «bon»)','La bruna plumo bone skribas.','la bruna plumo bone skribas|la bruna plumo skribas bone|la plumo bruna bone skribas|la plumo bruna skribas bone ','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (53,10,'ekz03_06',6,'La belle fille court mal. (adv.: contraire de «bien»)','La bela knabino malbone kuras.','la bela knabino malbone kuras|la bela knabino kuras malbone|la bela filino malbone kuras|la bela filino kuras malbone','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (54,10,'ekz03_07',7,'Notre père fume le soir. (adv.: dérivé de «soir»)','Nia patro vespere fumas.','nia patro vespere fumas|nia patro fumas vespere','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (55,11,'ekz03_08',8,'Il l''aime. (la personne aimée est une femme)','Li amas ŝin.','li amas sxin|li sxin amas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (56,11,'ekz03_09',9,'Il aime sa sœur. (il s’agit de la sœur de sa femme)','Li amas ŝian fratinon.','li amas sxian fratinon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (57,11,'ekz03_10',10,'Elle l''aime. (la personne aimée est un homme)','ŝi amas lin.','sxi amas lin|sxi lin amas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (58,11,'ekz03_11',11,'Le premier homme aime la deuxième femme.','La unua viro amas la duan virinon.','la unua viro amas la duan virinon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (59,11,'ekz03_12',12,'La seconde femme déteste le premier homme.','La dua virino malamas la unuan viron.','la dua virino malamas la unuan viron','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (60,11,'ekz03_13',13,'Les garçons ont demandé en premier trois gâteaux.','La knaboj petis unue tri kukojn.','la knaboj petis unue tri kukojn|la knaboj unue petis tri kukojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (61,11,'ekz03_14',14,'Deuxièmement, ils ont demandé de la limonade.','Due ili petis limonadon.','due ili petis limonadon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (62,11,'ekz03_15',15,'La boutique fait mal le pain brun.','La butiko malbone faras la brunan panon.','la butiko malbone faras la brunan panon|la butiko faras malbone la brunan panon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (63,12,'ekz03_16',16,'Soixante minutes font une heure. (utiliser le verbe esti)','Sesdek minutoj estas unu horo.','sesdek minutoj estas unu horo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (64,12,'ekz03_17',17,'Seize heures font un jour ; huit heures font une nuit.','Dek ses horoj estas unu tago ; ok horoj estas unu nokto.','dek ses horoj estas unu tago ; ok horoj estas unu nokto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (65,12,'ekz03_18',18,'Sept jours font une semaine.','Sep tagoj estas unu semajno.','sep tagoj estas unu semajno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (66,12,'ekz03_19',19,'Le troisième garçon est mon second fils.','La tria knabo estas mia dua filo.','la tria knabo estas mia dua filo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (67,12,'ekz03_20',20,'Combien as-tu de biscuits ? J’en ai 999.','Kiom da biskvitoj vi havas? Mi havas naŭcent naŭdek naŭ.','kiom da biskvitoj vi havas mi havas nauxcent nauxdek naux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (68,13,'ekz03_21',21,'image 2.','Kie estas Varsovio? Varsovio estas en Pollando.','kie estas varsovio varsovio estas en pollando','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (69,13,'ekz03_22',22,'image 3. (FOTI = photographier)','Kion vi fotas? Mi fotas insekton.','kion vi fotas mi fotas insekton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (70,13,'ekz03_23',23,'image 4.','Kiu estas la viro? Li estas Ludwik Zamenhof.','kiu estas la viro li estas ludwik zamenhof|kiu estas la viro la viro estas ludwik lejzer zamenhof|kiu estas la viro la viro estas Zamenhof','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (71,14,'ekz04_01',1,'Lia patrino faras panon.','Ĉu lia patrino faras panon?','cxu lia patrino faras panon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (72,14,'ekz04_02',2,'Mia filo forgesis la teon.','Ĉu mia filo forgesis la teon?','cxu mia filo forgesis la teon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (73,14,'ekz04_03',3,'La tago estas griza.','Ĉu la tago estas griza?','cxu la tago estas griza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (74,15,'ekz04_04',4,'La infanoj iras [ … ] la lernejo.','La infanoj iras <b>al</b> la lernejo.','la infanoj iras al la lernejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (75,15,'ekz04_05',5,'Mia skribotablo (= bureau) estas [ … ] la fenestro.','Mia skribotablo estas <b>apud</b> la fenestro.','mia skribotablo estas apud la fenestro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (76,15,'ekz04_06',6,'Mi aĉetos insektojn [ … ] ĉokolado.','Mi aĉetos insektojn <b>el</b> ĉokolado.','mi acxetos insektojn el cxokolado','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (77,15,'ekz04_07',7,'Estas paperoj [ … ] la muro.','Estas paperoj <b>ĉe</b> la muro.','estas paperoj cxe la muro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (78,16,'ekz04_08',8,'Kiom da tagoj estas en unu jaro?','En unu jaro estas tricent sesdek kvin tagoj.','en unu jaro estas tricent sesdek kvin tagoj|estas tricent sesdek kvin tagoj en unu jaro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (79,16,'ekz04_09',9,'Hodiaŭ estas ĵaŭdo la 30-a de novembro. Kiu dato estos morgaŭ?','Morgaŭ estos vendredo la unua de decembro.','morgaux estos vendredo la unua de decembro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (80,16,'ekz04_10',10,'Kiam estas la Nacia Tago en via lando? (NACIA = national-e)','En mia lando, la Nacia Tago estas la dekkvara de Julio.','en mia lando la nacia tago estas la dekkvara de julio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (81,16,'ekz04_11',11,'En kiu jaro aperis (APERI = paraître) la Unua Libro de Esperanto?','La unua libro de Esperanto aperis en mil okcent okdek sep.','la unua libro de esperanto aperis en mil okcent okdek sep','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (82,17,'ekz04_12',12,'Simeono estas la edzo de Fatima. Li amas ŝin. Li, la edzino kaj la infanoj loĝas en Eŭropo, en granda domo.','Simeono est le mari de Fatima. Il l''aime. Lui, la femme et les enfants habitent en Europe, dans une grande maison.','simeono est le mari de fatima il l''aime lui la femme et les enfants habitent en europe dans une grande maison','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (83,17,'ekz04_13',13,'Fatima deziras aĉeti novajn ŝuojn al la infanoj.','Fatima désire acheter de nouvelles chaussures aux enfants.','fatima désire acheter de nouvelles chaussures aux enfants','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (84,17,'ekz04_14',14,'Petro, la filo de Fatima, kolektas poŝtmarkojn kaj bildojn el ĵurnaloj. Maria, lia fratino, promenas bicikle.','Petro, le fils de Fatima, collectionne des timbres et des photos de journaux. Maria, sa soeur, se promène à bicyclette.','petro le fils de fatima collectionne des timbres et des photos de journaux maria sa soeur se promène à bicyclette','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (85,17,'ekz04_15',15,'La infanoj kuras al la lernejo, kaj en la lernejo ili skribos la novan lecionon.','Les enfants courent à l''école et à l''école ils écriront la nouvelle leçon.','les enfants courent à l''ecole et à l''ecole ils écriront la nouvelle leçon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (86,17,'ekz04_16',16,'Simeono atendas en la butiko. Li jam havas du ovojn, sed li deziras aĉeti sandviĉon. Li manĝos ilin vespere.','Simeono attend dans la boutique. Il a déjà deux oeufs mais il souhaite acheter un sandwich. Il les mangera ce soir.','simeono attend dans la boutique il a deja deux oeufs mais il souhaite acheter un sandwich il les mangera ce soir','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (87,18,'ekz04_17',17,'Est-ce que ton père collectionne les timbres de mon pays ?','Ĉu via patro kolektas poŝtmarkojn de mia lando?','cxu via patro kolektas posxtmarkojn de mia lando','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (88,18,'ekz04_18',18,'Est-ce que son fils a oublié le thé et le lait ?','Ĉu lia filo forgesis la teon kaj la lakton?','cxu lia filo forgesis la teon kaj la lakton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (89,18,'ekz04_19',19,'A-t-il oublié de porter du pain à la sœur de Petro ?','Ĉu li forgesis porti panon al la fratino de Petro?','cxu li forgesis porti panon al la fratino de petro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (90,18,'ekz04_20',20,'Est-ce que les enfants vont danser dans l’école ?','Ĉu la infanoj dancos en la lernejo?','cxu la infanoj dancos en la lernejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (91,18,'ekz04_21',21,'Est-ce qu’un garçon en bonne santé boit du lait ?','Ĉu sana knabo trinkas lakton?','cxu sana knabo trinkas lakton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (92,18,'ekz04_22',22,'Est-ce que le père lavera les petites tasses dans la maison de Fatima ?','Ĉu la patro lavos la malgrandajn tasojn en la domo de Fatima?','cxu la patro lavos la malgrandajn tasojn en la domo de fatima','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (93,18,'ekz04_23',23,'Est-ce que la nouvelle institutrice a oublié le livre dans une pièce de l’école ?','Ĉu la nova instruistino forgesis la libron en ĉambro de la lernejo ?','cxu la nova instruistino forgesis la libron en cxambro de la lernejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (94,18,'ekz04_24',24,'Vendent-ils du thé et du café dans la nouvelle boutique ?','Ĉu ili vendas teon kaj kafon en la nova butiko ?','cxu ili vendas teon kaj kafon en la nova butiko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (95,18,'ekz04_25',25,'Est-ce que le frère de la fille malade écrivait mal ?','Ĉu la frato de la malsana knabino skribis malbone ?','cxu la frato de la malsana knabino skribis malbone|cxu la frato de la malsana knabino malbone skribis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (96,18,'ekz04_26',26,'Sont-ils de bons amis ?','Ĉu ili estas bonaj amikoj ?','cxu ili estas bonaj amikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (97,18,'ekz04_27',27,'Ta mère vient-elle d’Europe ?','Ĉu via patrino venas de Eŭropo ?','cxu via patrino venas de euxropo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (98,19,'ekz04_28',28,'Est-ce que le lait est froid ?','Jes, la lakto estas malvarma','jes la lakto estas malvarma','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (99,19,'ekz04_29',29,'Avez-vous goûté le gâteau ?','Jes mi gustumis la kukon ?','jes mi gustumis la kukon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (100,19,'ekz04_30',30,'Est-ce que sa femme est la mère de ton amie ?','Jes lia edzino estas la patrino de via amikino ?','jes lia edzino estas la patrino de via amikino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (101,19,'ekz04_31',31,'Avez-vous deux euros et trente centimes (euro = eŭro, centime = cendo) ?','Jes mi havas du eŭrojn kaj tridek cendojn ?','jes mi havas du euxrojn kaj tridek cendojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (102,19,'ekz04_32',32,'Avez-vous vu la nouvelle pièce de théâtre ?','Jes mi vidis la novan teatraĵon ?','jes li vidis la novan teatrajxon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (103,20,'ekz05_01',1,'{Simeono kaj Fatima} estas miaj amikoj.','Kiuj estas miaj amikoj ?','kiuj estas miaj amikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (104,20,'ekz05_02',2,'Simeono kaj Fatima estas {miaj amikoj}.','Kiuj estas Simeono kaj Fatima ?','kiuj estas Simeono kaj Fatima','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (105,20,'ekz05_03',3,'Ili loĝas {en Eŭropo}.','Kie ili loĝas ?','kie ili logxas|kie logxas ili','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (106,20,'ekz05_04',4,'Simeono manĝos {la du ovojn} vespere.','Kion manĝos Simeono vespere ?','kion mangxos simeono vespere','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (107,20,'ekz05_05',5,'Simeono manĝos la du ovojn {vespere}.','Kiam Simeono manĝos la du ovojn ?','kiam simeono mangxos la du ovojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (108,20,'ekz05_06',6,'Esperanto estas {facila} lingvo.','Kia lingvo estas Esperanto ?','kia lingvo estas esperanto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (109,20,'ekz05_07',7,'Maria promenas {bicikle}.','Kiel promenas Maria ?','kiel promenas maria','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (110,20,'ekz05_08',8,'Petro aĉetos {tiun} bildon.','Kiun bildon aĉetos Petro ?','kiun bildon acxetos petro|kiun bildon petro acxetos','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (111,20,'ekz05_09',9,'Esperanto estas {tre} facila.','Kiel facila estas Esperanto ?','kiel facila estas esperanto|kiel facila esperanto estas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (112,20,'ekz05_10',10,'Mi trinkas teon kun {Fatima}.','Kun kiu mi trinkas teon ?','kun kiu mi trinkas teon|kiu trinkas teon kun mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (113,21,'ekz05_11',11,'Qu’est-ce que c’est ? (Quelle-chose est cette-chose ?)','Kio estas tio ?','kio estas tio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (114,21,'ekz05_12',12,'Où est ma tasse ?','Kie estas mia taso ?','kie estas mia taso','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (115,21,'ekz05_13',13,'Quel livre est le mien ?','Kiu libro estas mia ?','kiu libro estas mia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (116,21,'ekz05_14',14,'Qui a mangé mon gâteau ?','Kiu manĝis mian kukon ?','kiu mangxis mian kukon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (117,21,'ekz05_15',15,'Quand mangerez-vous ?','Kiam vi manĝos ?','kiam mangxos vi|kiam vi mangxos','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (118,21,'ekz05_16',16,'Tout est mouillé. (mouillé: contraire de SEKA)','Ĉio estas malseka','cxio estas malseka','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (119,21,'ekz05_17',17,'J’ai tout oublié.','Mi ĉion forgesis|Mi forgesis ĉion','mi cxion forgesis|mi forgesis cxion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (120,21,'ekz05_18',18,'Mon crayon (krajono) est quelque part.','Mia krajono estas ie','mia krajono estas ie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (121,21,'ekz05_19',19,'À ce moment, il était en bonne santé.','Tiam, li estis sana','tiam li estis sana','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (122,21,'ekz05_20',20,'Combien êtes-vous ?','Kiom vi estas ?','kiom vi estas|kiom estas vi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (123,21,'ekz05_21',21,'Comment court-elle ?','Kiel ŝi kuras ?','kiel sxi kuras|kiel kuras sxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (124,21,'ekz05_22',22,'Qu’écrivez-vous ? (Quelle chose écrivez-vous ?)','Kion vi skribas ?','kion vi skribas|kion skribas vi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (125,21,'ekz05_23',23,'Je ne suis l’épouse de personne.','Mi estas nenies edzino','mi estas nenies edzino|mi estas la edzino de neniu','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (126,21,'ekz05_24',24,'Qui sont-ils ?','Kiuj ili estas ?','kiuj ili estas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (127,22,'ekz06_01',1,'kio','Quoi','quoi|que|','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (128,22,'ekz06_02',2,'kia','Quelle sorte de','quelle sorte de|quelle espèce de|quel genre de','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (129,22,'ekz06_03',3,'ĉial','Pour toute raison','pour toute raison|pour toute cause|pour tout motif|pour toutes les raisons','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (130,22,'ekz06_04',4,'ĉiel','De toute manière','de toute manière|de toute façon|de toutes les manières','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (131,22,'ekz06_05',5,'tie','Ce lieu','ce lieu|cet endroit|là-bas|là|ici','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (132,22,'ekz06_06',6,'neniu','Aucun','aucun(e)|personne','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (133,22,'ekz06_07',7,'nenies','De personne','de personne','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (134,22,'ekz06_08',8,'iu','Un certain','un certain|une certaine|','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (135,23,'ekz06_09',9,'[ … ] la vojaĝo, ni manĝis.','<b>Dum</b> la vojaĝo, ni manĝis.','dum la vojagxo ni mangxis|dum','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (136,23,'ekz06_10',10,'En nia ĝardeno, estas hotelo [ … ] insektoj.','En nia ĝardeno, estas hotelo <b>por</b> insektoj.','en nia gxardeno estas hotelo por insekto|por','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (137,23,'ekz06_11',11,'Ni konstruis kastelon [ … ] sablo.','Ni konstruis kastelon <b>el</b> sablo.','ni konstruis kastelon el sablo|el','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (138,23,'ekz06_12',12,'La kato estas [ … ] la pordo.','La kato estas <b>ĉe</b> la pordo.','la kato estas cxe la pordo|cxe','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (139,23,'ekz06_13',13,'Li grimpis [ … ] la pinto (=le sommet).','Li grimpis <b>ĝis</b> la pinto.','li grimpis gxis la pinto|gxis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (140,23,'ekz06_14',14,'Ŝi portas ĉapelon [ … ] la dorso.','Ŝi portas ĉapelon <b>ĉe</b> la dorso.','sxi portas cxapelon cxe la dorso|cxe','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (141,23,'ekz06_15',15,'La floroj kreskas (kreski=pousser) [ … ] la rokoj.','La floroj kreskas <b>inter</b> la rokoj.','la floroj kreskas inter la rokoj|inter','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (142,23,'ekz06_16',16,'Mi lernas Esperanton [ … ] tiuj libroj.','Mi lernas Esperanton <b>per</b> tiuj libroj.','mi lernas Esperanton per tiuj libroj|per','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (143,24,'ekz06_17',17,'En kia klubo vi estas membro?','Mi estas membro de junulara esperantista klubo','mi estas membro de junulara esperantista klubo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (144,24,'ekz06_18',18,'Kie okazis la kongreso, en kiu vi partoprenis? Ĉu en Granby?','Mi partoprenis en la Esperanto-kongreso, kiu okazis en Montrealo.','mi partoprenis en la esperanto kongreso kiu okazis en montrealo|ni partoprenis en la esperanto kongreso kiu okazis en montrealo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (145,24,'ekz06_19',19,'Kiajn amikojn vi vizitis en Montrealo?','Ni vizitis esperantistajn amikojn.','ni vizitis esperantistajn amikojn|mi vizitis esperantistajn amikojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (146,24,'ekz06_20',20,'Kion vi manĝis por la tagmanĝo?','Por la tagmanĝo ni manĝis sandviĉojn.','por la tagmangxo ni mangxis sandvicxojn|por la tagmangxo mi mangxis sandvicxojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (147,24,'ekz06_21',21,'Kion vi vizitis en Granby?','Mi vizitis la zoon.','mi vizitis la zoon|ni vizitis la zoon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (148,24,'ekz06_22',22,'Kio plaĉis al via frato?','Al mia frato tre plaĉis la ursoj apud la enirejo.','al mia frato tre placxis la ursoj apud la enirejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (149,24,'ekz06_23',23,'Kie estis la blanka urso?','La blanka urso el la Arkto estis ofte en la akvo.','la blanka urso el la arkto estis ofte en la akvo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (150,24,'ekz06_24',24,'Kiajn ursojn vi vidis en la zoo?','Mi vidis brunajn kaj blankajn kaj nigrajn ursojn.','mi vidis brunajn kaj blankajn kaj nigrajn ursojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (151,24,'ekz06_25',25,'Per kio vi veturis al la Zoologia Ĝardeno?','Mi veturis per aŭto al la zoologia ĝardeno.','mi veturis per auxto al la zoologia gxardeno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (152,24,'ekz06_26',26,'Kiuj bestoj estis por vi tre interesaj?','Por mi la grandaj simioj estis tre interesaj.','por mi la grandaj simioj estis tre interesaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (153,25,'ekz06_27',27,'bestoj - en - estas - interesaj - multaj - tiu - zoo.','Multaj bestoj estas interesaj en tiu zoo. Beaucoup d''animaux sont interessants dans ce zoo.','multaj bestoj estas interesaj en tiu zoo beaucoup d''animaux sont intéressants dans ce zoo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (154,25,'ekz06_28',28,'antaŭ - ĉiu - dum - estos - infanoj - kaĝo. - la - tagmanĝo','Dum ĉiu tagmanĝo infanoj estos antaŭ la kaĝo. Pendant chaque déjeuner les enfants seront devant la cage.','dum cxiu tagmangxo infanoj estos antaux la kagxo pendant chaque déjeuner les enfants seront devant la cage|dum la tagmangxo estos infanoj antaux cxiu kagxo pendant le déjeuner il y aura des enfants devant chaque cage','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (155,25,'ekz06_29',29,'apud - ĉu - enirejo ? - estis - kaĝoj - la - multaj','Ĉu multaj kaĝoj estis apud la enirejo? Est ce que beaucoup de cages étaient près de l''entrée?','cxu multaj kagxoj estis apud la enirejo est ce que beaucoup de cages étaient près de l''entrée','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (156,25,'ekz06_30',30,'estis - kio - la - por - tagmanĝo - ?','Kio estis por la tagmanĝo? Qu''est ce qu''il avait pour le déjeuner?','kio estis por la tagmangxo qu''est-ce qu''il avait pour le déjeuner','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (157,25,'ekz06_31',31,'arkta - blankaj - en - estas - kontinento - la - ursoj.','En la arkta kontinento estas blankaj ursoj. Sur le continent arctique, il y a des ours blancs.','n la arkta kontinento estas blankaj ursoj sur le continent arctique il y a des ours blancs','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (158,26,'ekz06_32',32,'Faru vian aferon, Dio zorgos PRI la cetero. (proverbe : faru = fais [impératif])','Faru vian aferon, Dio zorgos la ceteron. ','faru vian aferon dio zorgos la ceteron','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (159,26,'ekz06_33',33,'Mi feriis DUM tri semajnoj.','Mi feriis tri semajnojn.','mi feriis tri semajnojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (160,26,'ekz06_34',34,'La strato estas larĝa JE* 50 metroj.','La strato estas larĝa 50 metrojn.','la strato estas largxa 50 metrojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (161,26,'ekz06_35',35,'D-ro (Doktoro) Zamenhof naskiĝis JE* la 15a de decembro 1859. (naskiĝi = naître)','D-ro Zamenhof naskiĝis la 15an de decembro 1859.','d ro zamenhof naskigxis la 15an de decembro 1859','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (162,27,'ekz06_36',36,'Mi* veturis al la zoologia* ĝardeno* kun Petro*. Li* tre deziris veturi tie*. En la zoo* li admiris ursoj* kaj simioj*. Kiam la blanka urso vidis Petro*, ĝi kuris en la akvo*. Ni atendis kvin minutoj* por vidi, kio* la urso* faros poste, sed ĝi* ne iris el la akvo* kaj en la akvo* ĝi nenio* faris. Ni revenis Montrealo* vespere*.','Mi veturis al la zoologia ĝardeno kun Petro. Li tre deziris veturi tien. En la zoo li admiris ursojn kaj simiojn. Kiam la blanka urso vidis Petron, ĝi kuris en la akvon. Ni atendis kvin minutojn por vidi, kion la urso faros poste, sed ĝi ne iris el la akvo kaj en la akvo ĝi nenion faris. Ni revenis Montrealon vespere.','mi veturis al la zoologia gxardeno kun Petro li tre deziris veturi tien en la zoo li admiris ursojn kaj simiojn. kiam la blanka urso vidis petron gxi kuris en la akvon ni atendis kvin minutojn por vidi kion la urso faros poste sed gxi ne iris el la akvo kaj en la akvo gxi nenion faris ni revenis montrealon vespere.','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (163,28,'ekz07_01',1,'("edzo" = époux) : edzino, edziĝi, eksedzo, geedzoj','Épouse, épouser, un divorcé, époux.','épouse épouser un divorcé|ex-mari époux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (164,28,'ekz07_02',2,'("viro" = homme) : virino, vireto, viraĉo, vira','Femme, petit homme, mauvais homme, masculin','femme petit homme mauvais homme|sale type masculin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (165,28,'ekz07_03',3,'("bovo" = bœuf) : bovino, bovido, bovaro, bovejo','Vache, veau, troupeau de vaches, étable.','vache veau troupeau de vaches|bétail|troupeau de boeufs|troupeau de bovins étable','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (166,28,'ekz07_04',4,'("varma" = chaud) : malvarma, varmeco, varmeta, malvarmiĝi','Froid, chaleur, tiède, se refroidir.','froid chaleur tiède se refroidir','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (167,28,'ekz07_05',5,'("aro" = groupe) : ŝiparo (ŝipo = bateau), abelaro (abelo = abeille), stelaro (stelo = étoile)','une flotte, un essaim, une constellation.','une flotte un essaim une constellation','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (168,29,'ekz07_06',6,'Cuire à petit feu ("boli" = bouillir):','Boleti.','boleti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (169,29,'ekz07_07',7,'Homme méprisable ("viro"):','Viraĉo.','viracxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (170,29,'ekz07_08',8,'Un imbécile ("stulta"):','Stultulo.','stultulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (171,29,'ekz07_09',9,'Un temps affreux ("vetero" = temps):','Veteraĉo.','veteracxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (172,29,'ekz07_10',10,'Une nouvelle ("nova" = nouveau):','Novaĵo.','novajxo|novulino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (173,29,'ekz07_11',11,'Un flocon de neige ("neĝo" = neige):','Neĝero.','negxero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (174,29,'ekz07_12',12,'La solitude ("sola" = seul):','Soleco.','soleco','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (175,29,'ekz07_13',13,'Une église ("preĝi" = prier):','Preĝejo.','pregxejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (176,29,'ekz07_14',14,'Polycopier ("multa" = beaucoup):','Multobligi.','multobligi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (177,29,'ekz07_15',15,'Un dentiste ("dento" = dent):','Dentisto.','dentisto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (178,29,'ekz07_16',16,'Une ex-présidente :','Eksprezidantino.','eksprezidantino|eksprezidentino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (179,29,'ekz07_17',17,'Un pauvre ("riĉa" = riche):','Malriĉulo.','malricxulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (180,29,'ekz07_18',18,'Une salle de jeu ("ludi" = jouer):','Ludĉambro.','ludcxambro|ludocxambro|ludejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (181,30,'ekz07_19',19,'Se nun estas la dua, kioma horo estos post dudek minutoj ? (Se signifie «si» condition)','Estos la dua kaj dudek.','estos la dua kaj dudek','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (182,30,'ekz07_20',20,'Se nun estas la dek-unua, kioma horo estis antaŭ dek minutoj ?','Estis la deka kaj kvindek.','estis la deka kaj kvindek|estis dek minutoj antaux la dekunua|estis dek minutoj antaux la dek-unua','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (183,30,'ekz07_21',21,'Mi revenis je la kvara kaj duono, kaj ŝi revenis dudek kvin minutojn antaŭ mi. Je la kioma ŝi revenis ?','Ŝi revenis je la kvara kaj kvin.','sxi revenis je la kvara kaj kvin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (184,30,'ekz07_22',22,'Fatima iras labori je la sepa matene kaj revenas post naŭ horoj. Je la kioma ŝi revenas ?','Ŝi revenas je la kvara','sxi revenas je la kvara|sxi revenas je la deksesa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (185,31,'ekz07_23',23,'image 1.','Estas la deka kaj kvardek kvin.','estas la deka kaj kvardek kvin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (186,31,'ekz07_24',24,'image 2.','Estas la sesa.','estas la sesa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (187,31,'ekz07_25',25,'image 3.','Estas la tria kaj duono.','estas la tria kaj duono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (188,31,'ekz07_26',26,'image 4.','Estas du minutoj antaŭ la sesa.','estas du minutoj antaux la sesa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (189,32,'ekz08_01',1,'La infano, kiu ludas estas ______ .','La infano, kiu ludas estas ludanta infano.','la infano kiu ludas estas ludanta infano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (190,32,'ekz08_02',2,'La junulo, kiu studis, estas ______ .','La junulo, kiu studis, estas studinta junulo.','la junulo kiu studis estas studinta junulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (191,32,'ekz08_03',3,'La katoj, kiuj dormas, estas ______ .','La katoj, kiuj dormas, estas dormantaj katoj.','la katoj kiuj dormas estas dormantaj katoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (192,32,'ekz08_04',4,'La birdoj, kiuj flugos, estas ______ .','La birdoj, kiuj flugos, estas flugontaj birdoj.','la birdoj kiuj flugos estas flugontaj birdoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (193,32,'ekz08_05',5,'La junulino, kiu vojaĝas, estas ______ .','La junulino, kiu vojaĝas, estas vojaĝanta junulino.','la junulino kiu vojagxas estas vojagxanta junulino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (194,32,'ekz08_06',6,'La kuko, kiun la infano manĝas, estas ______ .','La kuko, kiun la infano manĝas, estas manĝata kuko.','la kuko kiun la infano mangxas estas mangxata kuko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (195,32,'ekz08_07',7,'La ĵurnaloj, kiujn la junulo legis, estas ______ .','La ĵurnaloj, kiujn la junulo legis, estas legitaj ĵurnaloj.','la jxurnaloj kiujn la junulo legis estas legitaj jxurnaloj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (196,32,'ekz08_08',8,'La frukto, kiun la birdo manĝas, estas ______ .','La frukto, kiun la birdo manĝas, estas manĝata frukto.','la frukto kiun la birdo mangxas estas mangxata frukto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (197,32,'ekz08_09',9,'La amiko, kiun mi renkontos, estas ______ .','La amiko, kiun mi renkontos, estas renkontota amiko.','la amiko kiun mi renkontos estas renkontota amiko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (198,32,'ekz08_10',10,'La pordo, kiun li fermis, estas ______ .','La pordo, kiun li fermis, estas fermita pordo.','la pordo kiun li fermis estas fermita pordo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (199,33,'ekz08_11',11,'Si elle venait à 8h nous pourrions manger à 8h30.','Se ŝi venus je la oka horo, ni povus manĝi je la oka kaj duono.','se sxi venus je la oka horo ni povus mangxi je la oka kaj duono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (200,33,'ekz08_12',12,'Je désire qu’elle vienne à 8h mais je crois qu’elle ne viendra pas avant 9h.','Mi deziras ke ŝi venu je la oka horo sed mi kredas ke ŝi ne venos antaŭ la naŭa horo.','mi deziras ke sxi venu je la oka horo sed mi kredas ke sxi ne venos antaux la nauxa horo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (201,33,'ekz08_13',13,'Va là-bas, assieds-toi et ouvre le sucrier !','Iru tien, sidiĝu kaj malfermu la sukerujon.','iru tien sidigxu kaj malfermu la sukerujon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (202,33,'ekz08_14',14,'Cet imbécile veut me rencontrer à l’étable. Qu’il [y] aille en premier, et qu’il m’attende. Je viendrai quand je voudrai.','Tiu stultulo volas renkonti min ĉe la bovejo. Li unue iru tien kaj li atendu min. Mi venos kiam mi volos.','tiu stultulo volas renkonti min cxe la bovejo li unue iru tien kaj li atendu min mi venos kiam mi volos','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (203,33,'ekz08_15',15,'Que faire ? (Qu’est-ce que je «dois-faire» ?)','Kion mi faru?','kion mi faru|kion mi devas fari','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (204,33,'ekz08_16',16,'Il croyait que je ne viendrais pas avant 9h mais je suis venue à 8h moins 5.','Li kredis ke mi ne venos antaŭ la naŭa horo sed mi venis je kvin minutoj antaŭ la oka horo.','li kredis ke mi ne venos antaux la nauxa horo sed mi venis je kvin minutoj antaux la oka horo|li kredis ke mi ne venos antaux la nauxa horo sed mi venis je kvin minutoj antaux la oka','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (205,33,'ekz08_17',17,'Sur le point de chanter, il se mit à rire. (préfixe ek-)','Ekkantonte, li ekridis.','ekkantonte li ekridis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (206,33,'ekz08_18',18,'Elle se mit à rougir en griffonnant le nom du garçon.','Ŝi ekruĝiĝis skribaĉante la nomon de la knabo.','Sxi ekrugxigxis skribacxante la nomon de la knabo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (207,34,'ekz08_19',19,'Juĝisto:  Ĉu vi do asertas, ke vi iris en la domon opiniante, ke ĝi estas via domo ?<br/>Akuzato: Jes, sinjoro juĝisto.<br/>Juĝisto: Sed kial vi forkuris, kiam la sinjorino envenis ?<br/>Akuzato: Mi opiniis, ke ŝi estas mia edzino !','Le juge: Donc, vous affirmez que vous êtes entré dans la maison en pensant qu''elle était votre maison.<br/>Accusé : Oui, Monsieur le juge.<br/>Le juge: Mais pourquoi vous êtes-vous enfui quand la femme est entrée ?<br/>Accusé: J''ai pensé qu''elle était ma femme !','le juge donc vous affirmez que vous êtes entré dans la maison en pensant qu elle était votre maison<br/>accusé oui monsieur le juge<br/>le juge mais pourquoi vous êtes-vous enfui quand la femme est entrée<br/>accusé j''ai pensé qu elle était ma femme','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (208,34,'ekz08_20',20,'Patrino en tramo: Joĉjo, kial vi sidas kun fermitaj okuloj ? Ĉu vi estas laca ?<:br>Joĉjo: Ne ! Ne plaĉas al mi vidi starantajn virinojn.','Une mère dans un tramway: Jojo, pourquoi es-tu assis avec les yeux fermés ?<br/>Es-tu fatigué?<br/>Jojo: Non! Il ne me plaît pas de voir des femmes debout.','une mère dans un tramway jojo pourquoi es-tu assis avec les yeux fermés<br/>es tu fatigué<br/>jojo non il ne me plaît pas de voir regarder des femmes debout','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (209,35,'ekz08_21',21,'Maria legis ___ libron. (Elle a lu son propre livre)','Maria legis <b>sian</b> libron.','maria legis sian libron|sian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (210,35,'ekz08_22',22,'Maria legis ___ libron. (Elle a lu le livre de son père)','Maria legis <b>lian</b> libron.','maria legis lian libron|lian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (211,35,'ekz08_23',23,'Maria legis ___ libron. (Elle a lu le livre de sa sœur)','Maria legis <b>ŝian</b> libron.','maria legis sxian libron|sxian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (212,35,'ekz08_24',24,'Petro atendas ___ filon. (Il attend le fils de son ami)','Petro atendas <b>lian</b> filon.','petro atendas lian filon|lian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (213,35,'ekz08_25',25,'Petro atendas ___ filon. (Il attend le fils sa voisine)','Petro atendas <b>ŝian</b> filon.','petro atendas sxian filon|sxian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (214,35,'ekz08_26',26,'Petro atendas ___ filon. (Il attend son propre fils)','Petro atendas <b>sian</b> filon.','petro atendas sian filon|sian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (215,35,'ekz08_27',27,'Mia patro dormos en ___ lito. (Il dormira dans son propre lit)','Mia patro dormos en <b>sia</b> lito.','mia patro dormos en sia lito|sia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (216,35,'ekz08_28',28,'Anna skribis ___ nomon sur ___ libro per ___ skribilo. (Elle a écrit son propre nom sur le livre de son amie, avec le stylo de son frère)','Anna skribis <b>sian</b> nomon sur <b>ŝia</b> libro per <b>lia</b> skribilo.','anna skribis sian nomon sur sxia libro per lia skribilo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (217,35,'ekz08_29',29,'Sofia kaj ___ edzo promenas en la parko. (Sophie et son mari …)','Sofia kaj <b>ŝia</b> edzo promenas en la parko.','sofia kaj sxia edzo promenas en la parko|sxia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (218,36,'ekz08_30',30,'- Incitas min, ke mia edzino daŭre parolas pri sia antaŭa edzo.<br/>- Tio estas nenio ! La mia paroladas pri sia estonta edzo !','Cela m''énerve que mon épouse parle continuellement de son précédent mari.<br/>- Ce n''est rien! La mienne parle tout le temps de son futur mari!','cela m énerve que mon épouse parle continuellement de son précédent mari<br/>Cela n est rien la mienne parle tout le temps de son futur mari','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (219,36,'ekz08_31',31,'En kafejo:<br/>- Kial vi rigardadas al la pordo ?<br/>- Mi observadas, ĉu ne iu foriras kun mia surtuto. Kun la via jam antaŭ dek minutoj foriris iu.','Au café:<br/>- Pourquoi regardes-tu constamment vers la porte?<br/>- J''observe si quelqu''un ne part pas avec mon pardessus. Quelqu''un est parti avec le tien, il y a déjà 10 minutes.','au café<br/>pourquoi regardes tu constamment vers la porte<br/>j observe si quelqu un ne part pas avec mon pardessus quelqu un est parti avec le tien il y a déjà 10 minutes','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (220,36,'ekz08_32',32,'La junaj geedzoj havis konflikton hejme, kaj poste dum la aŭto-veturado ili ambaŭ obstine silentis.<br/>Preterpasante aron da azenoj la edzo diris moke:<br/>- Ĉu parencoj de vi ?<br/>- Jes, boparencoj !','Les jeunes époux avaient eu un conflit à la maison, ensuite pendant le trajet en voiture, ils se taisaient obstinément ensemble.<br/>En passant à côté d''un troupeau d''ânes, le mari dit en se moquant:<br/>- Est-ce que ce sont des parents à toi ?<br/>-Oui, des beaux-parents !','les jeunes époux avaient eu un conflit à la maison ensuite pendant le trajet en voiture ils se taisaient obstinément ensemble<br/>en passant à côté d un troupeau d ânes le mari dit en se moquant<br/>est ce que ce sont tes parents à toi<br/>oui des beaux-parents','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (221,37,'ekz09_01',1,'Geinstruistoj gvidas Esperanto-kursojn por 303 gelernantoj en la brazila urbo Salvadoro. Kiel en la resto de la lando, ankaŭ en Salvadoro oni sentas kreskon de la intereso pri la Internacia Lingvo post la 66a Universala Kongreso en Brazilio.','Des enseignant(e)s animent des cours d''espéranto pour 303 étudiant(e)s dans la ville brésilienne de Salvador.(Br/Comme dans le reste du pays, à Salvador aussi on sent croître l''intérêt pour la Langue Internationale après le 66ème Congrès Universel au Brésil.','des enseignant(e)s animent des cours d''espéranto pour 303 étudiant(e)s dans la ville brésilienne de Salvador(Br/)comme dans le reste du pays à salvador aussi on sent croître l''intérêt pour la langue internationale après le 66ème congrès universel au brésil.','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (222,37,'ekz09_02',2,'Bela parketo en la centro de la sud-franca urbo Pau ĵus ricevis la nomon Zamenhof. La urb-estro de Pau, André Labarrère, fariĝis ministro en majo. Li dufoje subtenis leĝproponojn, kiuj celas meti Esperanton en egalan situacion kun aliaj lingvoj. Li estas honora membro de la loka Esperanto-societo, kaj pasint-jare li persone malfermis ekspozicion pri Esperanto, kiu restis unu monaton en la urba biblioteko.','Un beau petit parc dans le centre-ville de Pau, dans le sud de la France, vient de recevoir le nom de Zamenhof. Le maire de Pau, André Labarrère, est devenu ministre en mai. Il a soutenu deux fois des propositions de lois, qui ont pour but de mettre l''espéranto en situation égale avec les autres langues. Il est membre honoraire de la société locale d''espéranto, et l''année dernière il a personnellement ouvert une exposition sur l''espéranto, qui est restée un mois dans la bibliothèque municipale.','un beau petit parc dans le centre-ville de pau dans le sud de la france vient de recevoir le nom de zamenhof le maire de pau andré labarrère est devenu ministre en mai il a soutenu deux fois des propositions de lois qui ont pour but de mettre l''espéranto en situation égale avec les autres langues il est membre honoraire de la société locale d''espéranto et l''année dernière il a personnellement ouvert une exposition sur l''espéranto qui est restée un mois dans la bibliothèque municipale','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (223,37,'ekz09_03',3,'La 11an de oktobro 1980, grupo de samideanoj de Bostona Esperanto-Klubo veturis al Ŝerbruko (Kebekio) por esti gastigataj de ŝerbruka Esperanto-Societo (ŜES) dum speciala semajnfina aranĝo. Plie montrealanoj el la du kluboj kunvenis sabatvespere por partopreni komunan manĝon en restoracio kaj vesperon en la kutima renkontejo de ŝES ĉe la loka universitato. Naciecoj reprezentitaj: Francio, Japanio, Kanado, Usono.','Le 11 octobre 1980, un groupe de partisans du club d''espéranto de Boston, s''est rendu à Sherbrooke (Québec) pour être reçu par la Société d''Espéranto de Sherbrooke durant un week-end spécial. De plus les montréalais des deux clubs se sont réunis le samedi soir pour participer à un repas en commun au restaurant et une soirée au local habituel de ŜES, à l''université locale. Nationalités représentées : France, Japon, Canada, Etat-Unis.','le 11 octobre 1980 un groupe de partisans du club d''espéranto de boston s''est rendu à sherbrooke (québec) pour être reçu par la société d''espéranto de sherbrooke durant un week-end spécial de plus les montréalais des deux clubs se sont réunis le samedi soir pour participer à un repas en commun au restaurant et une soirée au local habituel de ses à l''université locale nationalités représentées france japon canada etat-unis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (224,37,'ekz09_04',4,'Kio okazas ĉe la junularaj esperantistaj asocioj de la landoj najbaraj de ni? Por respondi al tiu demando, jen nova rubriko. Ĉi-numere ni donos novaĵojn pri NEJ (Nederlanda Esperantista Junularo) kaj FEJA (Flandra Esperanta Junulara Asocio). Tiuj du asocioj havas komunan bultenon. La plej interesa afero, kiun tiuj uloj organizas – almenaŭ el nia vidpunkto – estas la Paska Renkontiĝo. Ĝi nun iĝis tradicia kaj, kiel la nomo antaŭsupozigas, ĝi okazas dum la Paska semajnfino.','Que se passe-t-il dans les associations de jeunesse espérantiste des pays voisins ? Pour répondre à cette question, voici une nouvelle rubrique. Dans ce numéro nous donnerons des nouvelles de NEJ (Jeunesse Espérantiste Néerlandaise) et FEJA (Association de la Jeunesse Espérantiste des Flandres). Ces deux associations ont un bulletin commun. La chose la plus intéressante qu''ils organisent – au moins de notre point de vue- est la rencontre de Pâques. Elle est maintenant devenue traditionnelle et, comme son nom l''indique, elle a lieu durant le week-end de Pâques.','que se passe-t-il dans les associations de jeunesse espérantiste des pays voisins pour répondre à cette question voici une nouvelle rubrique dans ce numéro nous donnerons des nouvelles de nej (jeunesse espérantiste néerlandaise) et feja (association de la jeunesse espérantiste des flandres) ces deux associations ont un bulletin commun la chose la plus intéressante qu''ils organisent au moins de notre point de vue est la rencontre de pâques elle est maintenant devenue traditionnelle et comme son nom l''indique elle a lieu durant le week-end de pâques','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (225,38,'ekz10_01',1,'amiko','amikoj','amikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (226,38,'ekz10_02',2,'butiko','butikoj','butikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (227,38,'ekz10_03',3,'minuto','minutoj','minutoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (228,38,'ekz10_04',4,'manĝanta','manĝantaj','mangxantaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (229,38,'ekz10_05',5,'nokto','noktoj','noktoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (230,38,'ekz10_06',6,'kiu','kiuj','kiuj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (231,38,'ekz10_07',7,'multa','multaj','multaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (232,38,'ekz10_08',8,'babilema','babilemaj','babilemaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (233,38,'ekz10_09',9,'legita','legitaj','legitaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (234,39,'ekz10_10',10,'filo','filino','filino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (235,39,'ekz10_11',11,'patro','patrino','patrino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (236,39,'ekz10_12',12,'amiko','amikino','amikino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (237,39,'ekz10_13',13,'bovo','bovino','bovino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (238,39,'ekz10_14',14,'knabo','knabino','knabino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (239,39,'ekz10_15',15,'edzo','edzino','edzino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (240,39,'ekz10_16',16,'junulo','junulino','junulino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (241,39,'ekz10_17',17,'urso','ursino','ursino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (242,39,'ekz10_18',18,'doktoro','doktorino','doktorino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (243,40,'ekz10_19',19,'bona','malbona','malbona','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (244,40,'ekz10_20',20,'bela','malbela','malbela','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (245,40,'ekz10_21',21,'nova','malnova','malnova','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (246,40,'ekz10_22',22,'facila','malfacila','malfacila','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (247,40,'ekz10_23',23,'fermi','malfermi','malfermi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (248,40,'ekz10_24',24,'helpi','malhelpi','malhelpi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (249,40,'ekz10_25',25,'multe','malmulte','malmulte','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (250,40,'ekz10_26',26,'antaŭ','malantaŭ','malantaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (251,40,'ekz10_27',27,'amo','malamo','malamo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (252,41,'ekz10_28',28,'La pano estas blanka.','Ĉu la pano estas blanka?','cxu la pano estas blanka','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (253,41,'ekz10_29',29,'Ŝi loĝas en Kanado.','Ĉu ŝi loĝas en Kanado?','cxu sxi logxas en kanado','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (254,41,'ekz10_30',30,'La urso estis ofte en la akvo.','Ĉu la urso estis ofte en la akvo?','cxu la urso estis ofte en la akvo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (255,42,'ekz10_31',31,'L’oiseau attrape des insectes.','La birdo kaptas insektojn','la birdo kaptas insektojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (256,42,'ekz10_32',32,'Les filles ont oublié le gâteau.','La knabinoj forgesis la kukon.','la knabinoj forgesis la kukon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (257,42,'ekz10_33',33,'Le parc a reçu un nouveau nom.','La parko ricevis novan nomon.','la parko ricevis novan nomon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (258,42,'ekz10_34',34,'Fermez la porte et asseyez-vous ici.','Fermu la pordon kaj sidiĝu ĉi tien.','fermu la pordon kaj sidigxu cxi tien','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (259,42,'ekz10_35',35,'Nous avons admiré beaucoup de bêtes.','Ni admiris multajn bestojn.','ni admiris multajn bestojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (260,43,'ekz10_36',36,'mia taso : (notre tasse) (ma tasse)','Ma tasse.','ma tasse','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (261,43,'ekz10_37',37,'via sano : (votre santé) (leur santé)','Votre santé.','votre santé','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (262,43,'ekz10_38',38,'lia ŝuo : (sa chaussure à lui) (… à elle)','Sa chaussure à lui.','sa chaussure à lui','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (263,43,'ekz10_39',39,'ŝia edzo : (son mari à elle) (sa femme à lui)','Son mari à elle.','son mari à elle','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (264,43,'ekz10_40',40,'ilia urbo : (sa ville à lui) (leur ville à eux)','Leur ville à eux.','leur ville à eux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (265,44,'ekz10_41',41,'Jen tri belaj fruktoj. (Tiun) (Kiun) vi deziras ?','Jen tri belaj fruktoj. <b>Kiun</b> vi deziras?','jen tri belaj fruktoj kiun vi deziras|kiun','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (266,44,'ekz10_42',42,'La libro de mia onklo estas (nenie) (ĉiu).','La libro de mia onklo estas <b>nenie</b>.','la libro de mia onklo estas nenie|nenie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (267,44,'ekz10_43',43,'(iu) (tia) estas la vero.','<b>Tia</b> estas la vero.','tia estas la vero|tia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (268,44,'ekz10_44',44,'(kiom) (tial) da lakto vi deziras ?','<b>Kiom</b> da lakto vi deziras?','kiom da lakto vi deziras|kiom','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (269,44,'ekz10_45',45,'Mi (nenies) (iel) faros la laboron.','Mi <b>iel</b> faros la laboron.','mi iel faros la laboron|iel','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (270,45,'ekz10_46',46,'Alberto deziras iri (dum) (al) Eŭropo.','Alberto deziras iri <b>al</b> Eŭropo.','alberto deziras iri al eŭropo|al','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (271,45,'ekz10_47',47,'Niaj amikoj estas (en) (ĝis) la domo.','Niaj amikoj estas <b>en</b> la domo.','niaj amikoj estas en la domo|en','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (272,45,'ekz10_48',48,'Li ofte ludas (sub) (anstataŭ) studi.','Li ofte ludas <b>anstataŭ</b> studi.','li ofte ludas anstataux studi|anstataux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (273,45,'ekz10_49',49,'Ŝi alvenos (ĉirkaŭ) (sur) la tria horo.','Ŝi alvenos <b>ĉirkaŭ</b> la tria horo.','sxi alvenos cxirkaux la tria horo|cxirkaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (274,45,'ekz10_50',50,'Ĉu vi rimarkis la belan arbon (dum) (antaŭ) la domo?','Ĉu vi rimarkis la belan arbon <b>antaŭ</b> la domo?','cxu vi rimarkis la belan arbon antaux la domo|antaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (275,46,'ekz10_51',51,'les deux sexes réunis dans le même mot :','ge: geamikoj.','ge geamikoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (276,46,'ekz10_52',52,'l’être caractérisé par la racine du mot :','ul: junulo.','ul junulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (277,46,'ekz10_53',53,'action ratée ou faite de travers :','mis: misfari','mis misfari','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (278,46,'ekz10_54',54,'ce qui sert à augmenter, à amplifier :','eg: domego.','eg domego','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (279,46,'ekz10_55',55,'ce qui indique que c’est digne de quelque chose :','ind: vidinda.','ind vidinda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (280,47,'ekz10_56',56,'Bonjour ! Mon nom est Jacques. Je suis jardinier et j''aime beaucoup les fleurs. Je travaille dans le jardin zoologique de Granby, cela veut dire que j''aime aussi les bêtes. Quand je suis en train de travailler, je chante souvent. Tous mes amis me disent que les fleurs du zoo sont belles parce que je chante avec joie. Est-ce que vous pensez que cela est possible ?','Saluton ! Mia nomo estas Ĵak''. Mi estas ĝardenisto kaj mi multe ŝatas la florojn. Mi laboras en la zoologia ĝardeno de Granby, tio signifas ke mi ŝatas ankaŭ la bestojn. Kiam mi laboras, mi ofte kantas. Ĉiuj miaj amikoj diras al mi, ke la floroj de la zoo estas belaj ĉar mi ĝoje kantas. Ĉu vi opinias ke tio estas ebla ?','saluton mia nomo estas jxak mi estas gxardenisto kaj mi multe sxatas la florojn mi laboras en la zoologia gxardeno de granby tio signifas ke mi sxatas ankaux la bestojn kiam mi laboras mi ofte kantas cxiuj miaj amikoj diras al mi ke la floroj de la zoo estas belaj cxar mi gxoje kantas cxu vi opinias ke tio estas ebla','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (281,48,'ekz10_57',57,'Kara amikino,<br/>Jen mia unua letero al vi. Mi deziras interŝanĝi leterojn kaj amikiĝi kun vi. Mi estas esperantisto de nur du monatoj sed mi progresas rapide, ĉar mi studas la lingvon ĉiun tagon. Mi deziras multe vojaĝi tra la mondo kaj se mi estus riĉa, tio estus tre facila. Mi kredas, ke Esperanto estas utila por trovi geamikojn en multaj landoj. Se vi opinias, ke ni povas interŝanĝi amikaĵojn, skribu al mi kaj mi certe respondos. Dankon kaj ĝis baldaŭ!<br/>Via kanada amiko, Petro.','Chère amie, <br/>Voici ma première lettre pour vous. J''aimerais échanger des lettres et devenir ami avec vous. Je suis espérantiste depuis seulement deux mois mais je progresse vite, car j''étudie la langue chaque jour. Je désire voyager à travers le monde et si j''étais riche, ce serait très facile. Je crois que l''espéranto est utile pour trouver des ami(e)s dans beaucoup de pays. Si vous pensez que nous pouvons échanger des amitiés, écrivez-moi et je répondrai certainement. Merci et à bientôt !<br/>Votre ami canadien, Pierre.','chère amie <br/>voici ma première lettre à vous j''aimerais échanger des lettres et nouer une amitié avec vous je suis espérantiste depuis seulement deux mois mais je progresse vite car j''étudie la langue chaque jour je désire voyager à travers le monde et si j''étais riche ce serait très facile je crois que l''espéranto est utile pour trouver des ami(e)s dans beaucoup de pays si vous pensez que nous pouvons échanger des amitiés écrivez-moi et je répondrai certainement merci et à bientôt<br/>votre ami canadien pierre','',0);

-- Question de Gerda :

insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (282,49,'ekz01_01',1,'Kiu sidas en la angulo? (Tom / Linda / blonda viro / juna knabino / maljuna viro)','<b>Blonda viro</b> sidas en la angulo.','blonda viro sidas en angulo|blonda viro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (283,49,'ekz01_02',2,'Kiu iras al li? (Tom / Linda / blonda viro / juna knabino / maljuna viro)','<b>Juna knabino</b> iras al li.','juna knabino iras al li|juna knabino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (284,49,'ekz01_03',3,'Al kio iras Tom kaj Linda? (al la angulo / al granda spegulo / al la nova studento / al la blonda viro)','Tom kaj Linda iras al <b>granda spegulo</b>.','tom kaj linda iras al granda spegulo|ili iras al granda spegulo|al granda spegulo|tom kaj linda iras al la granda spegulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (285,49,'ekz01_04',4,'Kiu estas (eble) la plej bela virino en la mondo? (Tom / Linda / blonda viro / bela knabino / maljuna viro)','</b>Linda</b> estas (eble) la plej bela virino en la mondo.','la plej bela virino en la mondo estas (eble) linda|linda|linda estas (eble) la plej bela virino en la mondo|la plej bela virino en la mondo estas eble linda|linda estas eble la plej bela virino en la mondo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (286,49,'ekz01_05',5,'Kiu estas (eble) la plej malserioza knabo en la universitato? (Tom / Linda / blonda viro / bela knabino / maljuna viro)','<b>Tom</b> estas (eble) la plej malserioza knabo en la universitato.','la plej malserioza knabo en la universitato estas (eble) tom|tom|tom estas (eble) la plej malserioza knabo en la universitato|tom estas la plej malserioza knabo en la universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (287,50,'ekz01_06',6,'{ al rigard- mi -u }','Rigardu al mi.','rigardu al mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (288,50,'ekz01_07',7,'{ -a -as est- grand- li -o vir- }','Li estas granda viro.','li estas granda viro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (289,50,'ekz01_08',8,'{ -a -as en est- li -o restoraci- student- }','Li estas en studenta restoracio.','li estas en studenta restoracio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (290,50,'ekz01_09',9,'{ -a jen labor- nov- -o }','Jen nova laboro.','jen nova laboro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (291,50,'ekz01_10',10,'{ -a -as nenio nun okaz- special- }','Nenio speciala nun okazas.','nenio speciala nun okazas|nenio speciala okazas nun|nun nenio speciala okazas|nun okazas nenio speciala','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (292,50,'ekz01_11',11,'{ -as bel- est- kio -o ? }','Kio estas belo?','kio estas belo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (293,50,'ekz01_12',12,'{ al -as -in- ir- knab- li -o }','Li iras al knabino.','li iras alknabino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (294,50,'ekz01_13',13,'{ -a -as est- mal- serioz- vi }','Vi estas malserioza.','vi estas malserioza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (295,51,'ekz01_14',14,'Vi laboras multe','Laboru malmulte!','laboru malmulte','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (296,51,'ekz01_15',15,'Vi rigardas al mi malsincere','Rigardu al mi sincere!','rigardu al mi sincere','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (297,51,'ekz01_16',16,'Vi estas serioza','Estu malserioza!','estu malserioza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (298,51,'ekz01_17',17,'Vi laboras malserioze','Laboru serioze!','laboru serioze','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (299,52,'ekz02_01',1,'Linda estas ___. (malserioza / nova studento / bela kaj pala / io stranga)','Linda estas <b>bela kaj pala</b>.','linda estas bela kaj pala|bela kaj pala','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (300,52,'ekz02_02',2,'Kio okazas? (Linda rigardas al la spegulo. / Malalta viro staras inter Tom kaj la pordo. / La blonda viro agas strange. / La nova studento proksimiĝas al Tom.)','<b>La blonda viro</b> agas strange.','la blonda viro agas strange','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (301,52,'ekz02_03',3,'Ĉu estas io en lia mano? (jes / ne)','<b>Jes</b>, estas io en lia mano.','jes|jes estas io en lia mano|jes io estas en lia mano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (302,52,'ekz02_04',4,'Al kio montras la mistera ulo? (al la spegulo / al la pordo / al Linda / al Tom / al la angulo)','La mistera ulo montras <b>al la pordo</b>.','al la pordo|li montras al la pordo|la mistera ulo montras al la pordo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (303,52,'ekz02_05',5,'Al kio rigardas la juna knabino, kiu estas kun li? (al la spegulo / al la pordo / al Linda / al Tom / al la angulo)','La juna knabino rigardas <b>al la pordo</b>.','al la pordo|sxi rigardas al la pordo|la juna knabino rigardas al la pordo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (304,52,'ekz02_06',6,'Ĉu nun estas io en la taso? (jes / ne)','<b>Jes</b>, nun estas io en la taso.','jes|jes nun estas io en la taso|jes io estas nun en la taso','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (305,53,'ekz02_07',7,'Mi ne vidas, [ĉu/se] la junulo parolas al la knabino, aŭ [ĉu/se] li nur rigardas al ŝi.','Mi ne vidas, <b>ĉu</b> la junulo parolas al la knabino, aŭ <b>ĉu</b> li nur rigardas al ŝi.','mi ne vidas cxu la junulo parolas al la knabino aux cxu li nur rigardas al sxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (306,53,'ekz02_08',8,'Vi vidas lin tute bone, [ĉu /se] ne?','Vi vidas lin tute bone, <b>ĉu</b> ne?','vi vidas lin tute bone cxu ne','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (307,53,'ekz02_09',9,'[Ĉu/Se] li agas strange, li estas strangulo.','<b>Se</b> li agas strange, li estas strangulo.','se li agas strange li estas strangulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (308,53,'ekz02_10',10,'Mi parolas al knabinoj, [ĉu/se] ili rigardas al mi.','Mi parolas al knabinoj, <b>se</b> ili rigardas al mi.','mi parolas al knabinoj se ili rigardas al mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (309,53,'ekz02_11',11,'Mi ne scias, [ĉu/se] mi parolu al ŝi aŭ ne.','Mi ne scias, <b>ĉu</b> mi parolu al ŝi aŭ ne.','mi ne scias cxu mi parolu al sxi aux ne','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (310,53,'ekz02_12',12,'[Ĉu/Se] ŝi parolas al mi, [ĉu/se] mi reparolu al ŝi?','<b>Se</b> ŝi parolas al mi, <b>ĉu</b> mi reparolu al ŝi?','se sxi parolas al mi cxu mi reparolu al sxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (311,53,'ekz02_13',13,'Li estas en universitato, [ĉu/se] li estas studento.','Li estas en universitato, <b>se</b> li estas studento.','li estas en universitato se li estas studento','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (312,53,'ekz02_14',14,'Mi ne certas, [ĉu/se] li estas studento. Li estas tro maljuna.','Mi ne certas, <b>ĉu</b> li estas studento. Li estas tro maljuna.','mi ne certas cxu li estas studento li estas tro maljuna','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (313,54,'ekz03_01',1,'Kiuj aspektas kiel spionoj? (Linda kaj Tom / Linda kaj Bob / Bob kaj Tom / Gerda kaj la blondulo)','<b>Linda kaj Tom</b> aspektas kiel spionoj.','linda kaj tom|linda kaj tom aspektas kiel spionoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (314,54,'ekz03_02',2,'Ĉu Bob salutas ilin tuj? (jes /ne)','<b>Ne</b>, Bob ne salutas ilin tuj.','ne|ne bob ne salutas ilin tuj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (315,54,'ekz03_03',3,'Ĉu Linda kaj Tom permesas, ke Bob sidu ĉe ilia tablo? (jes / ne)','<b>Jes</b>, Linda kaj Tom permesas, ke Bob sidu ĉe ilia tablo.','jes|linda kaj tom permesas ke li sidu cxe ilia tablo|jes ili permesas ke bob sidu cxe ilia tablo|jes ili permesas ke li sidu cxe ilia tablo|linda kaj tom permesas ke bob sidu cxe ilia tablo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (316,54,'ekz03_04',4,'Kiu ne volas esti maldiskreta? (Bob / Tom / Linda / Gerda / la blondulo)','<b>Bob</b>, ne volas esti maldiskreta.','bob|bob ne volas esti maldiskreta|estas bob kiu ne volas esti maldiskreta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (317,54,'ekz03_05',5,'Kio estas sur la vizaĝo de Linda? (bela deklaro / bona tago / mistera esprimo / io pli grava)','<b>Mistera esprimo</b> estas sur la vizaĝo de Linda','mistera esprimo|estas mistera esprimo sur sxia vizagxo|sur la vizagxo de linda estas mistera esprimo|mistera esprimo estas sur la vizagxo de linda|estas mistera esprimo sur la vizagxo de linda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (318,55,'ekz03_06',6,'{ -as -bon- mal- ne -o pardon- -ul- }','Malbonulo ne pardonas.','malbonulo ne pardonas|bonulo ne malpardonas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (319,55,'ekz03_07',7,'{ -e -is mi post- re- -ven- }','Mi revenis poste.','mi poste revenis|poste mi revenis|mi revenis poste','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (320,55,'ekz03_08',8,'{ -a- al -as -in- -j -j jun- knab- -o -o- parol- vir- }','Virino parolas al junaj knaboj.','junaj virinoj parolas al knabo|viro parolas al junaj knabinoj|junaj viroj parolas al knabino|junaj knaboj parolas al virino|knabo parolas al junaj virinoj|junaj knabinoj parolas al viro|knabino parolas al junaj viroj|virino parolas al junaj knaboj|','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (321,56,'ekz04_01',1,'Pri kio Linda kaj Tom parolis? (pri Bob / pri amo / pri la blondulo / pri kriptaĵo-scienco)','Linda kaj Tom parolis </b>pri la blondulo</b>.','pri la blondulo|ili parolis pri la blondulo|linda kaj tom parolis pri la blondulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (322,56,'ekz04_02',2,'Kiu sidas kun la viro, pri kiu Linda kaj Tom parolis? (Gerda / Ronga / blonda junulo / Bob / neniu)','<b>Gerda</b> sidas kun la viro, pri kiu Linda kaj Tom parolis.','gerda|gerda sidas kun la viro|gerda sidas kun la viro pri kiu linda kaj tom parolis|gerda sidas kun la viro pri kiu ili parolis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (323,56,'ekz04_03',3,'Kiu scias, kiu estas Gerda? (Bob / Linda / Tom)','<b>Bob</b> scias, kiu estas Gerda.','bob|bob scias kiu estas gerda|bob scias kiu gerda estas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (324,56,'ekz04_04',4,'Ĉu Bob konas la blondulon? (jes / ne)','<b>Ne</b>, Bob ne konas la blondulon.','ne|ne bob ne konas la blondulon|ne li ne konas lin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (325,56,'ekz04_05',5,'Kion instruas Gerda? (novajn lingvojn / lingvistikon / kriptaĵo-sciencon)','Gerda instruas <b>kriptaĵo-sciencon</b>.','kriptajxo-sciencon|gerda instruas kripatajxo-sciencon|sxi instruas kriptajxo-sciencon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (326,56,'ekz04_06',6,'Kiu estas profesoro pri lingvistiko? (Bob / Linda / Tom / Gerda / Ronga / la blondulo)','<b>Ronga</b> estas profesoro pri lingvistiko.','ronga|ronga estas profesoro pri lingvistiko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (327,56,'ekz04_07',7,'Kiu estas la sola bela virino en la tuta mondo, por Tom? (Gerda / Linda / Ronga / la knabino en la angulo)','Por Tom, la sola bela virino en la tuta mondo estas <b>Linda</b>.','linda|la sola bela virino en la tuta mondo por tom estas linda|linda estas la sola bela virino en la tuta mondo por tom|por tom la sola bela virino en la tuta mondo estas linda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (328,57,'ekz04_08',8,'[Ili/Ilin] demandas [mi/min].','<b>Ili</b> demandas<b>min</b>.','ilin demandas mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (329,57,'ekz04_09',9,'[Multo/Multon] diras [li/lin] al la studentoj.','<b>Multon</b> diras <b>li</b> al la studentoj.','multon diras li al la studentoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (330,57,'ekz04_10',10,'Al la studentoj li demandas [tio/tion], [kio/kion] [li/lin] ne scias, sed [ili/ilin] diras [nenio/nenion].','Al la studentoj li demandas <b>tion</b>, <b>kion</b> <b>li</b> ne scias, sed <b>ili</b> diras <b>nenion</b>.','al la studentoj li demandas tion kion li ne scias sed ili diras nenioni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (331,57,'ekz04_11',11,'[Ili/Ilin] ne scias.','<b>Ili</b> ne scias.','ili ne scias','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (332,57,'ekz04_12',12,'[Linda/Lindan] ne sidas sole. Venas [bela/belan] [junulo/junulon].','Al la studentoj li demandas <b>tion</b>, <b>kion li</b> ne scias, sed <b>ili</b> diras <b>nenion</b>.','linda ne sidas sole venas bela junulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (333,57,'ekz04_13',13,'[Tio/Tion] certe estas la [universitato/universitaton].','<b>Tio</b> certe estas la <b>universitato</b>.','tio certe estas la universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (334,57,'ekz04_14',14,'La [studentoj/studentojn] montras al [mi/min] la [studenta/studentan] [restoracio/restoracion].','La <b>studentoj</b> montras al <b>mi</b> la <b>studentan</b> <b>restoracion</b>.','la studentoj montras al mi la studentan restoracion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (335,57,'ekz04_15',15,'[Mi/Min] petas [vi/vin], diru al [mi/min] [tio/tion].','<b>Mi</b> petas <b>vin</b>, diru al <b>mi</b> <b>tion</b>.','mi petas vin diru al mi tion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (336,57,'ekz04_16',16,'La [blondulo/blondulon], [kiu/kiun] staras en la [restoracio/restoracion], estas [stranga/strangan].','La <b>blondulo</b>, <b>kiu</b> staras en la <b>restoracio</b>, estas <b>stranga</b>.','la blondulo kiu staras en la restoracio estas stranga','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (337,57,'ekz04_17',17,'[Ili/Ilin] ne pardonas la [nova/novan] [studento/studenton].','<b>Ili</b> ne pardonas la <b>novan studenton</b>.','ilin ne pardonas la nova studento|ili ne pardonas la novan studenton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (338,57,'ekz04_18',18,'[Li/Lin] ne komprenas. [Tio/Tion] estas [mistera/misteran].','<b>Li</b> ne komprenas. <b>Tio</b> estas <b>mistera</b>.','li ne komprenas tio estas mistera','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (339,57,'ekz04_19',19,'[Li/Lin] preferas [sinceraj/sincerajn] [junuloj/junulojn].','<b>Li</b> preferas <b>sincerajn junulojn</b>.','li preferas sincerajn junulojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (340,58,'ekz05_01',1,'Kio estis en la mano de la blondulo antaŭe? (sukerpeco / la taso de Gerda / io tre malgranda / la taso de Linda / nenio)','<b>Io tre malgranda</b> estis en la mano de la blondulo antaŭe.','io tre malgranda|io tre malgranda estis en lia mano antauxe|io tre malgranda estis en la mano de la blondulo antauxe|en la mano de la blondulo antauxe estis io tre malgranda|estis io tre malgranda en la mano de la blondulo antauxe|antauxe estis io tre malgranda en la mano de la bondulo|io tre malgranda estis antauxe en la mano de la blondulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (341,58,'ekz05_02',2,'Kio estis en lia mano poste? (sukerpeco / la taso de Gerda / io tre malgranda / la taso de Linda / nenio)','<b>Nenio</b> estis en lia mano poste.','nenio|poste nenio estis en lia mano|poste estis nenio en lia mano|estis nenio en lia mano poste|en lia mano poste estis nenio|poste nenio estis en la mano de la blondulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (342,58,'ekz05_03',3,'Kio estas en la sukerujoj tie? (sukerpecoj / pulvora sukero / iu drogo / mistera substanco / sekreta lingvo)','Tie en la sukerujoj estas <b>pulvora sukero</b>.','pulvora sukero|pulvora sukero estas en la sukerujoj tie|pulvora sukero estas en la sukerujoj|en la sukerujoj tie estas pulvora sukero|estas pulvora sukero en la sukerujoj tie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (343,58,'ekz05_04',4,'Ĉu estas normale promeni kun sukerpecoj en la poŝo? (jes / ne)','<b>Ne</b>, ne estas normale promeni kun sukerpecoj en la poŝo.','ne|ne ne estas normale promeni kun sukerpecoj en la posxo|ne ne estas normale ','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (344,58,'ekz05_05',5,'Kiu ekiras for? (Linda / Gerda / Tom / Bob / la blondulo)','<b>Gerda</b> ekiras for.','gerda|gerda ekiras for|estas gerda kiu ekiras for','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (345,59,'ekz05_06',6,'Mi ne scias, [kiam/se] ŝi venos al ni.','Mi ne scias, <b>kiam</b> ŝi venos al ni.','mi ne scias kiam sxi venos al mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (346,59,'ekz05_07',7,'Mi tre multe laborus, [kiam/se] mi povus.','Mi tre multe laborus, <b>se</b> mi povus.','mi tre multe laborus se mi povus','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (347,59,'ekz05_08',8,'[Kiam/Se] li estas studento, li estas en la universitato.','<b>Se</b> li estas studento, li estas en la universitato.','se li estas studento li estas en la universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (348,59,'ekz05_09',9,'[Kiam/Se] Tom estis juna, Gerda jam lernis kriptografion.','<b>Kiam</b> Tom estis juna, Gerda jam lernis kriptografion.','kiam tom estis juna gerda jam lernis kriptografion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (349,59,'ekz05_10',10,'Mi volas paroli ankaŭ pri vi, [kiam/se] vi permesas.','Mi volas paroli ankaŭ pri vi, <b>se</b> vi permesas.','mi volas paroli ankaux pri vi se vi permesas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (350,59,'ekz05_11',11,'Mi parolis kun ŝi, [kiam/se] ŝi sidis en la restoracio.','Mi parolis kun ŝi, <b>kiam</b> ŝi sidis en la restoracio.','mi parolis kun sxi kiam sxi sidis en la restoracio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (351,60,'ekz06_01',1,'Kion Tom, Bob kaj Linda aŭdis? (koridoron / strangan bruon / penson / la blondulon)','Tom, Bob kaj Linda aŭdis <b>strangan bruon</b>.','strangan bruon|ili auxdis strangan bruon|tom bob kaj linda auxdis strangan bruon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (352,60,'ekz06_02',2,'Kiu eble falis en la koridoro? (Tom / Bob / Linda / Gerda / la blondulo / Ronga)','<b>Gerda</b> eble falis en la koridoro.','gerda|eble gerda falis en la koridoro|gerda eble falis en la koridoro|eble falis gerda en la koridoro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (353,60,'ekz06_03',3,'Kiuj iras vidi? (Linda kaj Tom / Linda kaj Bob / Bob kaj Tom / ĉiuj tri)','<b>Bob kaj Tom</b> iras vidi.','bob kaj tom iras vidi|bob kaj tom','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (354,60,'ekz06_04',4,'Kiu restas por observi? (Tom / Bob / Linda / la blondulo / Gerda)','<b>Linda</b> restas por observi.','linda|linda restas por observi|linda restas por observi la blondulon|estas linda kiu restas por observi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (355,61,'ekz06_05',5,'La [blondulo/blondulon] metis [sukero/sukeron] en la [taso/tason] de [kafo/kafon].','La <b>blondulo</b> metis <b>sukeron</b> en la <b>tason</b> de <b>kafo</b>.','la blondulo metis sukeron en la tason de kafo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (356,61,'ekz06_06',6,'[Li/Lin] volis iri en la [restoracio/restoracion], al la [bela/belan] [knabino/knabinon], sed [li/lin] falas en la [koridoro/koridoron].','<b>Li</b> volis iri en la <b>restoracion</b>, al la <b>bela</b> <b>knabino</b>, sed <b>li</b> falas en la <b>koridoro</b>.','li volis iri en la restoracion al la bela knabino sed li falas en la koridoro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (357,61,'ekz06_07',7,'Bob konsentas kun [Linda/Lindan].','Bob konsentas kun <b>Linda</b>.','bob konsentas kun linda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (358,61,'ekz06_08',8,'[Ili/Ilin] rigardas al la [studentoj/studentojn].','<b>Ili</b> rigardas al la <b>studentoj</b>.','ili rigardas al la studentoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (359,61,'ekz06_09',9,'[Iu/Iun] perdis [aĵo/aĵon] en la [restoracio/restoracion].','<b>Iu</b> perdis <b>aĵon</b> en la restoracio.','iu perdis ajxon en la restoracio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (360,61,'ekz06_10',10,'Ili metas [ĝi/ĝin] sur la [tablo/tablon] kaj decidas promeni al la [universitato/universitaton]. [Ili/Ilin] ekiras.','Ili metas <b>ĝin</b> sur la <b>tablon</b> kaj decidas promeni al la <b>universitato</b>. <b>Ili</b> ekiras.','ili metas gxin sur la tablon kaj decidas promeni al la universitato ili ekiras','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (361,62,'ekz07_01',1,'Ĉu Gerda ankoraŭ vivas? (jes / ne)','<b>Jes</b>, Gerda ankoraŭ vivas.','jes|jes sxi ankoraux vivas|jes gerda ankoraux vivas|jes gerda vivas ankoraux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (362,62,'ekz07_02',2,'Kiel batas la koro de Gerda? (forte / malforte / nekonscie / konscie / verŝajne)','La koro de Gerda batas <b>malforte</b>.','malforte|gxi batas malforte|la koro de gerda batas malforte|sxia koro malforte batas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (363,62,'ekz07_03',3,'Kiun Tom volas informi? (la blondulon / la profesoron pri lingvistiko / la aŭtoritatojn / spionon)','Tom volas informi la <b>aŭtoritatojn</b>.','la auxtoritatojn|li volas informi la auxtoritatojn|tom volas informi la auxtoritatojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (364,62,'ekz07_04',4,'Ĉu iu, kiu perdis la konscion, kuŝu kun la kapo pli alta ol la piedoj? (jes / ne)','<b>Ne</b>, iu, kiu perdis la konscion, kuŝu kun la piedoj pli altaj ol la kapo.','ne|ne iu kiu perdis la konscion kusxu kun la piedoj pli altaj ol la kapo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (365,63,'ekz07_05',5,'La [sukerpeco/sukerpecon] falis en la [kafo/kafon].','La <b>sukerpeco</b> falis en la <b>kafon</b>.','la sukerpeco falis en la kafon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (366,63,'ekz07_06',6,'Sed [mi/min] ne deziras [sukero/sukeron] en [mia/mian] [kafo/kafon].','Sed <b>mi</b> ne deziras <b>sukeron</b> en <b>mia kafo</b>.','sed mi ne deziras sukeron en mia kafo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (367,63,'ekz07_07',7,'Jen [Linda/Lindan] venas en la [restoracio/restoracion]!','Jen Linda venas en la <b>restoracion</b>!','jen linda venas en la restoracion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (368,63,'ekz07_08',8,'Eble [ŝi/ŝin] deziras [kafo/kafon] kun [sukero/sukeron].','Eble <b>ŝi</b> deziras <b>kafon</b> kun <b>sukero</b>.','eble sxi deziras kafon kun sukero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (369,63,'ekz07_09',9,'[Tiu/Tiun] [tago/tagon] [mi/min] laboris tre multe.','</b>Tiun tagon mi</b> laboris tre multe.','tiun tagon mi laboris tre multe','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (370,63,'ekz07_10',10,'[Li/Lin] restis tie unu [tago/tagon]; [mi/min] restis dum [tuta/tutan] [semajno/semajnon].','<b>Li</b> restis tie unu <b>tagon</b>; mi restis dum <b>tuta semajno</b>.','li restis tie unu tagon mi restis dum tuta semajno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (371,63,'ekz07_11',11,'Demandu, [kio/kion] [li/lin] faras! --- Ne! Demandu [vi/vin]!','Demandu, <b>kion li</b> faras! --- Ne! Demandu <b>vi</b>!','demandu kion li faras ne demandu vi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (372,63,'ekz07_12',12,'La [kafo/kafon], [kiu/kiun] [vi/vin] havas, estas sen [sukero/sukeron].','La <b>kafo</b>, <b>kiun vi</b> havas, estas sen <b>sukero</b>.','la kafo kiun vi havas estas sen sukero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (373,63,'ekz07_13',13,'La [kafo/kafon], [kiu/kiun] [vi/vin] metis sur la [tablo/tablon], [ili/ilin] ne trinkis.','La <b>kafon</b>, <b>kiun vi</b> metis sur la <b>tablon</b>, <b>ili</b> ne trinkis.','la kafon kiun vi metis sur la tablo ili ne trinkis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (374,63,'ekz07_14',14,'La [viro/viron], [kiu/kiun] metis [kafo/kafon] sur la [tablo/tablon], ne estas [studento/studenton].','La <b>viro</b>, <b>kiu</b> metis <b>kafon</b> sur la <b>tablon</b>, ne estas <b>studento</b>.','la viro kiu metis kafon sur la tablon ne estas studento','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (375,63,'ekz07_15',15,'La [tablo/tablon], sur [kiu/kiun] estas la [kafo/kafon], estas tro [malgranda/malgrandan].','La <b>tablo</b>, sur <b>kiu</b> estas la <b>kafo</b>, estas tro <b>malgranda</b>.','la tablo sur kiu estas la kafo estas tro malgranda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (376,63,'ekz07_16',16,'Ĉu [vi/vin] havas iom da [kafo/kafon]? --- [Mi/Min] havas tri [tasoj/tasojn] da [kafo/kafon].','Ĉu <b>vi</b>havas iom da <b>kafo</b>? --- <b>Mi</b> havas tri <b>tasojn</b> da <b>kafo</b>.','cxu vi havas iom da kafo mi havas tri tasojn da kafo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (377,64,'ekz07_17',17,'[Kiel/Ol] vi scias, Bob estas pli alta [kiel/ol] Tom, sed malpli alta [kiel/ol] la stranga blondulo.','<b>Kiel</b> vi scias, Bob estas pli alta <b>ol</b> Tom, sed malpli alta <b>ol</b> la stranga blondulo.','kiel vi scias bob estas pli alta ol tom sed malpli alta ol la stranga blondulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (378,64,'ekz07_18',18,'Mi preferus resti ĉi tie [kiel/ol] iri informi la aŭtoritatojn.','Mi preferus resti ĉi tie <b>ol</b> iri informi la aŭtoritatojn.','mi preferus resti cxi tie ol iri informi la autoritatojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (379,64,'ekz07_19',19,'La vero ofte ŝajnas pli absurda [kiel/ol] imagaĵoj.','La vero ofte ŝajnas pli absurda <b>ol</b> imagaĵoj.','la vero ofte sxajnas pli absurda ol imagajxoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (380,64,'ekz07_20',20,'Li iĝis pli kaj pli forta; li iĝis forta [kiel/ol] fortulo.','Li iĝis pli kaj pli forta; li iĝis forta <b>kiel</b> fortulo.','li igxis pli kaj pli forta li igxis forta kiel fortulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (381,64,'ekz07_21',21,'Iru pli rapide, aŭ iru malpli rapide; iru [kiel/ol] vi volas!','Iru pli rapide, aŭ iru malpli rapide; iru <b>kiel</b> vi volas!','iru pli rapide aux iru malpli rapide iru kiel vi volas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (382,65,'ekz08_01',1,'Ĉu Linda estas trankvila? (jes / ne)','<b>Ne</b>, Linda ne estas trankvila.','ne|ne sxi ne estas trankvila|ne linda ne estas trankvila|ne linda estas maltrankvila|linda estas maltrankvila','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (383,65,'ekz08_02',2,'Ĉu Tom kaj Bob jam revenis? (jes / ne)','<b>Ne</b>, Tom kaj Bob ne jam revenis.','ne|ne ili ne revenis|ne tom kaj bob ne jam revenis|ne tom kaj bob ne revenis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (384,65,'ekz08_03',3,'Ĉu Linda scias, kio okazis al Gerda? (jes / ne)','<b>Ne</b>, Linda ne scias, kio okazis al Gerda.','ne|ne sxi ne scias kio okazis al gerda|linda ne scias kio okazis al gerda|ne linda ne scias kio okazis al gerda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (385,65,'ekz08_04',4,'Kiu ekstaras kaj iras al la pordo? (Linda / Gerda / la juna viro, kiu metis ion en la kafon de Gerda / Bob / Tom)','<b>La juna viro</b>, kiu metis ion en la kafon de Gerda, ekstaras kaj iras al la pordo.','la juna viro kiu metis ion en la kafon de Gerda|la juna viro kiu metis ion en la kafon de gerda ekstaras kaj iras al la pordo|la juna viro kiu metis ion en la kafon de gerda iras al la pordo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (386,65,'ekz08_05',5,'Kiu sekvas? (Linda / Gerda / la juna viro, kiu metis ion en la kafon de Gerda / Bob / Tom)','<b>Linda</b> sekvas lin.','linda|linda sekvas lin|linda sekvas|linda sekvas la junan viron kiu metis ion en la kafon de gerda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (387,66,'ekz08_06',6,'[Oni/Onin] sendis [mi/min] al [Berlino/Berlinon] por paroli kun la [spiono/spionon].','<b>Oni</b> sendis <b>min</b> al <b>Berlino</b> por paroli kun la <b>spiono</b>.','oni sendis min al berlino por paroli kun la spiono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (388,66,'ekz08_07',7,'En [Berlino/Berlinon] mi atendis kvar [tagoj/tagojn] sed ne vidis [li/lin].','En <b>Berlino</b> mi atendis kvar <b>tagojn</b> sed ne vidis <b>lin</b>.','en berlino mi atendis kvar tagojn sed ne vidis lin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (389,66,'ekz08_08',8,'La [tuta/tutan] [tempo/tempon] ili observis la [virino/virinon] en [Londono/Londonon].','La <b>tutan tempon</b> ili observis la <b>virinon</b> en <b>Londono</b>.','la tutan tempon li observis la virinon en londono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (390,66,'ekz08_09',9,'Ili sekvis [ŝi/ŝin] al [Parizo/Parizon], sed en [tiu/tiun] [urbo/urbon] [ili/ilin] perdis [ŝi/ŝin].','Ili sekvis <b>ŝin</b> al <b>Parizo</b>, sed en <b>tiu urbo ili</b> perdis <b>ŝin</b>.','ili sekvis sxin al parizo sed en tiu urbo ili perdis sxin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (391,66,'ekz08_10',10,'Kiam [oni/onin] aŭdis [tiu/tiun] [novaĵo/novaĵon] el [Parizo/Parizon], [oni/onin] decidis, ke [mi/min] ne plu restu en la [urbo/urbon].','Kiam <b>oni</b> aŭdis <b>tiun novaĵon</b> el <b>Parizo</b>, <b>oni</b> decidis, ke <b>mi</b> ne plu restu en la <b>urbo</b>.','kiam oni auxdis tiun novajxon el parizo oni decidis ke mi ne plu restu en la urbo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (392,67,'ekz08_11',11,'Mi konas [min/sin]. Mi do ne volas vidi [min/sin] en la spegulo. Tom estas pli bela ol mi, kaj mi ofte vidas lin rigardi [lin/sin] en la spegulo. Kiam li turnas [lin/sin] al mi, mi plene vidas [sian/lian] belan aspekton.','Mi konas <b>min</b>. Mi do ne volas vidi <b>min</b> en la spegulo. Tom estas pli bela ol mi, kaj mi ofte vidas lin rigardi <b>sin</b> en la spegulo. Kiam li turnas <b>sin</b> al mi, mi plene vidas <b>lian</b> belan aspekton.','mi konas min mi do ne volas vidi min en la spegulo tom estas pli bela ol mi kaj mi ofte vidas lin rigardi sin en la spegulo kiam li turnas sin al mi mi plene vidas lian belan aspekton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (393,67,'ekz08_12',12,'Ĉu vi volas piediri reen al [via/sia] ĉambro? Vi promenos longe, sed ne timu, ke [viaj/siaj] kruroj tro laboros kaj perdos [ilian/sian] tutan forton.','Ĉu vi volas piediri reen al <b>via</b> ĉambro? Vi promenos longe, sed ne timu, ke <b>viaj</b> kruroj tro laboros kaj perdos <b>sian</b> tutan forton.','cxu vi volas piediri reen al via cxambro vi promenos longe sed ne timu ke viaj kruroj tro laboros kaj perdos sian tutan forton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (394,68,'ekz08_13',13,'Ĉu vi havas informojn pri Linda? Ŝi kuŝis en [ŝi*/si*] ĉambro kaj ne sentis [ŝi*/si*] tre bone. Tom iris al [ŝi*/si*] kun [li*/si*] kuracisto, sed ŝi ne rigardis tiun kuraciston serioza. Ŝi preferis [ŝi*/si*] kuraciston; ŝi vere ne amas [li*/si*].','Ĉu vi havas informojn pri Linda? Ŝi kuŝis en <b>sia</b> ĉambro kaj ne sentis <b>sin</b> tre bone. Tom iris al <b>ŝi</b> kun <b>sia</b> kuracisto, sed ŝi ne rigardis tiun kuraciston serioza. Ŝi preferis <b>sian</b> kuraciston; ŝi vere ne amas <b>lian</b>.','cxu vi havas informojn pri linda sxi kusxis en sia cxambro kaj ne sentis sin tre bone tom iris al sxi kun sia kuracisto sed sxi ne rigardis tiun kuraciston serioza sxi preferis sian kuraciston sxi vere ne amas lian','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (395,68,'ekz08_14',14,'Li do forsendis [li*/si*] kaj vokis [ŝi*/si*]. Strange, kiam ŝi vidis [li*/si*] kuraciston, ŝi sentis [ŝi*/si*] malbone, sed tuj kiam ŝi vidis [ŝi*/si*] kuraciston alveni, ŝi jam sentis [ŝi*/si*] pli bone.','Li do forsendis <b>sian</b> kaj vokis <b>ŝian</b>. Strange, kiam ŝi vidis <b>lian</b> kuraciston, ŝi sentis <b>sin</b> malbone, sed tuj kiam ŝi vidis <b>sian</b> kuraciston alveni, ŝi jam sentis <b>sin</b> pli bone.','li do forsendis sian kaj vokis sxian strange kiam sxi vidis lian kuraciston sxi sentis sin malbone sed tuj kiam sxi vidis sian kuraciston alveni sxi jam sentis sin pli bone','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (396,68,'ekz08_15',15,'Oni [oni*/si*] demandas, ĉu ŝi ametas [li*/ŝi*/si*] kuraciston.','Oni <b>sin</b> demandas, ĉu ŝi ametas <b>sian</b> kuraciston.','oni sin demandas cxu sxi ametas sian kuraciston','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (397,69,'ekz09_01',1,'Ĉu la flegistino venas tuj? (jes / ne)','<b>Ne</b>, la flegistino ne venas tuj.','ne|ne la flegistino ne tuj venas|ne sxi ne tuj venas|ne sxi ne venas tuj|ne la flegistino ne venas tuj|la flegistino ne venas tuj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (398,69,'ekz09_02',2,'Ĉu oni ofte svenas en koridoro? (jes / ne)','<b>Ne</b>, oni ne ofte svenas en koridoro.','ne|ne oni ne ofte svenas en koridoro|','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (399,69,'ekz09_03',3,'Kial Tom ekhaltas? (Li estas novulo. / Gerda ne plu estas tie. / Okupiĝi pri malsanuloj ne estas lia fako.)','Tom ekhaltas ĉar <b>Gerda ne plu estas tie</b>.','tom ekhaltas cxar gerda ne plu estas tie|li ekhaltas cxar gerda ne plu estas tie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (400,69,'ekz09_04',4,'Kiu sidas ĉe la muro? (Tom / Bob / linda / Gerda / la flegistino)','<b>Bob</b> sidas ĉe la muro.','bob|bob sidas cxe la muro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (401,69,'ekz09_05',5,'Ĉu Bob paroladas? (jes / ne)','<b>Ne</b>, Bob ne paroladas.','ne|ne li ne paroladas|ne bob ne paroladas|bob ne paroladas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (402,70,'ekz09_06',6,'______ diris la kuracisto? - Li diris, ke mi estu senzorga, ke mia malsano ne estas tro serioza.','<b>Kion</b> diris la kuracisto? - Li diris, ke mi estu senzorga, ke mia malsano ne estas tro serioza.','kion diris la kuracisto li diris ke mi estu senzorga ke mia malsano ne estas tro serioza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (403,70,'ekz09_07',7,'______ vi resaniĝos? - Baldaŭ. Eble post kelkaj tagoj.','<b>Kiam</b> vi resaniĝos? - Baldaŭ. Eble post kelkaj tagoj.','kiam vi resanigxos baldaux eble post kelkaj tagoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (404,70,'ekz09_08',8,'______ vi iros unue post la resaniĝo? - Unue mi iros en bonan restoracion.','<b>Kien</b> vi iros unue post la resaniĝo? - Unue mi iros en bonan restoracion.','kien vi iros unue post la resanigxo unue mi iros en bonan restoracion','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (405,70,'ekz09_09',9,'______ vi iros sola? - Ne, amikoj iros kun mi.','<b>Ĉu</b> vi iros sola? - Ne, amikoj iros kun mi.','cxu vi iros sola n amikoj iros kun mi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (406,70,'ekz09_10',10,'______ helpas vin dum la malsano? - Mia amiko Petro.','<b>Kiu</b> helpas vin dum la malsano? - Mia amiko Petro.','kiu helpas vin dum la malsano mia amiko petro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (407,70,'ekz09_11',11,'______ estas via patrino? - En sia oficejo; ŝi devas multe labori tie.','<b>Kie</b> estas via patrino? - En sia oficejo; ŝi devas multe labori tie.','kie estas via patrino en sia oficejo sxi devas multe labori tie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (408,70,'ekz09_12',12,'______ vi ne povas iri piede? - Ĉar miaj kruroj estas tute senfortaj.','<b>Kial</b> vi ne povas iri piede? - Ĉar miaj kruroj estas tute senfortaj.','kial vi ne povas iri piede cxar miaj kruroj estas tute senfortaj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (409,70,'ekz09_13',13,'______ vi ekmalsanis? - Mi ekmalsanis tre subite.','<b>Kiel</b> vi ekmalsanis? - Mi ekmalsanis tre subite.','kielvi ekmalsanis mi ekmalsanis tre subite','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (410,70,'ekz09_14',14,'______ tio okazis? - En mia laborejo.','<b>Kie</b> tio okazis? - En mia laborejo.','kie tio okazis en mia laborejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (411,70,'ekz09_15',15,'______ ili metis en vian laborlokon? - Neniun, do la laboro restas nefarita kaj atendas min.','<b>Kiun</b> ili metis en vian laborlokon? - Neniun, do la laboro restas nefarita kaj atendas min.','kiun ili metis en vian laborlokon neniun do la laboro restas nefarita kaj atendas min','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (412,70,'ekz09_16',16,'______ ili metis neniun en vian lokon? - Ĉar laboristo por mia laboro estas malofte trovebla.','<b>Kial</b> ili metis neniun en vian lokon? - Ĉar laboristo por mia laboro estas malofte trovebla.','kial ili metis neniun en vian lokon cxar laboristo por mia laboro estas malofte trovebla','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (413,71,'ekz10_01',1,'Kiu ne emas fidi la flegistinon? (Tom / Bob / Linda / Gerda / la blondulo)','<b>Tom</b> ne emas fidi la flegistinon.','tom|tom ne emas fidi la flegistinon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (414,71,'ekz10_02',2,'Kie Tom kaj Bob retrovis sin reciproke? (en lernejo / en universitato / en la urbego, kie ili vivis tiutempe)','Tom kaj Bob retrovis sin reciproke en <b>universitato</b>.','en universitato|ili retrovis sin reciproke en universitato|en universitato tom kaj bob retrovis sin reciproke|tom kaj bob retrovis sin reciproke en universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (415,71,'ekz10_03',3,'Estas ___ flegistino(j) en la universitato. (unu / du / tri / kvar / kvin)','Estas <b>unu</b> flegistino en la universitato.','unu|estas unu flegistino en la universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (416,71,'ekz10_04',4,'Pri kiu zorgas Tom? (pri Bob / pri Gerda / pri Linda / pri la flegistino)','Tom zorgas pri <b> inda</b>.','pri linda|li zorgas pri linda|tom zorgas pri linda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (417,71,'ekz10_05',5,'Ĉu Tom ŝatas la novan aventuron? (jes / ne)','<b>Ne</b> , Tom ne ŝatas la novan aventuron.','ne|ne li ne sxatas la novan aventuron|ne tom malsxatas la novan aventuron|ne li malsxatas la novan aventuron|li ne sxatas la novan aventuron|ne tom ne sxatas la novan aventuron','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (418,71,'ekz10_06',6,'Kiun amas Tom? (Gerdan / Lindan / Rongan / la flegistinon)','Tom amas </b>Lindan</b> .','lindan|li amas lindan','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (419,72,'ekz10_07',7,'Tom [*] Linda estas student[*]. En universitat[*] restoraci[*] ili observas blond[*] junul[*], kiu agas plej strange: dum li parolas [*] knabino, li kaŝ[*] metas io[*] en ŝi[*] kafotaso[*].','Tom <b>kaj</b>  Linda estas student<b>oj</b>. En universitat<b>a</b> restoraci<b>o</b> ili observas blond<b>an</b> junul<b>on</b>, kiu agas plej strange: dum li parolas <b>al</b> knabino, li kaŝ<b>e</b> metas io<b>n</b> en ŝi<b>an</b> kafotaso<b>n</b>.','tom kaj linda estas studentoj en universitata restoracio ili observas blondan junulon kiu agas plej strange dum li parolas al knabino li kasxe metas ion en sxian kafotason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (420,72,'ekz10_08',8,'Eble estis drogo, ĉar tuj post ki[*] ŝi ekstaras kaj forlasas la restoracio[*], [*] la koridoro[*] ŝi jam perdas la konscion. Intertemp[*], Bob sid[*]is ĉe Tom kaj Linda.','Eble estis drogo, ĉar tuj post ki<b>am</b> ŝi ekstaras kaj forlasas la restoracio<b>n</b>, en la koridor<b>o</b> ŝi jam perdas la konscion. Intertemp<b>e</b>, Bob sid<b>iĝ</b>is ĉe Tom kaj Linda.','eble estis drogo cxar tuj post kiam sxi ekstaras kaj forlasas la restoracion en la koridoro sxi jam perdas la konscion intertempe bob sidigxis cxe tom kaj linda.','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (421,72,'ekz10_09',9,'Li povas rakont[*] al ili[*], ki[*] estas la knabino: ŝi estas Gerda, nova instruist[*] pri kriptaĵoscienco ([*]novaj sekretaj lingvoj). Ronga, la profesoro pri lingvistiko, volis, ke ŝi ven[*] al la universitato [*] instru[*] kaj labor[*] kun li.','Li povas rakont<b>i</b> al <b>ili</b>, kiu estas la knabino: ŝi estas Gerda, nova instruist<b>ino</b> pri kriptaĵoscienco (<b>mal</b>novaj sekretaj lingvoj). Ronga, la profesoro pri lingvistiko, volis, ke ŝi ven<b>u</b> al la universitato por instrui kaj labori kun li.','li povas rakonti al ili kiu estas la knabino sxi estas gerda nova instruistino pri kriptajxoscienco malnovaj sekretaj lingvoj ronga la profesoro pri lingvistiko volis ke sxi venu al la universitato por instrui kaj labori kun li','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (422,72,'ekz10_10',10,'Kiam ili aŭdas ŝi[*] falbruon el la koridor[*], Bob kaj Tom rapidas por helpi ŝi[*]. Bob metas ŝin bone, tiel [*] ŝi kuŝu komforte, kaj Tom ir[*] vok[*] flegistinon.','Kiam ili aŭdas ŝi<b>an</b> falbruon el la koridor<b>o</b>, Bob kaj Tom rapidas por helpi ŝi<b>n</b>. Bob metas ŝin bone, tiel <b>ke</b> ŝi kuŝu komforte, kaj Tom iras voki flegistinon.','kiam ili auxdas sxian falbruon el la koridoro bob kaj tom rapidas por helpi sxin bob metas sxin bone tiel ke sxi kusxu komforte kaj tom iras voki flegistinon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (423,72,'ekz10_11',11,'Tiu flegistino, dika, grasa kaj parolema, nur post long[*] diskut[*] kun Tom, konsciiĝas [*] tio, ke la afero urĝas. Se ŝi est[*] pli zorgema, ŝi [*] rapidus kaj eble ne okazus jeno:','Tiu flegistino, dika, grasa kaj parolema, nur post long<b>a</b> diskut<b>ado</b> kun Tom, konsciiĝas <b>pri</b> tio, ke la afero urĝas. Se ŝi est<b>us</b> pli zorgema, ŝi <b>pli</b> rapidus kaj eble ne okazus jeno:','tiu flegistino dika grasa kaj parolema nur post longa diskutado|diskuto kun tom konsciigxas pri tio ke la afero urgxas se sxi estus pli zorgema sxi pli rapidus kaj eble ne okazus jeno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (424,72,'ekz10_12',12,'Kiam Tom fine [*]venas kun la flegistino, Gerda estas for, kaj Bob sidas ĉe la koridor[*] mur[*], bat[*]a surkape. Kion [*]tempe faras Linda? Ŝi pli kaj pli [*]trankvil[*]as, lasite sola [*] la universitata restoracio kun la blond[*] strang[*].','Kiam Tom fine <b>al</b>venas kun la flegistino, Gerda estas for, kaj Bob sidas ĉe la koridor<b>a</b> mur<b>o</b>, bat<b>ita</b> surkape. Kion <b>dum</b>tempe faras Linda? Ŝi pli kaj pli <b>mal</b>trankvil<b>iĝ</b>as, lasite sola <b>en</b> la universitata restoracio kun la blond<b>a</b> strang<b>ulo</b>.','kiam tom fine alvenas kun la flegistino gerda estas for kaj bob sidas cxe la koridora muro batita surkape kion tiutempe faras linda sxi pli kaj pli maltrankviligxas lasite sola en la universitata restoracio kun la blonda strangulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (425,72,'ekz10_13',13,'Ŝi observ[*] lin, kaj kiam li eliras tra la pordo alurb[*], ŝi[*] sekvas li[*]. Linda estas junulino iom tim[*], certe belega. Tom am[*]as ŝin; li havas okulojn nur [*] ŝi.','Ŝi observ<b>adas</b> lin, kaj kiam li eliras tra la pordo alurb<b>en</b>, <b>ŝi</b> sekvas li<b>n</b>. Linda estas junulino iom tim<b>ema</b>, certe belega. Tom am<b>eg</b>as ŝin; li havas okulojn nur <b>por</b> ŝi.','sxi observas|observadas lin kaj kiam li eliras tra la pordo alurben|alurba sxi sekvas lin linda estas junulino iom timema certe belega tom amegas sxin li havas okulojn nur por sxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (426,72,'ekz10_14',14,'Li zorgas pri ŝi. Ĉu ŝi trov[*] en danĝero? Ki[*], fakte, ŝi iros? Kaj Gerda, kien ŝi[*] foriĝis? Ki[*] okaz[*] kun ŝi? La afero [*] pli kaj pli mistera!','Li zorgas pri ŝi. Ĉu ŝi trov<b>iĝas</b> en danĝero? Ki<b>en</b>, fakte, ŝi iros? Kaj Gerda, kien <b>ŝi</b> foriĝis? Ki<b>o</b> okaz<b>is</b> kun ŝi? La afero <b>iĝas</b> pli kaj pli mistera!','li zorgas pri sxi cxu sxi trovigxas en dangxero kien fakte sxi iros kaj gerda kien sxi forigxis kio okazis kun sxi la afero igxas pli kaj pli mistera','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (427,73,'ekz11_01',1,'De kiu Linda petas helpon?','Linda petas helpon de la <b>juna blonda viro</b>.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (428,73,'ekz11_02',2,'Ĉu la juna blonda viro estas kontenta?','Ne, la viro ne estas kontenta.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (429,73,'ekz11_03',3,'Kien la blondulo volas veturi?','La blondulo volas veturi en la urbon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (430,73,'ekz11_04',4,'Kion volas Linda de li?','Linda volas ke la blondulo akceptu ŝin en lia aŭto ĝis la urbo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (431,73,'ekz11_05',5,'Ĉu la blondulo konsentas?','Jes, la blondulo konsentas.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (432,73,'ekz11_06',6,'Pri kio Linda parolas dum la veturo?','Linda parolis pri sia aŭto.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (433,73,'ekz11_07',7,'Ĉu la blondulo estas parolema?','Ne, la blondulo ne estas parolema.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (434,74,'ekz11_08',8,'Mi volis aspekti pli bele ol normale. Mi ___is min pli bela antaŭ la promenado.<br/>Antaŭ la promenado, mi ___is pli bela. Penjo ridis pri mi, ĉar mi plibel___is min. Ni veturis en la urbon.<br/>Vetur___is nin Penjo. Ŝi ___is mia amikino tuj post mia unua tago en la laborejo.<br/>Antaŭ la forveturo ŝi trovis min en mia ĉambro, kie mi plibel___is.','Mi volis aspekti pli bele ol normale. Mi <b>ig</b>is min pli bela antaŭ la promenado.<br/>Antaŭ la promenado, mi <b>iĝ</b>is pli bela. Penjo ridis pri mi, ĉar mi plibel<b>ig</b>is min. Ni veturis en la urbon.<br/>Vetur<b>ig</b>is nin Penjo. Ŝi <b>iĝ</b>is mia amikino tuj post mia unua tago en la laborejo.<br/>Antaŭ la forveturo ŝi trovis min en mia ĉambro, kie mi plibel<b>iĝ</b>is.','mi volis aspekti pli bele ol normale mi igis min pli bela antaux la promenado<br/>antaux la promenado mi igxis pli bela penjo ridis pri mi cxar mi plibeligis min ni veturis en la urbon<br/>veturigis nin penjo sxi igxis mia amikino tuj post mia unua tago en la laborejo<br/>antaux la forveturo sxi trovis min en mia cxambro kie mi plibeligxis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (435,74,'ekz11_09',9,'La urbo trov___as tro malproksime de nia laborejo por iri piede.<br/>Penjo ne havas aŭton, sed ŝi sukcesis hav___i al si la aŭton de Bob.','La urbo trov<b>iĝ</b>as tro malproksime de nia laborejo por iri piede.<br/>Penjo ne havas aŭton, sed ŝi sukcesis hav<b>ig</b>i al si la aŭton de Bob.','la urbo trovigxas tro malproksime de nia laborejo por iri piede<br/>penjo ne havas auxton sed sxi sukcesis havigi al si la auxton de bob','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (436,74,'ekz11_10',10,'Post longa promenado en la urbo ni volis eksidi en trinkejo.<br/>Tuj post kiam ni sid___is ĉe tablo, iu ulo turnis sin. Li turn___is al ni kaj ekrigardis nin.<br/>Ni eksentis nin malbonaj. Lia rigardado malbonsent___is nin. Ni devis agi.<br/>Ni ne plu restis sidaj, ni restar___is, tiel dev___ante lin forturni sin.<br/>Li komprenis, ke li ĝenis nin ade rigardante al ni.<br/>Ni kompren___is al li, ke rigardado povas esti maldiskreta.','Post longa promenado en la urbo ni volis eksidi en trinkejo.<br/>Tuj post kiam ni sid<b>iĝ</b>is ĉe tablo, iu ulo turnis sin. Li turn<b>iĝ</b>is al ni kaj ekrigardis nin.<br/>Ni eksentis nin malbonaj. Lia rigardado malbonsent<b>ig</b>is nin. Ni devis agi.<br/>Ni ne plu restis sidaj, ni restar<b>iĝ</b>is, tiel dev<b>ig</b>ante lin forturni sin.<br/>Li komprenis, ke li ĝenis nin ade rigardante al ni.<br/>Ni kompren<b>ig</b>is al li, ke rigardado povas esti maldiskreta.','post longa promenado en la urbo ni volis eksidi en trinkejo<br/>tuj post kiam ni sidigxis cxe tablo iu ulo turnis sin li turnigxis al ni kaj ekrigardis nin<br/>ni eksentis nin malbonaj lia rigardado malbonsentigis nin ni devis agi<br/>ni ne plu restis sidaj ni restarigxis tiel devigante lin forturni sin<br/>li komprenis ke li gxenis nin ade rigardante al ni<br/>ni komprenigis al li ke rigardado povas esti maldiskreta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (437,74,'ekz11_11',11,'Mi lernas multon en la urbo. Ĝi lern___as min pri la vivo.<br/>Multhoma kunvivado lern___as kvazaŭ aŭtomate en la urbo.','Mi lernas multon en la urbo. Ĝi lernigas min pri la vivo.<br/>Multhoma kunvivado lerniĝas kvazaŭ aŭtomate en la urbo.','mi lernas multon en la urbo gxi lernigas min pri la vivo<br/>multhoma kunvivado lernigxas kvazaux auxtomate en la urbo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (438,75,'ekz12_01',1,'Kion Bob tuj deziras?','Bob deziras ion por trinki.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (439,75,'ekz12_02',2,'Kie oni povas trovi brandon?','Oni povas trovi brandon en la ĉambro de la flegistino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (440,75,'ekz12_03',3,'Kion Bob trinkas unue?','Bob unue trinkas akvon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (441,75,'ekz12_04',4,'Ĉu li povas bone klarigi, kio okazis?','Ne, Bob ne povas klarigi tion, kio okazis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (442,75,'ekz12_05',5,'Ĉu li aŭdis bruon?','Ne, Bob aŭdis neniun bruon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (443,75,'ekz12_06',6,'Ĉu Bob vere mortis?','Ne, Bob ne vere mortis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (444,76,'ekz12_07',7,'{Linda} rigardas al {Linda} en la spegulo.','<b>Ŝi</b> rigardas <b>sin</b> en la spegulo.','sxi rigardas sin ','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (445,76,'ekz12_08',8,'{Tom} rigardas al {la blondulo}.','<b>Li rigardas <b>lin</b>.','li rigardas lin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (446,76,'ekz12_09',9,'{Tom} rigardas al {la} kunulo {de Tom}.','<b>Li</b> rigardas <b>sian</b> kunulon.','li rigardas sian kunulon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (447,76,'ekz12_10',10,'{Tom} rigardas al {la} kunulo {de la blondulo}.','<b>Li</b> rigardas <b>lian</b> kunulon.','li rigardas lian kunulon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (448,76,'ekz12_11',11,'{La} amiko {de Bob} amas {Lindan}.','<b>Lia</b> amiko amas <b>ŝin</b>.','lia amiko amas sxin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (449,76,'ekz12_12',12,'{La} amikino {de Tom} rigardas {la amikinon de Tom} en la spegulo.','<b>Lia</b> amikino rigardas <b>sin</b> en la spegulo.','lia amikino rigardas sin en la spegulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (450,76,'ekz12_13',13,'{La} amikino {de Ivano} amas {Ivanon}.','<b>Lia</b> amikino amas <b>lin</b>.','lia amikino amas lin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (451,76,'ekz12_14',14,'{La blondulo} estas en {la} aŭto {de la blondulo}.','<b>Li</b> estas en <b>sia</b> aŭto.','li estas en sia auto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (452,76,'ekz12_15',15,'Gerda estas en la aŭto de {la} amiko {de Gerda}.','Gerda estas en la aŭto de <b>sia</b> amiko.','gerda estas en la auxto de sia amiko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (453,76,'ekz12_16',16,'{Petro kaj Ivano} kaŝas {Petron kaj Ivanon} sub la tablo.','<b>Ili</b> kaŝas <b>sin</b> sub la tablo.','ili kasxas sin sub la tablo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (454,77,'ekz13_01',1,'Kie sidas Linda?','Linda sidas en la veturilo de la juna blondulo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (455,77,'ekz13_02',2,'Kial ŝi volas paroli kun la blondulo?','Ĉar ŝi deziras ricevi informojn pri sia stranga kunulo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (456,77,'ekz13_03',3,'Ĉu la blondulo volas klarigi siajn zorgojn?','Ne, la blondulo ne volas klarigi siajn zorgojn.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (457,77,'ekz13_04',4,'Kiel Linda klarigas sian scivolon?','Ŝi trovas la silenton peza kaj la vojon pli kaj pli longa.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (458,77,'ekz13_05',5,'Kien precize veturas la blondulo?','Ni ne scias kien precize veturas la blondulo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (459,77,'ekz13_06',6,'Kie nun staras Linda?','Ŝi staras ie en la urbocentro.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (460,77,'ekz13_07',7,'Kion ŝi timas vidante la forveturantan aŭton?','Ŝi timas, ke la blondulo suspektas ŝin esti spionino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (461,78,'ekz13_08',8,'antaŭa parto de la kapo :','vizaĝo','vizagxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (462,78,'ekz13_09',9,'atentinda :','grava','grava','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (463,78,'ekz13_10',10,'centro de supera instruado :','universitato','universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (464,78,'ekz13_11',11,'ĉi tiam :','nun','nun','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (465,78,'ekz13_12',12,'diri "bonan tagon" :','saluti','saluti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (466,78,'ekz13_13',13,'dudek kvar horoj :','tago','tago','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (467,78,'ekz13_14',14,'eltrovisto de sekretoj :','spiono','spiono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (468,78,'ekz13_15',15,'en la tempo de :','dum','dum','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (469,78,'ekz13_16',16,'faradi :','agi','agi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (470,78,'ekz13_17',17,'fina parto de brako :','mano','mano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (471,78,'ekz13_18',18,'havanta ĝustan opinion :','prava','prava','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (472,78,'ekz13_19',19,'irigi laŭ la ĝusta vojo :','direkti','direkti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (473,78,'ekz13_20',20,'juna vira homo :','knabo','knabo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (474,78,'ekz13_21',21,'kiun oni amas aŭ ŝatas :','kara','kara','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (475,78,'ekz13_22',22,'konsenti, ke iu faru ion :','permesi','permesi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (476,78,'ekz13_23',23,'lernanto ĉe universitato :','studento','studento','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (477,78,'ekz13_24',24,'malnormala :','stranga','stranga','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (478,78,'ekz13_25',25,'ne konata, ne komprenata :','mistera','mistera','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (479,78,'ekz13_26',26,'ne la sama :','alia','alia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (480,78,'ekz13_27',27,'ne ludema, grava :','serioza','serioza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (481,78,'ekz13_28',28,'nek kuŝi, nek sidi, nek iel moviĝi :','stari','stari','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (482,78,'ekz13_29',29,'pala koloro de haroj :','blondo','blondo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (483,78,'ekz13_30',30,'peti informon :','demandi','demandi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (484,78,'ekz13_31',31,'pli ŝati :','preferi','preferi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (485,78,'ekz13_32',32,'sciigi, ke oni volas ion ricevi :','peti','peti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (486,78,'ekz13_33',33,'sin movi piede :','iri','iri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (487,78,'ekz13_34',34,'ŝajni laŭvide :','aspekti','aspekti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (488,78,'ekz13_35',35,'ŝategi :','ami','ami','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (489,78,'ekz13_36',36,'tie, kie muroj kuniras :','angulo','angulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (490,78,'ekz13_37',37,'videbligi :','montri','montri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (491,79,'ekz14_01',1,'Ĉu Gerda sciis, kie ŝi estas?','Ne Gerda ne scias kie ŝi estas.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (492,79,'ekz14_02',2,'Kiel aspektis la ĉambro, en kiu Gerda kuŝas?','La ĉambro, en kiu Gerda kuŝas aspektis nekonata, malbela kaj malpura.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (493,79,'ekz14_03',3,'Kial Gerda estis lacega?','Gerda estis lacega, ĉar mankis al ŝi forto, kaj ŝia tuta korpo iom doloris.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (494,79,'ekz14_04',4,'Ĉu ŝi ŝatis sian malliberecon?','Ne, ŝi sentis sin malĝoja.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (495,79,'ekz14_05',5,'Kiel ŝi provis liberiĝi?','Ŝi provis malfermi la fenestron kaj la pordon sed ne sukcesis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (496,79,'ekz14_06',6,'Kio vekis ŝin?','Vekis ŝin infana voĉo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (497,79,'ekz14_07',7,'Pri kio la infanoj parolis?','Ili parolis pri la fakto, ke estas malpermesite ludi ĉi tie.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (498,79,'ekz14_08',8,'Kial la infanoj ne helpis ŝin?','La infanoj pensis, ke estas fantomo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (499,79,'ekz14_09',9,'Kun kiu Gerda estis post la forkuro de la infanoj?','Poste, Gerda estis kun neniu, ŝi estis sola.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (500,80,'ekz14_10',10,'afero :','aĵo','ajxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (501,80,'ekz14_11',11,'akiri scion :','lerni','lerni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (502,80,'ekz14_12',12,'aspekti :','ŝajni','sxajni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (503,80,'ekz14_13',13,'diri reage al demando :','respondi','respondi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (504,80,'ekz14_14',14,'dormigilo :','drogo','drogo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (505,80,'ekz14_15',15,'en kiu tempo :','kiam','kiam','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (506,80,'ekz14_16',16,'enhavanta ĉion enhaveblan :','plena','plena','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (507,80,'ekz14_17',17,'facile videbla, komprenebla :','evidenta','evidenta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (508,80,'ekz14_18',18,'fari por si ideon pri io :','imagi','imagi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (509,80,'ekz14_19',19,'havi ideon pri :','koni','koni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (510,80,'ekz14_20',20,'havi similan opinion :','konsenti','konsenti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (511,80,'ekz14_21',21,'io el tre malgrandaj partetoj :','pulvoro','pulvoro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (512,80,'ekz14_22',22,'io, kio restu kaŝita, ne konata :','sekreto','sekreto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (513,80,'ekz14_23',23,'iradi pro plezuro :','promeni','promeni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (514,80,'ekz14_24',24,'komunikaĵo :','mesaĝo','mesagxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (515,80,'ekz14_25',25,'kontraŭ la normala saĝo :','absurda','absurda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (516,80,'ekz14_26',26,'lernigi :','instrui','instrui','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (517,80,'ekz14_27',27,'malgranda :','eta','eta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (518,80,'ekz14_28',28,'malmontri :','kaŝi','kasxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (519,80,'ekz14_29',29,'malproksima :','fora','fora','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (520,80,'ekz14_30',30,'parto :','peco','peco','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (521,80,'ekz14_31',31,'pensaĵo :','ideo','ideo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (522,80,'ekz14_32',32,'pli alta ol :','super','super','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (523,80,'ekz14_33',33,'rapida, ne atendita :','subita','subita','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (524,80,'ekz14_34',34,'rilatanta duo :','paro','paro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (525,80,'ekz14_35',35,'sciigi, konigi :','komuniki','komuniki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (526,80,'ekz14_36',36,'tio, pri kio io estas :','temo','temo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (527,80,'ekz14_37',37,'veraĵo :','fakto','fakto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (528,80,'ekz14_38',38,'voli havi :','deziri','deziri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (529,80,'ekz14_39',39,'vorto, per kiu persono estas konata :','nomo','nomo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (530,81,'ekz15_01',1,'Kun kiu parolas Tom?','Tom parolas kun Linda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (531,81,'ekz15_02',2,'Ĉu ŝi bone dormis?','Ne, ŝi malbone dormis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (532,81,'ekz15_03',3,'Ĉu Tom raportas unue?','Ne, Linda raportos unue.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (533,81,'ekz15_04',4,'Ĉu ŝi sukcesis paroligi la blondulon en la aŭto?','Ne, ŝi ne sukcesis paroligi lin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (534,81,'ekz15_05',5,'Kie ŝi poste vidis lin?','Ŝi vidis lin eliranta el la poŝtoficejo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (535,81,'ekz15_06',6,'Kion la blondulo aĉetis?','La blondulo verŝajne aĉetis dolĉaĵon kaj ĉokoladon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (536,81,'ekz15_07',7,'Kial Linda ofte irus al la vendejo por multon aĉeti?','Linda ofte irus al la vendejo ĉar ŝi ŝatas aĉeti dolĉaĵon kaj ĉokoladon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (537,81,'ekz15_08',8,'Kial ŝi tamen ne faras tion?','Ŝi ne faras tion pro la timo dikiĝi.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (538,81,'ekz15_09',9,'Kion trinkis Linda?','Ŝi trinkis tason da teo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (539,82,'ekz15_10',10,'al ekster :','el','el','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (540,82,'ekz15_11',11,'atente rigardi :','observi','observi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (541,82,'ekz15_12',12,'ĉiuj el la du :','ambaŭ','ambaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (542,82,'ekz15_13',13,'danĝero, necerteco :','risko','risko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (543,82,'ekz15_14',14,'daŭre esti en la sama loko :','resti','resti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (544,82,'ekz15_15',15,'ekmalhavi :','perdi','perdi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (545,82,'ekz15_16',16,'esti senkonscia, sed sana :','dormi','dormi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (546,82,'ekz15_17',17,'faciligi la agadon :','helpi','helpi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (547,82,'ekz15_18',18,'fina parto de kruro :','piedo','piedo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (548,82,'ekz15_19',19,'interparoli pri io :','diskuti','diskuti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (549,82,'ekz15_20',20,'io, kio funkcias per si mem :','aŭtomato','auxtomato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (550,82,'ekz15_21',21,'iri malantaŭ io :','sekvi','sekvi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (551,82,'ekz15_22',22,'laŭte peti, ke iu venu :','voki','voki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (552,82,'ekz15_23',23,'malbela aŭdaĵo :','bruo','bruo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (553,82,'ekz15_24',24,'maltago :','nokto','nokto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (554,82,'ekz15_25',25,'motora veturilo :','aŭto','auxto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (555,82,'ekz15_26',26,'ne alia :','sama','sama','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (556,82,'ekz15_27',27,'ne en :','ekster','ekster','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (557,82,'ekz15_28',28,'ne esti mortinta :','vivi','vivi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (558,82,'ekz15_29',29,'noktiĝo :','vespero','vespero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (559,82,'ekz15_30',30,'parto de domo :','ĉambro','cxambro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (560,82,'ekz15_31',31,'parto de la korpo, kie estas la okuloj :','kapo','kapo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (561,82,'ekz15_32',32,'pensanta :','konscia','konscia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (562,82,'ekz15_33',33,'post mallonga tempo :','baldaŭ','baldaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (563,82,'ekz15_34',34,'resanigi :','kuraci','kuraci','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (564,82,'ekz15_35',35,'doni sciigon :','informi','informi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (565,82,'ekz15_36',36,'sep tagoj :','semajno','semajno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (566,82,'ekz15_37',37,'tio, kion oni pensas pri iu temo :','opinio','opinio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (567,82,'ekz15_38',38,'tomatokolora :','ruĝa','rugxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (568,82,'ekz15_39',39,'zorgi pri malsanulo :','flegi','flegi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (569,83,'ekz16_01',1,'Kion faris la junulo, post kiam li eliris el la vendejo?','Li metis la sakon en la veturilon kaj ŝlosis ĝin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (570,83,'ekz16_02',2,'Kien li subite eniris?','Li eniris restoracion.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (571,83,'ekz16_03',3,'Kial Linda hezitis sekvi lin tien?','Ŝi ne volis tro riski, ke li vidos kaj rekonos ŝin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (572,83,'ekz16_04',4,'Kiel aspektis la restoracio?','La restoracio aspektis turka aŭ pseŭdoturka.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (573,83,'ekz16_05',5,'Kion manĝis Linda?','Linda manĝis bonegan supon, ian viandon, poste salaton kaj kukon kaj finfine trinkis kafon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (574,83,'ekz16_06',6,'Kion faris la soldatoj?','Ili faris bruegon, kriegis, kriaĉis kaj ekbatis unu la alian.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (575,83,'ekz16_07',7,'Kia estas Linda?','Ŝi estas kuraĝa.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (576,83,'ekz16_08',8,'Kio estas Linda?','Ŝi estas perfekta virino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (577,83,'ekz16_09',9,'Kion rimarkas Linda post la telera milito?','La blindulo ne plu estis en la restoracio.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (578,84,'ekz16_10',10,'Kun _____ sako li eliris? - Li eliris kun papera sako.','Kun <b>kia</b> sako li eliris? - Li eliris kun papera sako.','kun kia sako li eliris li eliris kun papera sako|kia|kun kia sako li eliris','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (579,84,'ekz16_11',11,'_____ li forveturos? - Mi pensas, ke li forveturos aŭte.','<b>Kiel</b> li forveturos? - Mi pensas, ke li forveturos aŭte.','kiel li forveturos mi pensas ke li forveturos auxte|kiel|kiel li forveturos','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (580,84,'ekz16_12',12,'_____ numeron vi notis? - Mi notis lian aŭtan numeron.','<b>Kian</b> numeron vi notis? - Mi notis lian aŭtan numeron.','kian|kian numeron vi notis|kian numeron vi notis mi notis lian auxtan numeron','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (581,84,'ekz16_13',13,'_____ vi sekvis lin? - Mi sekvis lin iom malproksime.','<b>Kiel</b> vi sekvis lin? - Mi sekvis lin iom malproksime.','kiel vi sekvis lin|kiel|kiel vi sekvi lin mi sekvi lin iom malproksime','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (582,84,'ekz16_14',14,'_____ li estis vestita? - Li estis vestita per multkoloraj vestoj.','<b>Kiel</b> li estis vestita? - Li estis vestita per multkoloraj vestoj.','kiel li estis vestita|kiel|kiel li estis vestita li estis vestita per multkoloraj vestoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (583,84,'ekz16_15',15,'_____ vi sentas vin hodiaŭ? - Mi sentas min tre bone, dankon.','<b>Kiel</b> vi sentas vin hodiaŭ? - Mi sentas min tre bone, dankon.','kiel|kiel vi sentas vin hodiaux|kiel vi sentas vin hodiaux mi sentas min tre bone dankon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (584,84,'ekz16_16',16,'_____ estas via sano? - Multe pli bona ol hieraŭ.','<b>Kia</b> estas via sano? - Multe pli bona ol hieraŭ.','kia|kia estas via sano|kia estas via sano multe pli bona il hieraux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (585,84,'ekz16_17',17,'_____ virojn ŝatas Linda? - Ŝi ŝatas blondulojn.','<b>Kiajn</b> virojn ŝatas Linda? - Ŝi ŝatas blondulojn.','kiajn|kiajn virojn sxatas linda|kiajn virojn sxatas linda sxi sxatas blondulojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (586,84,'ekz16_18',18,'_____ vi ekkonis lin? - Ni estis en la sama lernejo.','<b>Kiel</b> vi ekkonis lin? - Ni estis en la sama lernejo.','kiel|kiel vi ekkonis lin|kiel vi ekkonis lin ni estis en la sama lernejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (587,84,'ekz16_19',19,'_____ restas Gerda? - Ŝi restas soifa.','<b>Kia</b> restas Gerda? - Ŝi restas soifa.','kia|kia restas gerda|kia restas gerda sxi restas soifa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (588,85,'ekz17_01',1,'Pri kio parolas la policano?','Li parolas pri la malapero de Gerda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (589,85,'ekz17_02',2,'Kion precize instruas Gerda?','Gerda instruas historion sed ŝi estas specialisto pri la sekretaj lingvoj de la dek-sepa kaj dek-oka jarcentoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (590,85,'ekz17_03',3,'Kiu estas la alta blondulo?','La blondulo estas la frato de fraŭlino Marta, unu el la universitataj flegistinoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (591,85,'ekz17_04',4,'Kiu estas Marta?','Marta estas unu el la universitataj flegistinoj, tiu, kiun Tom venigis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (592,85,'ekz17_05',5,'Kial oni ankoraŭ ne pridemandis la blondulon?','Oni ankoraŭ ne pridemandis lin, por ke li ne suspektu, ke oni suspektas lin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (593,85,'ekz17_06',6,'Kiel la policano esperas retrovi Gerdan?','Li esperas, ke la blondulo kondukos lin al Gerda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (594,86,'ekz17_07',7,'Mi multe lernadis ___ lingvistiko ___ sukcesi en la universitato.','Mi multe lernadis <b>pri</b> lingvistiko <b>por</b> sukcesi en la universitato.','mi multe lernadis pri lingvistiko por sukcesi en la universitato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (595,86,'ekz17_08',8,'___ la malfrua horo mi decidis veturi ___ aŭto, ___ esti pli rapida.','<b>Pro</b> la malfrua horo mi decidis veturi <b>per</b> aŭto, <b>por</b> esti pli rapida.','pro la malfrua horo mi decidis veturi per auxto por esti pli rapida.','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (596,86,'ekz17_09',9,'___ kio temas? - Mi ne scias; mi ĵus alvenis.','<b>Pri</b> kio temas? - Mi ne scias; mi ĵus alvenis.','pri kio temas mi ne scias mi jxus alvenis','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (597,86,'ekz17_10',10,'Mi dankas vin ___ via helpo.','Mi dankas vin <b>pro</b> via helpo.','mi dankas vin pro via helpo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (598,86,'ekz17_11',11,'___ la bruo en mia angulo, estis ___ mi tre malfacile aŭdi.','<b>Pro</b> la bruo en mia angulo, estis <b>por</b> mi tre malfacile aŭdi.','pro la bruo en mia angulo estis por mi tre malfacile auxdi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (599,86,'ekz17_12',12,'Mi scias certe ___ tio, ke mi vidis ĝin ___ miaj propraj okuloj.','Mi scias certe <b>pro</b> tio, ke mi vidis ĝin <b>per</b> miaj propraj okuloj.','mi scias certe pro tio ke mi vidis gxin per miaj propraj okuloj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (600,86,'ekz17_13',13,'Ŝi venis ___ instrui kriptaĵo-sciencon, sed mi neniam aŭdis ___ tiu fako.','Ŝi venis <b>por</b> instrui kriptaĵo-sciencon, sed mi neniam aŭdis <b>pri</b> tiu fako.','sxi venis por instrui kriptajxo-sciencon sed mi neniam auxdis pri tiu fako','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (601,87,'ekz17_14',14,'Marko pensas, ke {Marko} rompis {la} tason {de Marko}.','Marko pensas, ke <b>li</b> rompis <b>sian</b> tason.','marko pensas ke li rompis sian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (602,87,'ekz17_15',15,'Marko pensas, ke {Tom} rompis {la} tason {de Marko}.','Marko pensas, ke <b>li</b> rompis <b>lian</b> tason.','marko pensas ke li rompis lian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (603,87,'ekz17_16',16,'Tom pensas, ke {Tom} rompis {la} tason {de Marko}.','Tom pensas, ke <b>li</b> rompis <b>lian</b> tason.','tom pensas ke li rompis lian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (604,87,'ekz17_17',17,'Tom pensas, ke {Tom} rompis {la} tason {de Tom}.','Tom pensas, ke <b>li</b> rompis <b>sian</b> tason.','tom pensas ke li rompis sian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (605,87,'ekz17_18',18,'Tom pensas, ke {Marko} rompis {la} tason {de Tom}.','Tom pensas, ke <b>li</b> rompis <b>lian</b> tason.','tom pensas ke li rompis lian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (606,87,'ekz17_19',19,'De Petro {Linda} aŭdas malveran rakonton pri {Linda}.','De Petro <b>ŝi</b> aŭdas malveran rakonton pri <b>si</b>.','de petro sxi auxdas malveran rakonton pri si','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (607,87,'ekz17_20',20,'De Petro {Linda} aŭdas, ke Tom rakontis malveraĵon pri {Linda}.','De Petro <b>ŝi</b> aŭdas, ke Tom rakontis malveraĵon pri <b>ŝi</b>.','de petro sxi auxdas ke tom rakontis malverajxon pri sxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (608,87,'ekz17_21',21,'Ivano scias, kie {Petro} kaŝis {la} tason {de Petro}, sed {Ivano} ne scias, kie {Petro} kaŝis {la} tason {de Ivano}.','Ivano scias, kie <b>li</b> kaŝis <b>sian</b> tason, sed <b>li</b> ne scias, kie <b>li</b> kaŝis <b>lian</b> tason.','ivano scias kie li kasxis sian tason sed li ne scias kie li kasxis lian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (609,87,'ekz17_22',22,'{Linda} timas, ke la spiono sekvas {Lindan} tra la urbo.','<b>Ŝi</b> timas, ke la spiono sekvas <b>ŝin</b> tra la urbo.','sxi timas ke la spiono sekvas sxin tra la urbo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (610,87,'ekz17_23',23,'{Petro} timas, ke {Linda} amas {Lindan} pli ol {Petron}.','<b>Li</b> timas, ke <b>ŝi</b> amas <b>sin</b> pli ol <b>lin</b>.','li timas ke sxi amas sin pli ol lin','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (611,87,'ekz17_24',24,'{Linda} ĉiam pensas, ke {la} opinio {de Linda} estas prava.','<b>Ŝi</b> ĉiam pensas, ke <b>ŝia</b> opinio estas prava.','sxi cxiam pensas ke sxia opinio estas prava','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (612,87,'ekz17_25',25,'Marko diras, ke {Petro} perdis {la} tason {de Marko}.','Marko diras, ke <b>li</b> perdis <b>lian</b> tason.','marko diras ke li perdis lian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (613,87,'ekz17_26',26,'Sed Petro diras, ke {Marko} perdis {la} tason {de Marko}.','Sed Petro diras, ke <b>li</b> perdis <b>sian</b> tason.','sed petro diras ke li perdis sian tason','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (614,87,'ekz17_27',27,'Linda ne scias, ke {Marko} {Lindan} amas.','Linda ne scias, ke <b>li ŝin</b> amas.','linda ne scias ke li sxin amas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (615,87,'ekz17_28',28,'Linda ne scias, ke {Marko} {Gerdan} amas.','Linda ne scias, ke <b>li ŝin</b> amas.','linda ne scias ke li sxin amas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (616,88,'ekz18_01',1,'Kiu parolas komence de la ĉapitro, kaj pri kio?','Komence de la ĉapitro, la aĉulo parolas pri la situacio de Gerda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (617,88,'ekz18_02',2,'Kiel sentas sin Gerda?','Gerda sentas sin pli kaj pli malforta.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (618,88,'ekz18_03',3,'Kiom facile ŝi legis la dokumenton?','Komence, ŝi legis ĝin malfacile, sed iom post iom ŝia memoro plene revenis.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (619,88,'ekz18_04',4,'Kial ŝi ne diras, kio estas skribita en la dokumento?','Ŝi ne diras, kio estas skribita en la dokumento ĉar antaŭ longe ŝi promesis al Profesoro Kosadi, ke pri tio ŝi ĉiam silentos.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (620,88,'ekz18_05',5,'Kion kunportas la aĉulo, kiam li revenas, kaj kial?','La aĉulo revenas kun radio-kaj-kased-aparato por aŭdigi la voĉon de la filino de Gerda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (621,88,'ekz18_06',6,'Kia estas la voĉo de la filino de Gerda?','La voĉo de la filino de Gerda estas eta, plenda kaj plorema.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (622,88,'ekz18_07',7,'Kion Gerda ricevas por manĝi?','Ŝi ricevas belegan pomon por manĝi.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (623,89,'ekz18_08',8,'ama(n)to aŭ ŝata(n)to:','amiko','amiko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (624,89,'ekz18_09',9,'ameti:','ŝati','sxati','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (625,89,'ekz18_10',10,'centro:','mezo','mezo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (626,89,'ekz18_11',11,'en kiu loko:','kie','kie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (627,89,'ekz18_12',12,'enakvigi:','bani','bani','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (628,89,'ekz18_13',13,'esprimi feliĉon pro io ricevita:','danki','danki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (629,89,'ekz18_14',14,'esti atenta, sin okupi:','zorgi','zorgi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (630,89,'ekz18_15',15,'farebla sen granda laboro:','facila','facila','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (631,89,'ekz18_16',16,'fari tre malbone:','fuŝi','fusxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (632,89,'ekz18_17',17,'grupo de amikoj (ekzemple):','rondo','rondo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (633,89,'ekz18_18',18,'grupo de lernantoj:','klaso','klaso','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (634,89,'ekz18_19',19,'io kutime farata:','tradicio','tradicio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (635,89,'ekz18_20',20,'kun bone funkcianta korpo:','sana','sana','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (636,89,'ekz18_21',21,'mallasta:','unua','unua','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (637,89,'ekz18_22',22,'ne kun:','sen','sen','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (638,89,'ekz18_23',23,'ne paroli, fari nenian bruon:','silenti','silenti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (639,89,'ekz18_24',24,'neĉiutaga okazaĵaro:','aventuro','aventuro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (640,89,'ekz18_25',25,'ofta okulkoloro de blonduloj:','bluo','bluo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (641,89,'ekz18_26',26,'parto de parolo:','vorto','vorto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (642,89,'ekz18_27',27,'perdi la konscion:','sveni','sveni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (643,89,'ekz18_28',28,'pro kio:','kial','kial','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (644,89,'ekz18_29',29,'rigardi kiel veran:','kredi','kredi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (645,89,'ekz18_30',30,'risko de malbono:','danĝero','dangxero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (646,89,'ekz18_31',31,'senti la suferojn de alia homo:','kompati','kompati','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (647,89,'ekz18_32',32,'sesdek sekundoj:','minuto','minuto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (648,89,'ekz18_33',33,'tempo en historio:','epoko','epoko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (649,89,'ekz18_34',34,'tia, ke oni devas tuj fari ĝin:','urĝa','urgxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (650,89,'ekz18_35',35,'tre tre:','ege','ege','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (651,89,'ekz18_36',36,'vidilo en kapo: .','okulo','okulo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (652,89,'ekz18_37',37,'viro aŭ virino:','homo','homo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (653,90,'ekz19_01',1,'Kiuj estas Petro kaj Ralf?','Ili estas la knaboj, kiuj ludis en la domo, en kiu Gerda estas.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (654,90,'ekz19_02',2,'Kial Ralf provas timigi Petron?','Ĉar li ne volas, ke iliaj gepatroj sciu, ke ili ludis en tiu domo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (655,90,'ekz19_03',3,'Kiamaniere li provas timigi lin?','Dirante, ke li suferigos lin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (656,90,'ekz19_04',4,'Ĉu Petro estas timigita?','Ne, Petro ne estas timigita.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (657,90,'ekz19_05',5,'Kion Ralf rakontas pri la virino?','Li diras, ke ŝi estas virino, kiun li kaptis kaj ke li planas igi ŝin sia servistino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (658,91,'ekz19_06',6,'afero, io pripensebla :','objekto','objekto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (659,91,'ekz19_07',7,'agi farante sian taskon, servon, oficon :','funkcii','funkcii','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (660,91,'ekz19_08',8,'bona sento de komforteco aŭ ĝojo :','plezuro','plezuro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (661,91,'ekz19_09',9,'de tiu speco :','tia','tia','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (662,91,'ekz19_10',10,'deziranta nenion alian ol tion, kion oni havas :','kontenta','kontenta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (663,91,'ekz19_11',11,'ekhavi :','ricevi','ricevi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (664,91,'ekz19_12',12,'ekmalfunkcii :','panei','panei','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (665,91,'ekz19_13',13,'en bezonata kiomo :','sufiĉa','suficxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (666,91,'ekz19_14',14,'enpreni akvon :','trinki','trinki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (667,91,'ekz19_15',15,'esprimi doloran senton per neparolaj sonoj :','ĝemi','gxemi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (668,91,'ekz19_16',16,'facile uzebla, bona por la celo :','oportuna','oportuna','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (669,91,'ekz19_17',17,'fari tre malplaĉan senton :','dolori','dolori','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (670,91,'ekz19_18',18,'granda en la direkto nek de longo nek de diko :','larĝa','largxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (671,91,'ekz19_19',19,'ĝusta aranĝo aŭ dismetado :','ordo','ordo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (672,91,'ekz19_20',20,'havigi al si interŝanĝe por mono :','aĉeti','acxeti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (673,91,'ekz19_21',21,'iri, sed ne paŝante :','veturi','veturi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (674,91,'ekz19_22',22,'je ĉiu tempo :','ĉiam','cxiam','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (675,91,'ekz19_23',23,'konsenti ricevi ion :','akcepti','akcepti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (676,91,'ekz19_24',24,'kontraŭkrima administraĵo :','polico','polico','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (677,91,'ekz19_25',25,'kunmeti tiel, ke oni ne povas facile rekoni la partojn :','miksi','miksi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (678,91,'ekz19_26',26,'malesti, foresti, ne esti sufiĉe multe :','manki','manki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (679,91,'ekz19_27',27,'malfaciligi aŭ malhelpi ies movojn, maloportuni al iu :','ĝeni','gxeni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (680,91,'ekz19_28',28,'meti en situacion aŭ pozicion, kiu malebligas eniron aŭ eliron :','fermi','fermi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (681,91,'ekz19_29',29,'ne daŭrigi :','fini','fini','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (682,91,'ekz19_30',30,'ordigi, prizorgi :','aranĝi','arangxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (683,91,'ekz19_31',31,'plaĉa per ĝentileco, amikeco :','afabla','afabla','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (684,91,'ekz19_32',32,'povanta bone kaj ĝuste decidi :','saĝa','sagxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (685,91,'ekz19_33',33,'preni kun si, havi kun si :','porti','porti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (686,91,'ekz19_34',34,'pro dubo halti ne sciante, kion fari :','heziti','heziti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (687,91,'ekz19_35',35,'proksime al :','apud','apud','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (688,91,'ekz19_36',36,'pura, travidebla, komprenebla :','klara','klara','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (689,91,'ekz19_37',37,'rebonigi, refunkciigi :','ripari','ripari','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (690,91,'ekz19_38',38,'rediri, refari :','ripeti','ripeti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (691,91,'ekz19_39',39,'senakva aŭ kun malmulte da akvo :','seka','seka','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (692,91,'ekz19_40',40,'senti bezonon trinki :','soifi','soifi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (693,91,'ekz19_41',41,'senti strangecon, neatenditecon, nekutimecon :','miri','miri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (694,91,'ekz19_42',42,'senviviĝi :','morti','morti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (695,91,'ekz19_43',43,'sidilo :','seĝo','segxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (696,91,'ekz19_44',44,'speco de agado :','maniero','maniero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (697,91,'ekz19_45',45,'ujo por trinkaĵo :','glaso','glaso','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (698,92,'ekz20_01',1,'Kion aŭdas Gerda?','Ŝi aŭdas paŝojn sur la strato kaj bruon de ŝlosiloj trans la pordo.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (699,92,'ekz20_02',2,'Kiel ŝi scias, ke ne estas la kutima vizitanto?','Ŝi scias, ke ne estas la kutima vizitanto ĉar li ne tuj sukcesas malŝlosi la pordon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (700,92,'ekz20_03',3,'Kiujn prezentas la policano al Gerda?','La policano prezentas al Gerda la studentojn Tom, Bob kaj Linda.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (701,92,'ekz20_04',4,'Pri kio estas la unua demando de Gerda?','Ŝia unua demando estas pri ŝia filino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (702,92,'ekz20_05',5,'Kiel la kaptintoj celis igi Gerdan kunlabori?','Ili celis igi ŝin kunlabori per malsato, unue, kaj poste per la mesaĝo de ŝia filino.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (703,92,'ekz20_06',6,'Por kio foriras Linda?','Ŝi foriras por aĉeti manĝaĵojn.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (704,92,'ekz20_07',7,'Kial la policano petas, ke Bob restu kun Gerda?','Li petas, ke Bob restu kun ŝi por defendi ŝin se estos necese.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (705,93,'ekz20_08',8,'afabla en kutima kaj ĝusta maniero :','ĝentila','gxentila','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (706,93,'ekz20_09',9,'aro de lokoj trairataj por iri de unu loko al alia :','vojo','vojo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (707,93,'ekz20_10',10,'dolore senti perdon, esti malkontenta pro ia faro aŭ manko :','bedaŭri','bedauxri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (708,93,'ekz20_11',11,'ekkonscii pri :','rimarki','rimarki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (709,93,'ekz20_12',12,'ekmaldormigi :','veki','veki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (710,93,'ekz20_13',13,'emi ion fari pro ofta ripetado :','kutimi','kutimi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (711,93,'ekz20_14',14,'en iu loko :','ie','ie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (712,93,'ekz20_15',15,'en neniu loko :','nenie','nenie','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (713,93,'ekz20_16',16,'esprimi malkontentecon :','plendi','plendi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (714,93,'ekz20_17',17,'esti aŭdebla :','soni','soni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (715,93,'ekz20_18',18,'faradi pro plezuro :','ludi','ludi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (716,93,'ekz20_19',19,'fari la unuan parton de io :','komenci','komenci','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (717,93,'ekz20_20',20,'fari muzikon pervoĉe :','kanti','kanti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (718,93,'ekz20_21',21,'fari voĉbruon por montri subitan ĝojon :','ridi','ridi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (719,93,'ekz20_22',22,'fermi per seruro :','ŝlosi','sxlosi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (720,93,'ekz20_23',23,'forte aŭdebla :','laŭta','lauxta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (721,93,'ekz20_24',24,'grupo de homoj kun samaj tradicio kaj historio :','nacio','nacio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (722,93,'ekz20_25',25,'havi permeson fari ion :','rajti','rajti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (723,93,'ekz20_26',26,'havi samajn ecojn kiel :','simili','simili','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (724,93,'ekz20_27',27,'homido :','infano','infano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (725,93,'ekz20_28',28,'homo konsiderata kiel konscia kun devoj kaj rajtoj :','persono','persono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (726,93,'ekz20_29',29,'iri per egalaj paŝoj :','marŝi','marsxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (727,93,'ekz20_30',30,'je iu tempo :','iam','iam','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (728,93,'ekz20_31',31,'kapabla iri kaj fari laŭplaĉe :','libera','libera','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (729,93,'ekz20_32',32,'klara, certa, perfekte ĝusta :','preciza','preciza','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (730,93,'ekz20_33',33,'kredi, ke io dezirata realiĝos :','esperi','esperi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (731,93,'ekz20_34',34,'meblo por kuŝado kaj dormado :','lito','lito','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (732,93,'ekz20_35',35,'meti ion sur :','kovri','kovri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (733,93,'ekz20_36',36,'montri doloron per okulakvo kaj ĝemetoj :','plori','plori','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (734,93,'ekz20_37',37,'natura altegaĵo :','monto','monto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (735,93,'ekz20_38',38,'ne kapabla bone pensi :','stulta','stulta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (736,93,'ekz20_39',39,'ne miksita, sen nedezirata aldono :','pura','pura','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (737,93,'ekz20_40',40,'okupi la atenton de iu :','interesi','interesi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (738,93,'ekz20_41',41,'parolsono de homo :','voĉo','vocxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (739,93,'ekz20_42',42,'parto de homa korpo, ĉe kies fino estas mano :','brako','brako','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (740,93,'ekz20_43',43,'parto de muro, kie povas enveni lumo kaj aero :','fenestro','fenestro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (741,93,'ekz20_44',44,'perdi memoron pri :','forgesi','forgesi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (742,93,'ekz20_45',45,'pervoĉe fari laŭtajn sonojn :','krii','krii','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (743,93,'ekz20_46',46,'pluestadi, ne esti finita :','daŭri','dauxri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (744,93,'ekz20_47',47,'prezenti ideon pri io farinda :','proponi','proponi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (745,93,'ekz20_48',48,'rapide iri piede :','kuri','kuri','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (746,93,'ekz20_49',49,'rilati, interesi, esti la temo de :','koncerni','koncerni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (747,93,'ekz20_50',50,'sciigi okazintaĵojn per vortoj :','rakonti','rakonti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (748,93,'ekz20_51',51,'senmanka :','perfekta','perfekta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (749,93,'ekz20_52',52,'sentanta eluzitecon de siaj fortoj :','laca','laca','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (750,93,'ekz20_53',53,'senti vivan plezuron :','ĝoji','gxoji','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (751,93,'ekz20_54',54,'sentigi emon fali (moviĝi malsupren) :','pezi','pezi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (752,93,'ekz20_55',55,'sesdek minutoj :','horo','horo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (753,93,'ekz20_56',56,'ŝtonego :','roko','roko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (754,93,'ekz20_57',57,'trankvila kaj sentima antaŭ danĝero :','kuraĝa','kuragxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (755,93,'ekz20_58',58,'translokigi :','movi','movi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (756,93,'ekz20_59',59,'tre mallonga tempodaŭro :','momento','momento','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (757,93,'ekz20_60',60,'tuto da kondiĉoj kaj ĉirkaŭaĵo :','situacio','situacio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (758,93,'ekz20_61',61,'tute kontenta, bonŝanca :','feliĉa','felicxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (759,93,'ekz20_62',62,'vira naskiginto de ido :','patro','patro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (760,94,'ekz21_01',1,'Pri kio parolas Gerda kaj Bob?','Ili parolas pri siaj vivoj kaj pri la lastaj okazaĵoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (761,94,'ekz21_02',2,'Kio okazas post iom da tempo?','Post iom da tempo aŭdiĝas paŝoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (762,94,'ekz21_03',3,'Kion promesas Gerda?','Ŝi promesas, ke ŝi tradukos la aĉan paperon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (763,94,'ekz21_04',4,'Pri kio temas la papero?','Ĝi temas pri la trezoro de la Lumoserĉantoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (764,94,'ekz21_05',5,'Kiuj estas la Lumoserĉantoj?','Estas sekreta societo, kiu naskiĝis en la dek-kvina jarcento.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (765,94,'ekz21_06',6,'Kial la ŝtatoj persekutis ilin?','Ĉar la ŝtatoj ektimis ilin miskomprenante iliajn celojn.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (766,94,'ekz21_07',7,'Kiam la aĉulo foriras?','Li foriras, post kiam Gerda finis traduki la paperon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (767,95,'ekz21_08',8,'administrejo por transportado de leteroj :','poŝto','posxto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (768,95,'ekz21_09',9,'agrable sentiganta, kiel sukero :','dolĉa','dolcxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (769,95,'ekz21_10',10,'ano de la militistaro :','soldato','soldato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (770,95,'ekz21_11',11,'antaŭe pripensita kaj ordigita aranĝo de realigota agado :','plano','plano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (771,95,'ekz21_12',12,'aro de aĵoj kun samaj ecoj :','speco','speco','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (772,95,'ekz21_13',13,'arto aranĝi sonojn en maniero plaĉa por aŭskultado :','muziko','muziko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (773,95,'ekz21_14',14,'ĉe la flanko kontraŭa al tiu de la koro :','dekstra','dekstra','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (774,95,'ekz21_15',15,'ĉiu el la okazoj, kiam io okazas :','fojo','fojo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (775,95,'ekz21_16',16,'dekstra aŭ maldekstra parto :','flanko','flanko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (776,95,'ekz21_17',17,'ebleco de sukceso :','ŝanco','sxanco','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (777,95,'ekz21_18',18,'elstara parto meze de vizaĝo :','nazo','nazo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (778,95,'ekz21_19',19,'estiĝi, fariĝi en iu loko aŭ momento :','okazi','okazi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (779,95,'ekz21_20',20,'farota laboro aŭ servo :','tasko','tasko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (780,95,'ekz21_21',21,'fordoni ion interŝanĝe por mono, malaĉeti :','vendi','vendi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (781,95,'ekz21_22',22,'frua parto de tago antaŭ tagmezo :','mateno','mateno','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (782,95,'ekz21_23',23,'granda movebla objekto por uzado en domo :','meblo','meblo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (783,95,'ekz21_24',24,'ĝentile esprimi al iu sian kontentecon pro ties sukceso aŭ feliĉo :','gratuli','gratuli','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (784,95,'ekz21_25',25,'io plata, el kio oni manĝas :','telero','telero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (785,95,'ekz21_26',26,'je la tago antaŭ la nuna tago :','hieraŭ','hieraux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (786,95,'ekz21_27',27,'korpaj ludoj :','sporto','sporto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (787,95,'ekz21_28',28,'kovri la korpon per io portebla :','vesti','vesti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (788,95,'ekz21_29',29,'kunligita aro :','grupo','grupo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (789,95,'ekz21_30',30,'malalta aŭ maldika :','plata','plata','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (790,95,'ekz21_31',31,'maldika aĵo, sur kiu oni skribas, kaj el kiu oni faras librojn :','papero','papero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (791,95,'ekz21_32',32,'mallonga memoriga skribaĵo :','noto','noto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (792,95,'ekz21_33',33,'mallonge antaŭe :','ĵus','jxus','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (793,95,'ekz21_34',34,'manĝaĵo kun multe da akvo :','supo','supo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (794,95,'ekz21_35',35,'okazanta pli antaŭe, proksime al la komencotempo :','frua','frua','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (795,95,'ekz21_36',36,'pansimila sed pli dolĉa bakaĵo :','kuko','kuko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (796,95,'ekz21_37',37,'perforte dispecigi :','rompi','rompi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (797,95,'ekz21_38',38,'reciproka mortigado inter malamikaj homgrupoj :','milito','milito','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (798,95,'ekz21_39',39,'restoracia servisto, kiu alportas la trinkaĵojn kaj manĝaĵojn :','kelnero','kelnero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (799,95,'ekz21_40',40,'ruĝeco, blueco, bruneco, verdeco, nigreco, ktp :','koloro','koloro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (800,95,'ekz21_41',41,'ruĝete terkolora :','bruna','bruna','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (801,95,'ekz21_42',42,'sciigi al alia persono, kion oni aŭdis, vidis kaj trovis :','raporti','raporti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (802,95,'ekz21_43',43,'sin movi tra la aero :','flugi','flugi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (803,95,'ekz21_44',44,'speco de simpla manĝaĵo :','pano','pano','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (804,95,'ekz21_45',45,'supra kovrilo de ĉambro :','plafono','plafono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (805,95,'ekz21_46',46,'vere ekzistanta kaj kontrolebla :','reala','reala','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (806,95,'ekz21_47',47,'vojo inter domoj en urbo :','strato','strato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (807,96,'ekz22_01',1,'Kie troviĝas la loko indikita?','Ĝi troviĝas ĉe la piedo de monto, en kaverno.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (808,96,'ekz22_02',2,'Kial Tom tute ne ŝatus vojaĝi ŝipe?','Li ne ŝatus vojaĝi ŝipe ĉar la maro ĉiam igas lin malsana.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (809,96,'ekz22_03',3,'Kiel oni povas iri preskaŭ ĉien ajn?','Oni povas iri preskaŭ ĉien ajn aviadile.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (810,96,'ekz22_04',4,'Kiom da homoj atendas la trezorserĉantojn?','Kvar homoj atendas la trezorserĉantojn : Tom, Bob, Linda kaj la policano.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (811,96,'ekz22_05',5,'Kion rimarkas Linda observante la vojon?','Ŝi rimarkas, ke aŭto alvenas.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (812,97,'ekz22_06',6,'aliigi :','ŝanĝi','sxangxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (813,97,'ekz22_07',7,'aparato por montri la horojn :','horloĝo','horlogxo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (814,97,'ekz22_08',8,'atenti, zorgi kontraŭ danĝero aŭ ebla malbono, teni :','gardi','gardi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (815,97,'ekz22_09',9,'certigi, ke oni ion faros :','promesi','promesi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (816,97,'ekz22_10',10,'detale esplori, ĉu io estas ĝusta aŭ ĝuste farita :','kontroli','kontroli','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (817,97,'ekz22_11',11,'domo aŭ loko, kie oni konstante vivas :','hejmo','hejmo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (818,97,'ekz22_12',12,'ekpreni kaj firme teni :','kapti','kapti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (819,97,'ekz22_13',13,'ekzemplo prezentanta iun specon :','tipo','tipo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (820,97,'ekz22_14',14,'estanta post ĉiuj aliaj :','lasta','lasta','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (821,97,'ekz22_15',15,'firme restanta ĉe siaj opinio kaj volo :','obstina','obstina','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (822,97,'ekz22_16',16,'grava skribaĵo :','dokumento','dokumento','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (823,97,'ekz22_17',17,'irigi kun si :','konduki','konduki','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (824,97,'ekz22_18',18,'kapti por teni, porti aŭ uzi; havigi al si; akcepti, ricevi :','preni','preni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (825,97,'ekz22_19',19,'kaŝe forpreni ion de alia homo :','ŝteli','sxteli','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (826,97,'ekz22_20',20,'kontentigi, feliĉigi, ĝojigi :','plaĉi','placxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (827,97,'ekz22_21',21,'kun multe da havaĵo, da mono, da io ajn :','riĉa','ricxa','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (828,97,'ekz22_22',22,'kunaĵo de objektoj kaj iloj servanta por ion fari :','aparato','aparato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (829,97,'ekz22_23',23,'ne bezonanta manĝaĵon :','sata','sata','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (830,97,'ekz22_24',24,'ne kontraŭstari, vivi kun io ĝisfine :','elporti','elporti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (831,97,'ekz22_25',25,'ne tute, sed ne tute ne :','preskaŭ','prekaux','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (832,97,'ekz22_26',26,'pagilo konsistanta el pecoj kun difinitaj valoroj :','mono','mono','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (833,97,'ekz22_27',27,'preni kiel rimedon, agi per io por kontentigi bezonon :','uzi','uzi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (834,97,'ekz22_28',28,'provadi por trovi :','serĉi','sercxi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (835,97,'ekz22_29',29,'rapide forigi de si tra la aero :','ĵeti','jxeti','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (836,97,'ekz22_30',30,'scienco pri pasintaj okazaĵoj; rakonto pri okazintaĵo :','historio','historio','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (837,97,'ekz22_31',31,'sekvi per okuloj kaj kompreni ion skribitan :','legi','legi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (838,97,'ekz22_32',32,'sekvi tion, kion volas alia persono :','obei','obei','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (839,97,'ekz22_33',33,'senti doloron, travivi malfeliĉaĵon :','suferi','suferi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (840,97,'ekz22_34',34,'sin vidigi, ekmontriĝi, iĝi videbla :','aperi','aperi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (841,97,'ekz22_35',35,'skribaĵo sendita al alia homo :','letero','letero','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (842,97,'ekz22_36',36,'solvota demando, malfacilaĵo :','problemo','problemo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (843,97,'ekz22_37',37,'suferi pro manko de iu necesa, necesigi ion :','bezoni','bezoni','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (844,97,'ekz22_38',38,'surpaperigi vortojn :','skribi','skribi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (845,97,'ekz22_39',39,'timego :','teruro','teruro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (846,97,'ekz22_40',40,'tio, kio igas iun agi aŭ opinii en iu maniero :','motivo','motivo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (847,97,'ekz22_41',41,'trairi, preteriri; transirante malaperi, ne daŭri :','pasi','pasi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (848,97,'ekz22_42',42,'trovi la respondon al demando, la rimedon kontraŭ malfacilaĵo :','solvi','solvi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (849,97,'ekz22_43',43,'vira ido de samaj gepatroj :','frato','frato','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (850,97,'ekz22_44',44,'vira homido :','filo','filo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (851,97,'ekz22_45',45,'viro ligita al virino por kunvivado kaj nasko de infanoj :','edzo','edzo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (852,98,'ekz23_01',1,'Kiel Bob sukcesis antaŭi la bandon?','Li sukcesis antaŭi la bandon danke al Gerda, kiu aranĝis, ke veturilo atendu lin ĉe la flughaveno.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (853,98,'ekz23_02',2,'Kiom da trezorserĉantoj envenis la kavernon?','Kvin trezorserĉantoj envenis la kavernon.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (854,98,'ekz23_03',3,'Kio mirigas la tri studentojn?','Ili miras pro tio, ke estas ankaŭ la profesoroj Ronga kaj Fergus.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (855,98,'ekz23_04',4,'Kie, laŭ la malnova dokumento, troviĝas la trezoro?','Laŭ la malnova dokumento, la trezoro troviĝas en kofro metita en kavo aranĝita en la rokoj.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (856,99,'ekz23_05',5,'La strangulo parolas al si mem, ne atentante la studentojn, kiuj lin rigardas.','La strangulo parolas al si mem, ne atentante la rigardantajn studentojn.','la strangulo parolas al si mem, ne atentante la rigardantajn studentojn','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (857,99,'ekz23_06',6,'La studento redonas la librojn, kiujn li jam legis.','La studento redonas la <b>legitajn</b> librojn.','La studento redonas la legitajn librojn.','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (858,99,'ekz23_07',7,'Kato, kiu manĝis, normale volas dormi.','<b>Manĝinta</b> kato normale volas dormi.','mangxinta kato normale volas dormi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (859,99,'ekz23_08',8,'La policanoj ne rekonos la krimulon, kiun ili serĉas.','La policanoj ne rekonos la <b>serĉatan</b> krimulon.','la policanoj ne rekonos la sercxatan krimulon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (860,99,'ekz23_09',9,'Li zorge purigis la aŭton, kiun li volis vendi.','Li zorge purigis la <b>vendotan</b> aŭton.','li zorge purigis la vendotan auxton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (861,99,'ekz23_10',10,'En la universitato Marta estas virino, kiun ĉiu konas.','En la universitato Marta estas <b>konata</b> virino.','en la universitato marta estas konata virino','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (862,99,'ekz23_11',11,'Ŝi provis legi la numeron de la aŭto, dum ĝi veturas.','<b>Veturante</b> ŝi provis legi la numeron de la aŭto.','veturante sxi provis legi la numeron de la auxto','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (863,99,'ekz23_12',12,'Tiam ŝi ankoraŭ havis la monujon, kiun ŝi poste perdis.','Tiam ŝi ankoraŭ havis la <b>perdotan</b> monujon.','tiam sxi ankoraux havis la perdotan monujon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (864,99,'ekz23_13',13,'Li pensis pri la suferoj, kiujn li jam travivis.','Li pensis pri la <b>travivitaj</b> suferoj.','li pensis pri la travivitaj suferoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (865,99,'ekz23_14',14,'Mi plendos pri la seĝoj, kiuj malaperis.','Mi plendos pri la <b>malaperintaj</b> seĝoj.','mi plendos pri la malaperintaj segxoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (866,99,'ekz23_15',15,'Mi devis atendi la buson, kiu venis poste.','Mi devis atendi la <b>venontan</b> buson.','mi devis atendi la venontan buson','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (867,99,'ekz23_16',16,'Ŝi longe adiaŭis la amikon, kiu devis foriri.','Ŝi longe adiaŭis la <b>forirontan</b> amikon.','sxi longe adiauxis la forirontan amikon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (868,100,'ekz24_01',1,'Kiel aspektis la trezoro?','La trezoro estis libro.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (869,100,'ekz24_02',2,'Kion legis Ronga?','Li legas la paperon, kiu estas kun la libro.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (870,100,'ekz24_03',3,'Kiam Marta eksciis pri la trezoro de la lumoserĉantoj?','Ŝi eksciis pri ĝi kiam ŝi ĉeestis kirurgian operacion de historiisto Prof. Kosadi.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (871,100,'ekz24_04',4,'Kie profesoro Kosadi faris historian esploron?','Li faris historian esploron en la Vatikana Biblioteko.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (872,100,'ekz24_05',5,'Kion profesoro Kosadi eksciis pri la trezoro? Kion li ne povis kompreni?','Li komprenis, ke la papero indikas la lokon de la trezoro sed li ne povis kompreni ĉiujn detalajn indikojn.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (873,100,'ekz24_06',6,'Kiel Marta eksciis pri la trezoro?','Ŝi injektis dormigan substancon al Prof. Kosadi kaj pridemandis lin.','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (874,101,'ekz24_07',7,'La HOMOJ, KIUJ FORIROS, ne plu zorgos pri sia laboro.','La <b>forirontoj</b> ne plu zorgos pri sia laboro.','la forirontoj ne plu zorgos pri sia laboro','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (875,101,'ekz24_08',8,'La INFANOJ, KIUJ LERNAS, ekstaras, kiam la instruisto envenas.','La <b>lernantoj</b> ekstaras, kiam la instruisto envenas.','la lernantoj ekstaras kiam la instruisto envenas','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (876,101,'ekz24_09',9,'POST KIAM LI longe PRIPENSIS la aferon, li decidis ekagi.','Longe <b>pripensinte</b> la aferon, li decidis ekagi.','longe pripensinte la aferon li decidis ekagi','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (877,101,'ekz24_10',10,'Oni enŝlosis la HOMON, KIUN ONI KAPTIS, en la policejo.','Oni enŝlosis la <b>kaptiton</b> en la policejo.','oni ensxlosis la kaptiton en la policejo','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (878,101,'ekz24_11',11,'La HOMO, KIU MALAPERIS, estas instruisto pri malnovaj sekretaj lingvoj.','La <b>malaperinto</b> estas instruisto pri malnovaj sekretaj lingvoj.','la malaperinto estas instruisto pri malnovaj sekretaj lingvoj','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (879,101,'ekz24_12',12,'DUM LI ATENDIS la buson, Tom ekhavis ideon.','<b>Atendante</b> la buson, Tom ekhavis ideon.','atendante la buson tom ekhavis ideon','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (880,101,'ekz24_13',13,'La HOMOJ, KIUJN LA AFERO INTERESAS, povas trovi pli da informoj en iu ajn biblioteko.','La <b>interesatoj</b> povas trovi pli da informoj en iu ajn biblioteko.','la interesatoj povas trovi pli da informoj en iu ajn biblioteko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (881,101,'ekz24_14',14,'La blondulo forveturis, DUM Tom kaj Linda OBSERVIS LIN.','La blondulo forveturis <b>observate</b> de Tom kaj Linda.','la blondulo forveturis observate de Tom kaj Linda','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (882,101,'ekz24_15',15,'La HOMOJ, KIUJN ONI LIBERIGOS, ankoraŭ atendis la malfermon de la pordego.','La </b>liberigotoj</b> ankoraŭ atendis la malfermon de la pordego.','la liberigotoj ankoraux atendis la malfermon de la pordego','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (883,101,'ekz24_16',16,'ĈAR la polico LIN KAPTOS, la spiono manĝis la dokumenton.','<b>Kaptote</b> de la polico, la spiono manĝis la dokumenton.','kaptote de la polico la spiono mangxis la dokumenton','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (884,101,'ekz24_17',17,'POST KIAM ĉiu FORGESIS ĜIN, la libro atendis multajn jarcentojn en la biblioteko.','<b>Forgesite</b> de ĉiu la libro atendis multajn jarcentojn en la biblioteko.','forgesite de cxiu la libro atendis multajn jarcentojn en la biblioteko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (885,101,'ekz24_18',18,'TUJ ANTAŭ OL LI MALFERMIS la pordon, li subite konsciis pri stranga bruo venanta de ĝia alia flanko.','<b>Malfermonte</b> la pordon, li subite konsciis pri stranga bruo venanta de ĝia alia flanko.','malfermonte la pordon li subite konsciis pri stranga bruo venanta de gxia alia flanko','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (886,102,'ekz25_01',1,'Ĉu vi konas la respondon ?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (887,103,'ekz25_02',2,'Kiom da Esperanto vi jam sciis, kiam vi komencis la GERDA-kurson? Kiel vi lernis Esperanton antaŭe?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (888,103,'ekz25_03',3,'Ĉu la GERDA-kurso estis por vi utila? Ĉu vi sukcesis multe lerni per ĝi? Ĉu vi ĝuis ĝin?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (889,103,'ekz25_04',4,'Ĉu vi pensas, ke la teksto uzita (la rakonto Gerda malaperis!) estis bone elektita? Ĉu ĝia lingvaĵo estas tro simpla? Ĉu la rakonto estas tro stulta, infaneca aŭ malinteresa?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (890,103,'ekz25_05',5,'Ĉu la demandoj pri la teksto estis utilaj? Ĉu eble estus pli bone havi nur ekzercojn post ĉiu ĉapitro, sen demandoj? Ĉu la demandoj estu malpli simplaj, por ke oni povu respondi ilin per pli da vortoj?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (891,103,'ekz25_06',6,'Ĉu la ekzercoj estis utilaj? Ĉu la vortaro-ekzercoj, en kiuj oni devas parigi vortojn kaj difinojn, estis utilaj? Kiuj estis la plej utilaj ekzercoj, kaj kiuj estis la malplej utilaj? Ĉu vi povas proponi aliajn specojn de ekzercoj?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (892,103,'ekz25_07',7,'Ĉu la vortlisto estis sufiĉe bona? Ĉu ĝi enhavu pli da gramatikaj klarigoj, aŭ pli da ekzemploj? Ĉu ĝi estu havebla en aliaj lingvoj? Ĉu eble vi eĉ povus helpi traduki ĝin al alia lingvo?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (893,103,'ekz25_08',8,'Ĉu vi uzis aŭ havas iujn aliajn lernilojn, ekzemple vortaron aŭ lernolibron pri Esperanto? Kiujn?','','','',0);
insert into ekzerceroj (id,ekzerco_id,kodo,numero,demando,respondo,normaligita,bildo,forigita) values (894,103,'ekz25_09',9,'Ĉu vi volas plulerni Esperanton? Kiel? Ĉu kurso simila al la GERDA-kurso, sed kun bonaj literaturaj tekstoj anstataŭ la GERDA-rakonto, estus utila por vi? Ĉu vi preferus simple trastudi iun libron en Esperanto? Ĉu vi volus trastudi libron diskutante ĝin kun iu? Ĉu vi volas lerni pli pri la historio kaj celoj de la Esperanto-Movado?','','','',0);

-- Renommage des exercices de lec06
UPDATE `lecioneroj` SET `titolo` = 'Exercice 1' WHERE `id` = 53;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 2' WHERE `id` = 57;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 3' WHERE `id` = 59;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 4' WHERE `id` = 61;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 5' WHERE `id` = 64;
UPDATE `lecioneroj` SET `titolo` = 'Exercice 6' WHERE `id` = 66;

-- Uniformiser les noms des pays #655
UPDATE `vortoj` SET `eo` = 'Ĉinujo|Ĉinio' WHERE `eo` = 'Ĉinio';

-- Passage en V17
ALTER TABLE  `lecioneroj` ADD  `android` BOOL NULL ;

-- Modif nom de la page sur les revues #
UPDATE `lecioneroj` SET `titolo` = 'Les revues en espéranto', `dauxro` = '10' WHERE `leciono_id` = 70 AND `ordo` = 7;

-- Passage en V18
-- ajout des tables pour le QCM (pour mettre dans Android)
CREATE TABLE `qcm` ( `id` INT NOT NULL AUTO_INCREMENT , `lecionero_id` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
CREATE TABLE `qcm_demando` ( `id` INT NOT NULL AUTO_INCREMENT , `qcm_id` INT NOT NULL ,`ordo` INT NOT NULL, `bildo` VARCHAR(250) NULL , `url` VARCHAR(250) NULL , `auxtoro` VARCHAR(100) NULL, `demando` VARCHAR(250) NULL , `respondo` INT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;
CREATE TABLE `qcm_propono` ( `id` INT NOT NULL AUTO_INCREMENT, `qcm_demando_id` INT NOT NULL , `ordo` INT NOT NULL , `propono` VARCHAR(250) NOT NULL , `indikilo` VARCHAR(250) NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci;

-- QCM section 1.8 "qui est est ?"
INSERT INTO `qcm` (`id`, `lecionero_id`) VALUES (NULL, '253');
SET @last_id_in_qcm = LAST_INSERT_ID();

INSERT INTO `qcm_demando` (`id`, `qcm_id`,`ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 1, NULL, NULL, NULL, 'En kiu filmo estas Aleks ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'filmo 1', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'filmo 2', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'filmo 3', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'filmo 4', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'filmo 5', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 2 , NULL, NULL, NULL, 'En kiu filmo estas Joanne ?', 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'filmo 1', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'filmo 2', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'filmo 3', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'filmo 4', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'filmo 5', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 3 , NULL, NULL, NULL, 'En kiu filmo estas Tran Hoan ?', 4);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'filmo 1', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'filmo 2', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'filmo 3', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'filmo 4', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'filmo 5', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 4 , NULL, NULL, NULL, 'Kiu loĝas en Brazilo ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 5 , NULL, NULL, NULL, 'Kiu loĝas en Pollando ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 6 , NULL, NULL, NULL, 'Kiu loĝas en Vjetnamio ?', 5);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 7 , NULL, NULL, NULL, 'Kiu estas desegnisto ?', 4);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 8 , NULL, NULL, NULL, 'Kiu estas psikologo ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 9 , NULL, NULL, NULL, 'Kiu estas studento ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aleks', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Allan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Anna Maria', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Joanne', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Tran Hoan', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 10 , NULL, NULL, NULL, 'Kie loĝas la instruisto ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Aŭstralio', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Brazilo', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Francio', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'Pollando', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 5, 'Vjetnamio', NULL);

-- QCM 1.12 
INSERT INTO `qcm` (`id`, `lecionero_id`) VALUES (NULL, '7');
SET @last_id_in_qcm = LAST_INSERT_ID();
INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 1 , NULL, NULL, NULL, 'Combien de syllabes y a-t-il dans ''viaj kukoj'' ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, '3', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, '4', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, '5', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '6', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 2 , NULL, NULL, NULL, 'Quelle est la place de l’accent tonique ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'sur la dernière voyelle', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'sur l’avant-dernière syllabe', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'sur la dernière syllabe', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'sur la première voyelle', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 3 , NULL, NULL, NULL, 'Comment se prononce la lettre ''ĝ'' ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'comme le ''g'' de ''Alger''', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'comme le ''g'' de ''Lagos''', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'comme le ''dj'' de ''Djibouti''', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'aucun de ceux-ci', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 4 , NULL, NULL, NULL, 'Comment écrit-on en espéranto le son ''ch'' du mot français ''chat'' ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'ch', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'ŝ', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'ce son n’existe pas en espéranto', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'sch', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 5 , NULL, NULL, NULL, 'Comment écrit-on le son ''u'' qui apparaît dans ''tutu'' en français ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'u', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'y', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n''existe pas en espéranto', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '&uuml;', NULL);


INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 6 , NULL, NULL, NULL, 'Quel est le pronom de 3<sup>e</sup> personne féminin singulier ?', 4);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mi', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'ili', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'ĝi', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'ŝi', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 7 , NULL, NULL, NULL, 'Quelle est la terminaison caractéristique de l’infinitif ?', 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, '-i', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, '-is', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, '-ar', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '-j', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 8 , NULL, NULL, NULL, 'Quelle est la terminaison caractéristique de l’adjectif ?', 4);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, '-as', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, '-o', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, '-j', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '-a', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 9 , NULL, NULL, NULL, 'Quelle est la terminaison caractéristique du passé ?', 4);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, '-i', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, '-j', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, '-as', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '-is', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 10 , NULL, NULL, NULL, 'Quelle est la terminaison caractéristique du nom ?', 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, '-o', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, '-os', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'cela dépend du genre', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, '-a', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 11 , NULL, NULL, NULL, 'Comment dit-on ''du thé chaud'' ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'la varmo tea', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'varma teo', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'varmo teo', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'la varma teo', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 12 , NULL, NULL, NULL, 'Comment dit-on ''de bons garçons'' ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'bona knaboj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'la bonaj knaboj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'bonaj knaboj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'bonoj knaboj', NULL);


INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 13 , NULL, NULL, NULL, 'Comment dit-on ''mes fils'' ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mia filioj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'miaj filoj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'miaj filioj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'mia filoj', NULL);


-- QCM 2.1 : avec images
INSERT INTO `qcm` (`id`, `lecionero_id`) VALUES (NULL, '218');
SET @last_id_in_qcm = LAST_INSERT_ID();
INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 1 , 'img/img-02-01.jpg', 'http://monde.ccdmd.qc.ca/recherche/?demande=collection&str=Denis%20Chabot', 'Denis Chabot', NULL, 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'La kafo estas varma', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'La cafeo estas varma', 'attention, la lettre c se prononce ts');
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'La kafo estas ĉauda', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 2 , 'img/img-02-02.jpg', 'http://monde.ccdmd.qc.ca/recherche/?demande=collection&str=Denis%20Chabot', 'Denis Chabot', NULL, 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'La biskivtoj estas en pano', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'La panoj estas en korbo', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'La paneoj estas sekaj', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 3 , 'img/img-02-03.jpg', 'http://monde.ccdmd.qc.ca/recherche/?demande=collection&str=Katherine%20Lissitsa', 'Katherine Lissitsa', NULL, 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'La filo estas kun birdoj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Patro estas kun birdoj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'La knabino estas kun birdoj', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 4 , 'img/img-02-04.jpg', 'http://monde.ccdmd.qc.ca/recherche/?demande=collection&str=Denis%20Chabot', 'Denis Chabot', NULL, 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'La knabo lernas', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'La patro estas instruisto', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'La knabo estas sana kaj bona filo', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 5 , 'img/img-02-05.jpg', 'http://monde.ccdmd.qc.ca/recherche/?demande=collection&str=Marcel+Labont%E9', 'Marcel Labonté', NULL, 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'Bela filo estas mia instruisto', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'Bela virino estas ilia instruistino', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'Instruisto estas mia', NULL);


-- QCM 2.3 - accusatif et COD
INSERT INTO `qcm` (`id`, `lecionero_id`) VALUES (NULL, '10');
SET @last_id_in_qcm = LAST_INSERT_ID();
INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 1 , NULL, NULL, NULL , 'Il mange du poisson.', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'il', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'du poisson', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n’y a pas besoin d’accusatif', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 2 , NULL, NULL, NULL , 'Les enfants apprennent leurs leçons.', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'les enfants', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'leurs leçons', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n’y a pas besoin d’accusatif', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 3 , NULL, NULL, NULL , 'Mon frère est informaticien.', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mon frère', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'informaticien', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n’y a pas besoin d’accusatif', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 4 , NULL, NULL, NULL , 'Mes parents mangent les restes d’hier soir.', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mes parents', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'les restes', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'les restes d’hier soir', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 4, 'il n’y a pas besoin d’accusatif', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 5 , NULL, NULL, NULL , 'Il promène le chien.', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'il', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'le chien', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n’y a pas besoin d’accusatif', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 6 , NULL, NULL, NULL , 'Il se promène le matin.', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'il', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'le matin', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'il n’y a pas besoin d’accusatif', NULL);


-- QCM 2.13
INSERT INTO `qcm` (`id`, `lecionero_id`) VALUES (NULL, '18');
SET @last_id_in_qcm = LAST_INSERT_ID();

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 1 , NULL, NULL, NULL , 'Que signifient respectivement ''mala'', ''malbona'', ''malsana'' ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mal, mauvais, malade', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'mauvais, mauvais, malade', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'contraire, mauvais, malade', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 2 , NULL, NULL, NULL , 'Que signifie ''malbelaj virinoj'' ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'des hommes laids', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'de belles femmes', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'des femmes laides', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 3 , NULL, NULL, NULL , 'Quel est le féminin pluriel de ''mia granda amiko'' ?', 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'miaj grandaj amikinoj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'mia granda amikinoj', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'miaj grandinaj amikinoj', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 4 , NULL, NULL, NULL , 'Traduisez ''la boutique est vieille''', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'la butiko estas malbela', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'la butiko estas malnovan', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'la butiko estas malnova', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 5 , NULL, NULL, NULL , 'Traduisez ''je ne bois pas d’eau''',2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mi maltrinkas akvon', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'mi ne trinkas akvon', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'mi trinkas ne akvon', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 6 , NULL, NULL, NULL , 'Traduisez ''j’ai oublié la limonade''', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mi petis limonadon', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'mi havas forgesi la limonadon', 'Attention, le verbe ''havi'' n''est pas un auxiliaire !');
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'mi forgesis la limonadon', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 7 , NULL, NULL, NULL , 'Quel est le complément d’objet direct dans ''mon frère boira de l’eau lundi'' ?', 2);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'mon frère', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'de l’eau', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'lundi', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 8 , NULL, NULL, NULL , 'Quel est le complément d’objet direct dans ''que boira mon frère lundi'' ?', 1);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'que', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'mon frère', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'lundi', NULL);

INSERT INTO `qcm_demando` (`id`, `qcm_id`, `ordo`, `bildo`, `url`, `auxtoro`, `demando`, `respondo`) VALUES (NULL, @last_id_in_qcm, 9 , NULL, NULL, NULL , 'Quelle est la fonction de ''médecin'' dans ''tu seras médecin'' ?', 3);
SET @last_id_in_qcm_demando = LAST_INSERT_ID();
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 1, 'sujet', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 2, 'complément d’objet direct', NULL);
INSERT INTO `qcm_propono` (`id`, `qcm_demando_id`, `ordo`, `propono`, `indikilo`) VALUES ('', @last_id_in_qcm_demando, 3, 'attribut du sujet', NULL);

-- insertion d'une section sur la littérature à la fin de la leçon 5
UPDATE `lecioneroj` SET ordo=8 WHERE `leciono_id`=63 and `ordo`=7;
INSERT INTO `lecioneroj` (`id`, `leciono_id`, `titolo`, `tipo`, `enhavo`, `ordo`, `unua`, `lasta`) VALUES (NULL, '63', 'Littérature et espéranto', 'TEKSTO', NULL, '7', '0', '0');

-- modif phrase dans exercice 6.12
UPDATE `ekzerceroj` SET `demando` = 'arkto - blankaj - en - estas - la - ursoj.', `respondo` = 'En la arkto estas blankaj ursoj. Sur le continent arctique, il y a des ours blancs.', `normaligita` = 'en la arkto estas blankaj ursoj sur le continent arctique il y a des ours blancs' WHERE `ekzerceroj`.`id` = 157;

-- màj liste vocabulaire dans lec08.8
INSERT INTO `vortoj` (`id`, `eo`, `fr`, `tipo`, `lecionero_id`) VALUES (NULL, 'azeno', 'âne', 'nom', '79');
UPDATE `lecioneroj` SET `enhavo` = '##EKZERCO:36## <div class="vortlisto row"> <p class="col s12 m6"><span class="eo">ambaŭ</span> : tous deux</p> <p class="col s12 m6"><span class="eo">aŭto-veturado</span> : trajet en voiture</p> <p class="col s12 m6"><span class="eo">azeno</span> : âne</p> <p class="col s12 m6"><span class="eo">daŭre</span> : continuellement</p> <p class="col s12 m6"><span class="eo">estonta</span> : futur (participe futur de <em>esti</em>)</p> <p class="col s12 m6"><span class="eo">inciti</span> : irriter</p> <p class="col s12 m6"><span class="eo">foriri (for-iri)</span> : partir</p> <p class="col s12 m6"><span class="eo">hejme</span> : à la maison</p> <p class="col s12 m6"><span class="eo">jam</span> : déjà</p> <p class="col s12 m6"><span class="eo">kafejo</span> : café (restaurant)</p> <p class="col s12 m6"><span class="eo">konflikto</span> : conflit</p> <p class="col s12 m6"><span class="eo">surtuto</span> : pardessus</p> <p class="col s12 m6"><span class="eo">moke</span> : par moquerie</p> <p class="col s12 m6"><span class="eo">obstine</span> : avec obstination</p> <p class="col s12 m6"><span class="eo">parenco</span> : parent (personne de la même famille)</p> <p class="col s12 m6"><span class="eo">preter-pasi</span> : dépasser, passer (devant)…</p> <p class="col s12 m6"><span class="eo">silenti</span> : garder le silence</p> </div>' WHERE `lecioneroj`.`id` = 79;


--------------------------------
-- Passage en V20
--------------------------------

ALTER TABLE `personoj_lecioneroj` ADD `ekdato` TIMESTAMP NULL AFTER `id`;

-- ajout explication pour les exercices de traduction
UPDATE `ekzercoj` SET `komando` = 'À votre tour' WHERE `komando` = 'A votre tour';
UPDATE `ekzercoj` SET `komando_detalo` = 'Cet exercice permet de vérifier si vous avez bien compris le texte en espéranto. Nous vous conseillons de rester fidèle au texte, mais cela ne signifie pas que vous devez le traduire mot à mot. Il est parfois nécessaire de s’éloigner un peu du texte original pour que la traduction soit agréable à lire. Une bonne traduction doit donner l’impression que le texte traduit a été rédigé dans la langue cible.' WHERE `komando` = 'Traduisez en français.';

--------------------------------
-- Passage en V21
--------------------------------

ALTER TABLE `personoj_lecionoj` ADD `enkonduko` TEXT NULL AFTER `komentario`, ADD `konkludo` TEXT NULL AFTER `enkonduko`;
ALTER TABLE `respondoj` ADD `korekto` TEXT NULL AFTER `gxusta`;
ALTER TABLE `personoj_lecionoj` ADD `korektita` TINYINT(1) NOT NULL DEFAULT '0' AFTER `konkludo`;

--------------------------------
-- Passage en V22
--------------------------------
--- modif exercice leçon 4
INSERT INTO `ekzerceroj` (`id`, `ekzerco_id`, `kodo`, `numero`, `demando`, `respondo`, `normaligita`, `bildo`, `forigita`, `korektebla`) VALUES (NULL, '17', 'ekz04_14', '14', 'Petro, la filo de Fatima, ŝatas gitari. Maria, lia juna fratino, preferas promeni bicikle.', 'Petro, le fils de Fatima, aime jouer de la guitare. Maria, sa soeur, préfère se promener à bicyclette.', 'petro le fils de fatima aime jouer de la guitare Maria sa soeur prefère se promener à bicyclette', '', '0', '0');
UPDATE `ekzerceroj` SET `forigita` = '1' WHERE `ekzerceroj`.`id` = 84;

