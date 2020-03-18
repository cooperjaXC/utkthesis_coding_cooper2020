DROP TABLE IF EXISTS ehc_sec.volshop14 CASCADE;

CREATE TAble ehc_sec.volshop14 (
	zip5_vshp varchar(5) ,--serial primary key,
-- 	Name	text,
-- 	Team	varchar(14),
-- 	Longitude	float(13),
-- 	Latitude float(13)
	n_orders SMALLINT
)
;
grant select on all tables in schema adminareas, ehc_sec to alexuser;

INSERT INTO ehc_sec.volshop14 (zip5_vshp, n_orders)
VALUES
	(01028, 1) , 
	(01085, 1) , 
	(01089, 1) , 
	(01460, 2) , 
	(01545, 2) , 
	(01564, 2) , 
	(01568, 1) , 
	(01841, 2) , 
	(01843, 1) , 
	(01854, 2) , 
	(01864, 1) , 
	(01902, 1) , 
	(01907, 1) , 
	(01913, 1) , 
	(01915, 1) , 
	(01930, 1) , 
	(02043, 1) , 
	(02052, 1) , 
	(02053, 1) , 
	(02081, 1) , 
	(02128, 2) , 
	(02136, 1) , 
	(02139, 1) , 
	(02210, 1) , 
	(02215, 1) , 
	(02330, 1) , 
	(02446, 1) , 
	(02453, 1) , 
	(02481, 1) , 
	(02574, 1) , 
	(02638, 1) , 
	(02646, 1) , 
	(02655, 1) , 
	(02721, 1) , 
	(02726, 1) , 
	(02740, 2) , 
	(02747, 1) , 
	(02780, 1) , 
	(02818, 1) , 
	(02865, 1) , 
	(02882, 1) , 
	(02893, 1) , 
	(03052, 1) , 
	(03440, 2) , 
	(3720, 1) , 
	(03743, 1) , 
	(04027, 1) , 
	(04084, 1) , 
	(04103, 1) , 
	(04270, 1) , 
	(4605, 1) , 
	(4912, 3) , 
	(05676, 1) , 
	(06010, 3) , 
	(06033, 1) , 
	(06062, 1) , 
	(06070, 1) , 
	(06107, 1) , 
	(06119, 1) , 
	(06357, 1) , 
	(06403, 1) , 
	(06405, 1) , 
	(06419, 1) , 
	(06443, 1) , 
	(06484, 2) , 
	(06488, 1) , 
	(06489, 1) , 
	(06512, 1) , 
	(06514, 1) , 
	(06611, 2) , 
	(06614, 1) , 
	(06804, 6) , 
	(06811, 1) , 
	(06812, 1) , 
	(06820, 1) , 
	(06824, 3) , 
	(06851, 3) , 
	(06897, 1) , 
	(07004, 1) , 
	(07054, 1) , 
	(07070, 1) , 
	(07076, 2) , 
	(07079, 2) , 
	(07080, 1) , 
	(07090, 1) , 
	(07305, 1) , 
	(07306, 1) , 
	(07407, 1) , 
	(07436, 1) , 
	(07446, 1) , 
	(07460, 4) , 
	(07631, 1) , 
	(07646, 1) , 
	(07648, 1) , 
	(07676, 1) , 
	(07702, 1) , 
	(07704, 1) , 
	(07712, 1) , 
	(07718, 3) , 
	(07719, 1) , 
	(07722, 1) , 
	(07731, 1) , 
	(07735, 1) , 
	(07753, 1) , 
	(07762, 1) , 
	(07764, 1) , 
	(07826, 1) , 
	(07860, 1) , 
	(07863, 2) , 
	(07871, 1) , 
	(07922, 1) , 
	(07932, 1) , 
	(07950, 1) , 
	(07960, 1) , 
	(07974, 1) , 
	(08003, 2) , 
	(08033, 1) , 
	(08054, 1) , 
	(08062, 1) , 
	(08070, 1) , 
	(08078, 1) , 
	(08096, 1) , 
	(08225, 1) , 
	(08323, 1) , 
	(08402, 1) , 
	(08505, 1) , 
	(08540, 3) , 
	(08558, 1) , 
	(08721, 1) , 
	(08734, 1) , 
	(08816, 2) , 
	(08822, 1) , 
	(08844, 1) , 
	(08850, 1) , 
	(08852, 1) , 
	(08859, 1) , 
	(08873, 1) , 
	(08886, 3) , 
	(08901, 1) , 
	(09087, 1) , 
	(09340, 1) , 
	(09802, 1) , 
	(09874, 1) , 
	(10001, 1) , 
	(10011, 1) , 
	(10028, 1) , 
	(10036, 1) , 
	(10075, 1) , 
	(10530, 1) , 
	(10708, 1) , 
	(10952, 1) , 
	(10954, 1) , 
	(10956, 1) , 
	(10996, 1) , 
	(11001, 2) , 
	(11050, 2) , 
	(11102, 1) , 
	(11105, 2) , 
	(11213, 1) , 
	(11217, 2) , 
	(11221, 1) , 
	(11229, 1) , 
	(11510, 1) , 
	(11530, 1) , 
	(11545, 1) , 
	(11743, 2) , 
	(11751, 1) , 
	(11758, 1) , 
	(11767, 1) , 
	(11786, 1) , 
	(11952, 1) , 
	(12065, 1) , 
	(12120, 1) , 
	(12205, 1) , 
	(12305, 1) , 
	(12306, 1) , 
	(12590, 1) , 
	(12831, 1) , 
	(12866, 1) , 
	(13027, 3) , 
	(13166, 1) , 
	(13501, 4) , 
	(13502, 1) , 
	(14031, 1) , 
	(14059, 1) , 
	(14424, 4) , 
	(14502, 1) , 
	(14513, 1) , 
	(14620, 5) , 
	(15025, 1) , 
	(15037, 2) , 
	(15085, 1) , 
	(15108, 3) , 
	(15116, 1) , 
	(15136, 1) , 
	(15142, 1) , 
	(15215, 1) , 
	(15301, 2) , 
	(15342, 1) , 
	(15601, 2) , 
	(15825, 1) , 
	(16156, 2) , 
	(16417, 2) , 
	(16505, 1) , 
	(16801, 1) , 
	(17015, 1) , 
	(17022, 1) , 
	(17036, 1) , 
	(17063, 5) , 
	(17078, 1) , 
	(17109, 1) , 
	(17111, 1) , 
	(17112, 1) , 
	(17202, 1) , 
	(17344, 1) , 
	(17408, 1) , 
	(17538, 1) , 
	(17543, 1) , 
	(17545, 1) , 
	(17601, 1) , 
	(17740, 1) , 
	(17815, 1) , 
	(17881, 1) , 
	(17931, 1) , 
	(17970, 1) , 
	(17972, 1) , 
	(18013, 1) , 
	(18015, 1) , 
	(18017, 1) , 
	(18102, 1) , 
	(18103, 1) , 
	(18337, 1) , 
	(18360, 2) , 
	(18414, 8) , 
	(18428, 1) , 
	(18612, 2) , 
	(18705, 2) , 
	(18706, 1) , 
	(18844, 1) , 
	(18902, 1) , 
	(18932, 1) , 
	(19004, 1) , 
	(19010, 1) , 
	(19026, 1) , 
	(19046, 1) , 
	(19073, 1) , 
	(19087, 1) , 
	(19118, 1) , 
	(19136, 1) , 
	(19335, 1) , 
	(19350, 1) , 
	(19355, 1) , 
	(19382, 1) , 
	(19422, 4) , 
	(19428, 1) , 
	(19454, 1) , 
	(19462, 3) , 
	(19518, 1) , 
	(19533, 3) , 
	(19607, 1) , 
	(19608, 1) , 
	(19610, 1) , 
	(19702, 3) , 
	(19709, 2) , 
	(19713, 2) , 
	(19804, 1) , 
	(19807, 1) , 
	(19808, 2) , 
	(19810, 3) , 
	(19958, 2) , 
	(19971, 1) , 
	(20001, 1) , 
	(20002, 5) , 
	(20003, 2) , 
	(20005, 1) , 
	(20007, 2) , 
	(20009, 2) , 
	(20057, 1) , 
	(20110, 1) , 
	(20120, 1) , 
	(20121, 1) , 
	(20124, 1) , 
	(20137, 3) , 
	(20141, 3) , 
	(20147, 8) , 
	(20148, 3) , 
	(20151, 3) , 
	(20152, 3) , 
	(20155, 1) , 
	(20169, 9) , 
	(20171, 3) , 
	(20181, 1) , 
	(20191, 1) , 
	(20620, 1) , 
	(20625, 1) , 
	(20636, 4) , 
	(20646, 2) , 
	(20650, 1) , 
	(20659, 1) , 
	(20693, 3) , 
	(20740, 1) , 
	(20745, 1) , 
	(20747, 1) , 
	(20762, 1) , 
	(20772, 1) , 
	(20774, 1) , 
	(20814, 2) , 
	(20815, 2) , 
	(20817, 3) , 
	(20852, 1) , 
	(20853, 1) , 
	(20854, 1) , 
	(20874, 2) , 
	(20878, 2) , 
	(20879, 1) , 
	(20882, 4) , 
	(20902, 1) , 
	(21009, 1) , 
	(21015, 1) , 
	(21035, 3) , 
	(21043, 2) , 
	(21044, 1) , 
	(21047, 3) , 
	(21054, 1) , 
	(21061, 2) , 
	(21085, 1) , 
	(21087, 1) , 
	(21093, 2) , 
	(21111, 2) , 
	(21114, 2) , 
	(21122, 7) , 
	(21146, 3) , 
	(21154, 1) , 
	(21201, 1) , 
	(21210, 2) , 
	(21221, 1) , 
	(21228, 1) , 
	(21230, 2) , 
	(21234, 3) , 
	(21401, 3) , 
	(21403, 1) , 
	(21409, 1) , 
	(21625, 1) , 
	(21778, 1) , 
	(21784, 3) , 
	(21921, 1) , 
	(22003, 1) , 
	(22025, 2) , 
	(22030, 1) , 
	(22032, 1) , 
	(22033, 2) , 
	(22039, 2) , 
	(22043, 1) , 
	(22079, 1) , 
	(22101, 3) , 
	(22102, 1) , 
	(22124, 1) , 
	(22152, 1) , 
	(22153, 1) , 
	(22182, 1) , 
	(22192, 3) , 
	(22201, 1) , 
	(22204, 1) , 
	(22205, 1) , 
	(22207, 1) , 
	(22209, 2) , 
	(22302, 1) , 
	(22304, 2) , 
	(22305, 1) , 
	(22306, 1) , 
	(22310, 1) , 
	(22314, 1) , 
	(22401, 1) , 
	(22405, 1) , 
	(22408, 2) , 
	(22553, 1) , 
	(22554, 1) , 
	(22601, 2) , 
	(22603, 1) , 
	(22611, 2) , 
	(22655, 1) , 
	(22657, 1) , 
	(22701, 3) , 
	(22846, 1) , 
	(22901, 1) , 
	(22902, 2) , 
	(22911, 1) , 
	(22932, 1) , 
	(22972, 4) , 
	(23030, 1) , 
	(23059, 10) , 
	(23060, 1) , 
	(23072, 1) , 
	(23089, 1) , 
	(23111, 3) , 
	(23112, 7) , 
	(23113, 5) , 
	(23116, 1) , 
	(23185, 1) , 
	(23221, 2) , 
	(23223, 1) , 
	(23225, 18) , 
	(23228, 1) , 
	(23229, 4) , 
	(23233, 5) , 
	(23235, 11) , 
	(23236, 6) , 
	(23238, 4) , 
	(23320, 5) , 
	(23451, 1) , 
	(23452, 1) , 
	(23504, 3) , 
	(23518, 1) , 
	(23669, 3) , 
	(23692, 2) , 
	(23701, 1) , 
	(23805, 1) , 
	(23824, 1) , 
	(23831, 1) , 
	(23832, 1) , 
	(23836, 1) , 
	(23970, 1) , 
	(24012, 2) , 
	(24014, 6) , 
	(24018, 8) , 
	(24019, 1) , 
	(24042, 1) , 
	(24060, 2) , 
	(24061, 2) , 
	(24073, 2) , 
	(24092, 1) , 
	(24095, 1) , 
	(24112, 1) , 
	(24141, 1) , 
	(24149, 1) , 
	(24153, 5) , 
	(24174, 1) , 
	(24175, 1) , 
	(24201, 6) , 
	(24202, 10) , 
	(24210, 10) , 
	(24211, 2) , 
	(24212, 4) , 
	(24219, 2) , 
	(24228, 6) , 
	(24236, 1) , 
	(24248, 2) , 
	(24251, 1) , 
	(24263, 1) , 
	(24266, 1) , 
	(24271, 4) , 
	(24273, 9) , 
	(24281, 1) , 
	(24290, 1) , 
	(24340, 1) , 
	(24370, 1) , 
	(24375, 1) , 
	(24382, 1) , 
	(24401, 2) , 
	(24501, 1) , 
	(24502, 2) , 
	(24503, 1) , 
	(24515, 1) , 
	(24517, 1) , 
	(24523, 2) , 
	(24550, 1) , 
	(24551, 5) , 
	(24554, 1) , 
	(24572, 1) , 
	(24577, 1) , 
	(24605, 1) , 
	(24701, 1) , 
	(24731, 1) , 
	(24740, 2) , 
	(24901, 1) , 
	(24970, 2) , 
	(24986, 1) , 
	(25107, 1) , 
	(25301, 1) , 
	(25309, 1) , 
	(25311, 1) , 
	(25314, 1) , 
	(25508, 2) , 
	(25526, 3) , 
	(25545, 1) , 
	(25701, 1) , 
	(25705, 3) , 
	(26038, 1) , 
	(26104, 1) , 
	(26105, 2) , 
	(26346, 1) , 
	(26508, 2) , 
	(26554, 3) , 
	(27012, 1) , 
	(27021, 2) , 
	(27023, 1) , 
	(27025, 1) , 
	(27027, 1) , 
	(27040, 2) , 
	(27041, 1) , 
	(27101, 1) , 
	(27104, 1) , 
	(27106, 1) , 
	(27205, 3) , 
	(27215, 1) , 
	(27239, 1) , 
	(27263, 1) , 
	(27265, 7) , 
	(27284, 2) , 
	(27310, 1) , 
	(27320, 2) , 
	(27330, 1) , 
	(27358, 3) , 
	(27370, 2) , 
	(27401, 5) , 
	(27405, 1) , 
	(27408, 1) , 
	(27409, 1) , 
	(27410, 2) , 
	(27455, 2) , 
	(27513, 3) , 
	(27514, 3) , 
	(27516, 1) , 
	(27517, 1) , 
	(27518, 1) , 
	(27526, 2) , 
	(27527, 3) , 
	(27529, 1) , 
	(27536, 1) , 
	(27545, 1) , 
	(27572, 1) , 
	(27583, 1) , 
	(27587, 3) , 
	(27603, 4) , 
	(27604, 3) , 
	(27607, 11) , 
	(27608, 3) , 
	(27612, 2) , 
	(27613, 3) , 
	(27614, 17) , 
	(27615, 3) , 
	(27616, 3) , 
	(27617, 2) , 
	(27703, 1) , 
	(27704, 1) , 
	(27705, 3) , 
	(27707, 1) , 
	(27708, 1) , 
	(27810, 1) , 
	(27817, 1) , 
	(27837, 1) , 
	(27889, 1) , 
	(27893, 1) , 
	(27960, 1) , 
	(28001, 2) , 
	(28012, 4) , 
	(28025, 15) , 
	(28027, 2) , 
	(28031, 3) , 
	(28037, 1) , 
	(28043, 1) , 
	(28056, 1) , 
	(28075, 3) , 
	(28078, 6) , 
	(28079, 3) , 
	(28083, 2) , 
	(28086, 2) , 
	(28092, 1) , 
	(28103, 1) , 
	(28104, 4) , 
	(28105, 1) , 
	(28110, 1) , 
	(28114, 1) , 
	(28117, 2) , 
	(28120, 1) , 
	(28134, 1) , 
	(28139, 1) , 
	(28146, 1) , 
	(28147, 4) , 
	(28150, 1) , 
	(28152, 2) , 
	(28164, 1) , 
	(28173, 11) , 
	(28202, 1) , 
	(28204, 1) , 
	(28206, 1) , 
	(28209, 6) , 
	(28210, 13) , 
	(28211, 1) , 
	(28213, 1) , 
	(28214, 1) , 
	(28216, 2) , 
	(28217, 1) , 
	(28226, 3) , 
	(28227, 3) , 
	(28270, 4) , 
	(28277, 2) , 
	(28278, 1) , 
	(28304, 1) , 
	(28305, 2) , 
	(28311, 2) , 
	(28352, 1) , 
	(28387, 1) , 
	(28390, 2) , 
	(28403, 1) , 
	(28405, 1) , 
	(28411, 2) , 
	(28450, 7) , 
	(28461, 1) , 
	(28518, 1) , 
	(28525, 1) , 
	(28557, 2) , 
	(28562, 2) , 
	(28601, 2) , 
	(28602, 2) , 
	(28607, 3) , 
	(28621, 3) , 
	(28622, 1) , 
	(28630, 1) , 
	(28634, 1) , 
	(28655, 4) , 
	(28658, 1) , 
	(28659, 4) , 
	(28677, 1) , 
	(28685, 1) , 
	(28704, 5) , 
	(28714, 2) , 
	(28715, 4) , 
	(28716, 2) , 
	(28721, 2) , 
	(28730, 4) , 
	(28732, 7) , 
	(28734, 4) , 
	(28739, 1) , 
	(28746, 1) , 
	(28751, 1) , 
	(28753, 1) , 
	(28759, 1) , 
	(28762, 1) , 
	(28778, 1) , 
	(28779, 1) , 
	(28786, 2) , 
	(28787, 1) , 
	(28792, 4) , 
	(28801, 1) , 
	(28803, 3) , 
	(28804, 2) , 
	(28805, 1) , 
	(28806, 2) , 
	(28901, 1) , 
	(28902, 1) , 
	(28906, 1) , 
	(29033, 2) , 
	(29063, 1) , 
	(29067, 1) , 
	(29070, 1) , 
	(29072, 3) , 
	(29108, 1) , 
	(29115, 1) , 
	(29138, 2) , 
	(29150, 2) , 
	(29154, 1) , 
	(29155, 1) , 
	(29201, 2) , 
	(29203, 1) , 
	(29206, 1) , 
	(29210, 2) , 
	(29223, 1) , 
	(29229, 2) , 
	(29301, 2) , 
	(29302, 2) , 
	(29303, 1) , 
	(29307, 2) , 
	(29316, 1) , 
	(29332, 2) , 
	(29349, 1) , 
	(29360, 1) , 
	(29365, 2) , 
	(29369, 2) , 
	(29401, 1) , 
	(29404, 2) , 
	(29407, 3) , 
	(29412, 1) , 
	(29420, 1) , 
	(29445, 1) , 
	(29464, 4) , 
	(29466, 4) , 
	(29483, 2) , 
	(29485, 1) , 
	(29492, 4) , 
	(29501, 3) , 
	(29550, 1) , 
	(29572, 1) , 
	(29575, 1) , 
	(29576, 7) , 
	(29579, 4) , 
	(29585, 1) , 
	(29588, 1) , 
	(29601, 1) , 
	(29605, 4) , 
	(29609, 3) , 
	(29613, 1) , 
	(29615, 4) , 
	(29621, 2) , 
	(29630, 2) , 
	(29631, 3) , 
	(29642, 1) , 
	(29649, 3) , 
	(29650, 4) , 
	(29651, 1) , 
	(29662, 1) , 
	(29670, 1) , 
	(29672, 3) , 
	(29678, 4) , 
	(29680, 7) , 
	(29681, 5) , 
	(29687, 4) , 
	(29689, 1) , 
	(29704, 1) , 
	(29708, 5) , 
	(29710, 1) , 
	(29730, 2) , 
	(29731, 1) , 
	(29801, 3) , 
	(29803, 6) , 
	(29828, 1) , 
	(29829, 2) , 
	(29841, 2) , 
	(29860, 1) , 
	(29907, 1) , 
	(29916, 1) , 
	(29928, 4) , 
	(30004, 2) , 
	(30005, 3) , 
	(30009, 2) , 
	(30011, 1) , 
	(30012, 2) , 
	(30019, 4) , 
	(30022, 14) , 
	(30024, 9) , 
	(30028, 2) , 
	(30030, 3) , 
	(30035, 1) , 
	(30040, 2) , 
	(30041, 4) , 
	(30043, 5) , 
	(30044, 2) , 
	(30045, 1) , 
	(30047, 2) , 
	(30052, 4) , 
	(30060, 2) , 
	(30062, 10) , 
	(30064, 4) , 
	(30066, 6) , 
	(30067, 5) , 
	(30068, 2) , 
	(30071, 1) , 
	(30075, 10) , 
	(30076, 5) , 
	(30078, 1) , 
	(30080, 3) , 
	(30082, 2) , 
	(30084, 1) , 
	(30087, 1) , 
	(30093, 1) , 
	(30094, 1) , 
	(30096, 2) , 
	(30097, 4) , 
	(30101, 1) , 
	(30110, 1) , 
	(30114, 20) , 
	(30115, 2) , 
	(30116, 2) , 
	(30117, 1) , 
	(30120, 2) , 
	(30121, 1) , 
	(30126, 2) , 
	(30127, 8) , 
	(30132, 4) , 
	(30135, 1) , 
	(30144, 9) , 
	(30147, 1) , 
	(30149, 1) , 
	(30152, 10) , 
	(30153, 1) , 
	(30157, 2) , 
	(30161, 1) , 
	(30165, 2) , 
	(30171, 1) , 
	(30180, 5) , 
	(30184, 1) , 
	(30187, 2) , 
	(30188, 8) , 
	(30189, 7) , 
	(30214, 4) , 
	(30215, 2) , 
	(30224, 1) , 
	(30233, 1) , 
	(30238, 2) , 
	(30240, 1) , 
	(30252, 2) , 
	(30253, 2) , 
	(30260, 1) , 
	(30263, 4) , 
	(30265, 9) , 
	(30269, 4) , 
	(30276, 1) , 
	(30277, 1) , 
	(30278, 1) , 
	(30281, 3) , 
	(30295, 1) , 
	(30305, 71) , 
	(30306, 4) , 
	(30307, 6) , 
	(30308, 6) , 
	(30309, 3) , 
	(30312, 1) , 
	(30316, 5) , 
	(30318, 8) , 
	(30319, 4) , 
	(30325, 2) , 
	(30326, 1) , 
	(30327, 2) , 
	(30332, 1) , 
	(30338, 4) , 
	(30339, 5) , 
	(30340, 3) , 
	(30341, 6) , 
	(30342, 7) , 
	(30344, 1) , 
	(30345, 7) , 
	(30346, 2) , 
	(30360, 1) , 
	(30427, 2) , 
	(30458, 5) , 
	(30461, 1) , 
	(30474, 1) , 
	(30501, 3) , 
	(30506, 1) , 
	(30507, 2) , 
	(30518, 6) , 
	(30519, 1) , 
	(30525, 1) , 
	(30527, 3) , 
	(30529, 2) , 
	(30531, 2) , 
	(30534, 2) , 
	(30541, 1) , 
	(30548, 2) , 
	(30549, 2) , 
	(30605, 2) , 
	(30606, 2) , 
	(30607, 1) , 
	(30609, 1) , 
	(30620, 2) , 
	(30656, 1) , 
	(30660, 3) , 
	(30677, 1) , 
	(30701, 3) , 
	(30707, 3) , 
	(30710, 1) , 
	(30720, 4) , 
	(30721, 6) , 
	(30736, 16) , 
	(30737, 1) , 
	(30738, 1) , 
	(30739, 4) , 
	(30740, 2) , 
	(30741, 4) , 
	(30742, 3) , 
	(30752, 2) , 
	(30753, 1) , 
	(30755, 4) , 
	(30809, 5) , 
	(30813, 4) , 
	(30814, 1) , 
	(30906, 1) , 
	(30907, 2) , 
	(30909, 1) , 
	(31014, 2) , 
	(31023, 1) , 
	(31024, 2) , 
	(31028, 3) , 
	(31069, 4) , 
	(31088, 8) , 
	(31093, 3) , 
	(31207, 1) , 
	(31211, 2) , 
	(31322, 5) , 
	(31329, 1) , 
	(31405, 1) , 
	(31406, 1) , 
	(31410, 1) , 
	(31415, 1) , 
	(31419, 1) , 
	(31522, 4) , 
	(31558, 5) , 
	(31601, 1) , 
	(31602, 3) , 
	(31622, 1) , 
	(31705, 1) , 
	(31707, 1) , 
	(31721, 1) , 
	(31792, 4) , 
	(31794, 1) , 
	(31804, 1) , 
	(31806, 4) , 
	(31904, 2) , 
	(31906, 1) , 
	(31909, 1) , 
	(32003, 7) , 
	(32034, 2) , 
	(32065, 4) , 
	(32073, 3) , 
	(32080, 1) , 
	(32082, 2) , 
	(32092, 1) , 
	(32097, 1) , 
	(32159, 1) , 
	(32210, 1) , 
	(32220, 1) , 
	(32224, 1) , 
	(32226, 2) , 
	(32250, 1) , 
	(32256, 13) , 
	(32257, 1) , 
	(32258, 3) , 
	(32259, 1) , 
	(32301, 1) , 
	(32303, 4) , 
	(32304, 1) , 
	(32305, 1) , 
	(32309, 1) , 
	(32312, 1) , 
	(32401, 1) , 
	(32408, 1) , 
	(32413, 2) , 
	(32433, 1) , 
	(32439, 2) , 
	(32503, 2) , 
	(32507, 1) , 
	(32514, 1) , 
	(32547, 1) , 
	(32566, 2) , 
	(32569, 1) , 
	(32578, 9) , 
	(32605, 1) , 
	(32607, 1) , 
	(32608, 5) , 
	(32707, 1) , 
	(32712, 1) , 
	(32714, 6) , 
	(32724, 1) , 
	(32726, 1) , 
	(32738, 1) , 
	(32746, 4) , 
	(32765, 1) , 
	(32784, 1) , 
	(32789, 2) , 
	(32792, 1) , 
	(32803, 1) , 
	(32808, 1) , 
	(32810, 4) , 
	(32814, 1) , 
	(32817, 1) , 
	(32821, 1) , 
	(32825, 1) , 
	(32828, 1) , 
	(32832, 3) , 
	(32837, 1) , 
	(32901, 5) , 
	(32903, 2) , 
	(32904, 1) , 
	(32934, 1) , 
	(32940, 5) , 
	(32952, 3) , 
	(32953, 1) , 
	(32960, 1) , 
	(32963, 1) , 
	(33027, 1) , 
	(33040, 5) , 
	(33068, 1) , 
	(33071, 1) , 
	(33076, 1) , 
	(33134, 1) , 
	(33141, 3) , 
	(33144, 1) , 
	(33166, 1) , 
	(33172, 1) , 
	(33176, 1) , 
	(33178, 1) , 
	(33304, 2) , 
	(33305, 1) , 
	(33308, 1) , 
	(33314, 1) , 
	(33316, 2) , 
	(33319, 1) , 
	(33324, 1) , 
	(33334, 7) , 
	(33408, 1) , 
	(33411, 1) , 
	(33414, 1) , 
	(33415, 4) , 
	(33428, 2) , 
	(33431, 1) , 
	(33434, 4) , 
	(33445, 1) , 
	(33458, 1) , 
	(33459, 1) , 
	(33469, 4) , 
	(33478, 2) , 
	(33511, 1) , 
	(33541, 1) , 
	(33547, 3) , 
	(33549, 1) , 
	(33558, 5) , 
	(33566, 1) , 
	(33579, 1) , 
	(33596, 1) , 
	(33606, 1) , 
	(33607, 1) , 
	(33609, 1) , 
	(33618, 2) , 
	(33619, 1) , 
	(33625, 1) , 
	(33626, 3) , 
	(33629, 2) , 
	(33647, 1) , 
	(33703, 1) , 
	(33704, 1) , 
	(33764, 1) , 
	(33765, 1) , 
	(33785, 1) , 
	(33801, 1) , 
	(33813, 6) , 
	(33870, 3) , 
	(33912, 1) , 
	(33914, 1) , 
	(33919, 1) , 
	(33936, 1) , 
	(33966, 1) , 
	(34119, 7) , 
	(34209, 1) , 
	(34212, 1) , 
	(34231, 1) , 
	(34232, 2) , 
	(34243, 1) , 
	(34285, 1) , 
	(34476, 1) , 
	(34479, 3) , 
	(34480, 1) , 
	(34637, 1) , 
	(34667, 1) , 
	(34685, 1) , 
	(34691, 1) , 
	(34695, 1) , 
	(34711, 1) , 
	(34714, 1) , 
	(34744, 2) , 
	(34761, 1) , 
	(34771, 1) , 
	(34772, 1) , 
	(34774, 1) , 
	(34787, 2) , 
	(34952, 3) , 
	(34974, 1) , 
	(34981, 1) , 
	(34997, 1) , 
	(35055, 1) , 
	(35071, 1) , 
	(35080, 1) , 
	(35087, 1) , 
	(35120, 1) , 
	(35124, 2) , 
	(35133, 4) , 
	(35148, 1) , 
	(35173, 10) , 
	(35186, 1) , 
	(35203, 8) , 
	(35209, 2) , 
	(35213, 1) , 
	(35223, 1) , 
	(35226, 3) , 
	(35242, 3) , 
	(35243, 1) , 
	(35244, 7) , 
	(35401, 1) , 
	(35466, 1) , 
	(35475, 1) , 
	(35601, 1) , 
	(35603, 14) , 
	(35610, 1) , 
	(35611, 1) , 
	(35613, 2) , 
	(35620, 1) , 
	(35630, 2) , 
	(35633, 1) , 
	(35634, 2) , 
	(35652, 7) , 
	(35659, 1) , 
	(35660, 2) , 
	(35661, 4) , 
	(35674, 2) , 
	(35739, 1) , 
	(35741, 1) , 
	(35747, 3) , 
	(35749, 3) , 
	(35750, 4) , 
	(35754, 1) , 
	(35757, 1) , 
	(35758, 10) , 
	(35763, 2) , 
	(35764, 1) , 
	(35772, 1) , 
	(35773, 1) , 
	(35801, 4) , 
	(35802, 2) , 
	(35806, 3) , 
	(35810, 1) , 
	(35811, 1) , 
	(35905, 1) , 
	(35907, 1) , 
	(35953, 1) , 
	(35981, 1) , 
	(36027, 1) , 
	(36106, 1) , 
	(36117, 8) , 
	(36251, 1) , 
	(36265, 1) , 
	(36272, 1) , 
	(36303, 2) , 
	(36305, 1) , 
	(36312, 5) , 
	(36330, 3) , 
	(36360, 2) , 
	(36460, 1) , 
	(36507, 3) , 
	(36526, 4) , 
	(36532, 1) , 
	(36544, 1) , 
	(36567, 9) , 
	(36571, 1) , 
	(36572, 1) , 
	(36608, 3) , 
	(36695, 2) , 
	(36784, 1) , 
	(36801, 1) , 
	(36830, 4) , 
	(36854, 1) , 
	(36867, 1) , 
	(36916, 3) , 
	(37013, 16) , 
	(37014, 1) , 
	(37015, 2) , 
	(37020, 1) , 
	(37025, 2) , 
	(37026, 1) , 
	(37027, 93) , 
	(37029, 2) , 
	(37030, 7) , 
	(37033, 6) , 
	(37034, 2) , 
	(37036, 4) , 
	(37040, 18) , 
	(37042, 11) , 
	(37043, 23) , 
	(37046, 2) , 
	(37047, 2) , 
	(37048, 6) , 
	(37049, 1) , 
	(37051, 1) , 
	(37055, 4) , 
	(37058, 1) , 
	(37060, 1) , 
	(37061, 1) , 
	(37062, 7) , 
	(37064, 69) , 
	(37066, 53) , 
	(37067, 31) , 
	(37069, 31) , 
	(37072, 14) , 
	(37073, 8) , 
	(37074, 3) , 
	(37075, 63) , 
	(37076, 22) , 
	(37079, 1) , 
	(37080, 3) , 
	(37082, 4) , 
	(37083, 6) , 
	(37086, 13) , 
	(37087, 30) , 
	(37090, 8) , 
	(37091, 18) , 
	(37095, 1) , 
	(37096, 2) , 
	(37097, 1) , 
	(37098, 1) , 
	(37101, 1) , 
	(37110, 9) , 
	(37111, 2) , 
	(37115, 5) , 
	(37122, 32) , 
	(37127, 5) , 
	(37128, 21) , 
	(37129, 22) , 
	(37130, 9) , 
	(37134, 3) , 
	(37135, 15) , 
	(37136, 1) , 
	(37138, 8) , 
	(37143, 2) , 
	(37146, 2) , 
	(37148, 27) , 
	(37149, 1) , 
	(37150, 1) , 
	(37151, 2) , 
	(37160, 13) , 
	(37166, 5) , 
	(37167, 18) , 
	(37172, 17) , 
	(37174, 27) , 
	(37175, 1) , 
	(37179, 6) , 
	(37180, 1) , 
	(37184, 3) , 
	(37185, 1) , 
	(37186, 1) , 
	(37188, 10) , 
	(37191, 4) , 
	(37196, 1) , 
	(37203, 12) , 
	(37204, 10) , 
	(37205, 33) , 
	(37206, 5) , 
	(37207, 7) , 
	(37208, 5) , 
	(37209, 14) , 
	(37211, 28) , 
	(37212, 35) , 
	(37214, 17) , 
	(37215, 43) , 
	(37216, 5) , 
	(37217, 7) , 
	(37218, 2) , 
	(37219, 2) , 
	(37220, 9) , 
	(37221, 56) , 
	(37228, 2) , 
	(37302, 2) , 
	(37303, 14) , 
	(37307, 7) , 
	(37308, 4) , 
	(37309, 1) , 
	(37310, 4) , 
	(37311, 8) , 
	(37312, 34) , 
	(37318, 1) , 
	(37321, 13) , 
	(37322, 1) , 
	(37323, 19) , 
	(37324, 2) , 
	(37327, 9) , 
	(37329, 2) , 
	(37330, 2) , 
	(37331, 3) , 
	(37334, 12) , 
	(37335, 1) , 
	(37336, 2) , 
	(37341, 12) , 
	(37343, 30) , 
	(37347, 2) , 
	(37348, 1) , 
	(37352, 3) , 
	(37353, 1) , 
	(37354, 6) , 
	(37355, 9) , 
	(37356, 4) , 
	(37357, 1) , 
	(37360, 1) , 
	(37362, 5) , 
	(37363, 43) , 
	(37367, 1) , 
	(37370, 2) , 
	(37375, 3) , 
	(37377, 31) , 
	(37379, 22) , 
	(37380, 5) , 
	(37381, 6) , 
	(37385, 7) , 
	(37388, 14) , 
	(37391, 2) , 
	(37397, 6) , 
	(37398, 9) , 
	(37402, 4) , 
	(37403, 4) , 
	(37404, 1) , 
	(37405, 7) , 
	(37406, 3) , 
	(37407, 1) , 
	(37408, 7) , 
	(37411, 3) , 
	(37412, 15) , 
	(37415, 25) , 
	(37416, 13) , 
	(37419, 15) , 
	(37421, 46) , 
	(37504, 1) , 
	(37601, 29) , 
	(37604, 73) , 
	(37605, 1) , 
	(37614, 3) , 
	(37615, 19) , 
	(37616, 2) , 
	(37617, 9) , 
	(37618, 10) , 
	(37620, 25) , 
	(37641, 4) , 
	(37642, 14) , 
	(37643, 23) , 
	(37645, 4) , 
	(37650, 10) , 
	(37656, 5) , 
	(37658, 3) , 
	(37659, 29) , 
	(37660, 40) , 
	(37662, 1) , 
	(37663, 21) , 
	(37664, 39) , 
	(37665, 4) , 
	(37681, 3) , 
	(37683, 2) , 
	(37686, 5) , 
	(37690, 4) , 
	(37692, 4) , 
	(37701, 4) , 
	(37705, 1) , 
	(37708, 2) , 
	(37709, 2) , 
	(37714, 2) , 
	(37716, 22) , 
	(37717, 1) , 
	(37719, 2) , 
	(37721, 73) , 
	(37725, 11) , 
	(37726, 1) , 
	(37737, 6) , 
	(37738, 1) , 
	(37742, 1) , 
	(37743, 23) , 
	(37744, 2) , 
	(37745, 18) , 
	(37748, 10) , 
	(37752, 7) , 
	(37754, 3) , 
	(37755, 5) , 
	(37757, 10) , 
	(37760, 4) , 
	(37762, 4) , 
	(37763, 14) , 
	(37764, 4) , 
	(37766, 4) , 
	(37770, 3) , 
	(37771, 9) , 
	(37772, 21) , 
	(37774, 10) , 
	(37777, 21) , 
	(37779, 3) , 
	(37801, 20) , 
	(37803, 25) , 
	(37804, 23) , 
	(37806, 4) , 
	(37807, 4) , 
	(37811, 1) , 
	(37813, 14) , 
	(37814, 35) , 
	(37818, 4) , 
	(37819, 4) , 
	(37820, 2) , 
	(37821, 5) , 
	(37825, 2) , 
	(37826, 1) , 
	(37828, 1) , 
	(37830, 21) , 
	(37840, 11) , 
	(37841, 7) , 
	(37843, 2) , 
	(37846, 1) , 
	(37849, 19) , 
	(37853, 3) , 
	(37854, 1) , 
	(37857, 14) , 
	(37860, 2) , 
	(37861, 8) , 
	(37862, 14) , 
	(37863, 9) , 
	(37865, 21) , 
	(37870, 1) , 
	(37871, 2) , 
	(37873, 2) , 
	(37874, 4) , 
	(37876, 6) , 
	(37877, 8) , 
	(37879, 5) , 
	(37880, 2) , 
	(37881, 3) , 
	(37882, 5) , 
	(37885, 5) , 
	(37886, 1) , 
	(37887, 5) , 
	(37890, 6) , 
	(37902, 23) , 
	(37906, 1) , 
	(37909, 29) , 
	(37912, 33) , 
	(37914, 9) , 
	(37915, 4) , 
	(37916, 157) , 
	(37917, 28) , 
	(37918, 41) , 
	(37919, 92) , 
	(37920, 119) , 
	(37921, 35) , 
	(37922, 81) , 
	(37923, 108) , 
	(37924, 3) , 
	(37927, 1) , 
	(37931, 22) , 
	(37932, 43) , 
	(37934, 41) , 
	(37938, 19) , 
	(37939, 1) , 
	(37950, 1) , 
	(37996, 222) , 
	(38002, 15) , 
	(38004, 12) , 
	(38006, 2) , 
	(38011, 1) , 
	(38012, 14) , 
	(38015, 3) , 
	(38016, 13) , 
	(38017, 46) , 
	(38018, 23) , 
	(38019, 13) , 
	(38023, 1) , 
	(38024, 9) , 
	(38028, 3) , 
	(38052, 4) , 
	(38053, 4) , 
	(38058, 2) , 
	(38059, 5) , 
	(38060, 8) , 
	(38063, 2) , 
	(38066, 1) , 
	(38103, 7) , 
	(38104, 12) , 
	(38105, 3) , 
	(38107, 1) , 
	(38108, 1) , 
	(38109, 2) , 
	(38111, 11) , 
	(38112, 3) , 
	(38115, 2) , 
	(38116, 1) , 
	(38117, 33) , 
	(38119, 14) , 
	(38120, 19) , 
	(38122, 1) , 
	(38125, 6) , 
	(38127, 1) , 
	(38128, 2) , 
	(38133, 10) , 
	(38134, 7) , 
	(38135, 16) , 
	(38138, 19) , 
	(38139, 37) , 
	(38157, 1) , 
	(38163, 4) , 
	(38201, 7) , 
	(38221, 3) , 
	(38225, 1) , 
	(38230, 7) , 
	(38232, 1) , 
	(38233, 1) , 
	(38236, 1) , 
	(38237, 15) , 
	(38242, 13) , 
	(38253, 2) , 
	(38257, 1) , 
	(38259, 1) , 
	(38261, 9) , 
	(38301, 15) , 
	(38305, 41) , 
	(38310, 1) , 
	(38315, 1) , 
	(38317, 2) , 
	(38320, 6) , 
	(38326, 2) , 
	(38334, 1) , 
	(38340, 7) , 
	(38343, 8) , 
	(38344, 4) , 
	(38351, 8) , 
	(38355, 8) , 
	(38356, 1) , 
	(38358, 8) , 
	(38363, 4) , 
	(38366, 3) , 
	(38367, 2) , 
	(38368, 3) , 
	(38369, 2) , 
	(38372, 8) , 
	(38374, 1) , 
	(38375, 6) , 
	(38379, 5) , 
	(38381, 1) , 
	(38382, 2) , 
	(38401, 32) , 
	(38450, 1) , 
	(38451, 1) , 
	(38452, 1) , 
	(38461, 2) , 
	(38462, 3) , 
	(38464, 27) , 
	(38468, 2) , 
	(38469, 3) , 
	(38474, 4) , 
	(38477, 6) , 
	(38478, 8) , 
	(38481, 1) , 
	(38482, 3) , 
	(38483, 2) , 
	(38487, 1) , 
	(38501, 21) , 
	(38504, 1) , 
	(38505, 1) , 
	(38506, 9) , 
	(38544, 3) , 
	(38547, 2) , 
	(38548, 1) , 
	(38551, 4) , 
	(38555, 6) , 
	(38556, 1) , 
	(38558, 2) , 
	(38563, 1) , 
	(38568, 1) , 
	(38570, 7) , 
	(38571, 6) , 
	(38572, 3) , 
	(38573, 2) , 
	(38574, 1) , 
	(38577, 3) , 
	(38579, 1) , 
	(38581, 1) , 
	(38583, 6) , 
	(38614, 1) , 
	(38632, 2) , 
	(38642, 1) , 
	(38652, 1) , 
	(38654, 5) , 
	(38655, 6) , 
	(38671, 5) , 
	(38672, 2) , 
	(38676, 1) , 
	(38801, 4) , 
	(38829, 2) , 
	(38834, 3) , 
	(38843, 1) , 
	(38852, 1) , 
	(38866, 1) , 
	(38901, 1) , 
	(39047, 1) , 
	(39056, 3) , 
	(39092, 4) , 
	(39110, 7) , 
	(39183, 1) , 
	(39201, 2) , 
	(39208, 1) , 
	(39305, 1) , 
	(39307, 1) , 
	(39335, 1) , 
	(39402, 2) , 
	(39437, 2) , 
	(39507, 1) , 
	(39532, 1) , 
	(39564, 2) , 
	(39565, 2) , 
	(39581, 1) , 
	(39702, 1) , 
	(39744, 5) , 
	(39759, 3) , 
	(40059, 1) , 
	(40069, 1) , 
	(40078, 5) , 
	(40162, 1) , 
	(40202, 1) , 
	(40205, 6) , 
	(40206, 1) , 
	(40207, 1) , 
	(40213, 1) , 
	(40218, 1) , 
	(40219, 1) , 
	(40220, 2) , 
	(40222, 4) , 
	(40228, 1) , 
	(40241, 1) , 
	(40245, 5) , 
	(40258, 1) , 
	(40299, 1) , 
	(40356, 1) , 
	(40383, 2) , 
	(40391, 2) , 
	(40422, 3) , 
	(40475, 1) , 
	(40502, 3) , 
	(40503, 2) , 
	(40505, 1) , 
	(40508, 1) , 
	(40509, 3) , 
	(40511, 2) , 
	(40515, 6) , 
	(40601, 1) , 
	(40701, 2) , 
	(40744, 1) , 
	(40815, 1) , 
	(40965, 1) , 
	(41005, 2) , 
	(41011, 1) , 
	(41017, 1) , 
	(41018, 5) , 
	(41042, 2) , 
	(41075, 1) , 
	(41091, 6) , 
	(41101, 1) , 
	(41102, 1) , 
	(42001, 1) , 
	(42002, 1) , 
	(42025, 1) , 
	(42029, 3) , 
	(42066, 1) , 
	(42101, 8) , 
	(42103, 1) , 
	(42104, 5) , 
	(42134, 2) , 
	(42160, 1) , 
	(42164, 1) , 
	(42206, 1) , 
	(42223, 1) , 
	(42301, 1) , 
	(42337, 1) , 
	(42431, 1) , 
	(42503, 2) , 
	(42701, 8) , 
	(42728, 1) , 
	(43016, 2) , 
	(43021, 2) , 
	(43026, 3) , 
	(43035, 1) , 
	(43040, 1) , 
	(43045, 1) , 
	(43064, 1) , 
	(43068, 1) , 
	(43081, 1) , 
	(43082, 1) , 
	(43084, 1) , 
	(43204, 1) , 
	(43212, 1) , 
	(43214, 1) , 
	(43215, 1) , 
	(43220, 1) , 
	(43221, 1) , 
	(43235, 1) , 
	(43302, 1) , 
	(43447, 3) , 
	(43512, 1) , 
	(43526, 1) , 
	(43551, 1) , 
	(43560, 2) , 
	(43566, 1) , 
	(43613, 1) , 
	(43619, 1) , 
	(43920, 1) , 
	(43952, 1) , 
	(44004, 1) , 
	(44055, 2) , 
	(44081, 1) , 
	(44093, 1) , 
	(44117, 1) , 
	(44133, 1) , 
	(44136, 1) , 
	(44145, 2) , 
	(44203, 1) , 
	(44221, 1) , 
	(44254, 2) , 
	(44266, 1) , 
	(44286, 2) , 
	(44420, 1) , 
	(44483, 1) , 
	(44514, 1) , 
	(44646, 1) , 
	(44697, 1) , 
	(44720, 1) , 
	(44906, 1) , 
	(45002, 1) , 
	(45005, 1) , 
	(45011, 8) , 
	(45013, 2) , 
	(45015, 3) , 
	(45036, 2) , 
	(45039, 4) , 
	(45040, 4) , 
	(45050, 1) , 
	(45069, 1) , 
	(45103, 2) , 
	(45140, 5) , 
	(45174, 1) , 
	(45202, 2) , 
	(45213, 1) , 
	(45219, 2) , 
	(45220, 1) , 
	(45227, 1) , 
	(45229, 1) , 
	(45230, 2) , 
	(45231, 2) , 
	(45236, 1) , 
	(45238, 2) , 
	(45241, 4) , 
	(45242, 1) , 
	(45243, 1) , 
	(45244, 2) , 
	(45245, 1) , 
	(45248, 2) , 
	(45302, 1) , 
	(45322, 3) , 
	(45333, 1) , 
	(45342, 1) , 
	(45349, 1) , 
	(45373, 1) , 
	(45414, 1) , 
	(45415, 1) , 
	(45417, 2) , 
	(45431, 1) , 
	(45440, 2) , 
	(45449, 1) , 
	(45458, 1) , 
	(45459, 4) , 
	(45504, 1) , 
	(45506, 1) , 
	(45657, 1) , 
	(45662, 2) , 
	(45663, 1) , 
	(45750, 1) , 
	(45772, 1) , 
	(45805, 1) , 
	(45840, 2) , 
	(45853, 1) , 
	(46012, 1) , 
	(46032, 2) , 
	(46033, 2) , 
	(46034, 1) , 
	(46037, 2) , 
	(46069, 1) , 
	(46072, 1) , 
	(46077, 10) , 
	(46106, 2) , 
	(46112, 1) , 
	(46123, 1) , 
	(46142, 1) , 
	(46143, 1) , 
	(46148, 1) , 
	(46163, 1) , 
	(46201, 1) , 
	(46204, 2) , 
	(46219, 2) , 
	(46228, 1) , 
	(46229, 1) , 
	(46236, 1) , 
	(46237, 3) , 
	(46241, 1) , 
	(46254, 1) , 
	(46310, 1) , 
	(46319, 1) , 
	(46368, 3) , 
	(46373, 1) , 
	(46530, 1) , 
	(46540, 1) , 
	(46544, 1) , 
	(46545, 1) , 
	(46573, 1) , 
	(46614, 1) , 
	(46617, 1) , 
	(46703, 1) , 
	(46706, 1) , 
	(46725, 1) , 
	(46738, 3) , 
	(46806, 1) , 
	(46807, 7) , 
	(46815, 2) , 
	(46835, 1) , 
	(46845, 4) , 
	(46933, 1) , 
	(46979, 1) , 
	(47042, 1) , 
	(47112, 1) , 
	(47122, 1) , 
	(47138, 1) , 
	(47161, 1) , 
	(47243, 1) , 
	(47274, 1) , 
	(47304, 2) , 
	(47330, 1) , 
	(47331, 3) , 
	(47338, 2) , 
	(47396, 2) , 
	(47591, 2) , 
	(47610, 1) , 
	(47620, 1) , 
	(47630, 1) , 
	(47711, 2) , 
	(47714, 4) , 
	(47715, 1) , 
	(47720, 1) , 
	(47725, 2) , 
	(47802, 2) , 
	(47906, 2) , 
	(47941, 1) , 
	(47978, 1) , 
	(48025, 1) , 
	(48035, 1) , 
	(48044, 1) , 
	(48085, 1) , 
	(48104, 1) , 
	(48152, 1) , 
	(48158, 1) , 
	(48165, 1) , 
	(48176, 1) , 
	(48183, 2) , 
	(48187, 1) , 
	(48226, 1) , 
	(48302, 2) , 
	(48307, 1) , 
	(48314, 1) , 
	(48322, 1) , 
	(48334, 1) , 
	(48335, 1) , 
	(48346, 1) , 
	(48377, 1) , 
	(48380, 1) , 
	(48439, 1) , 
	(48450, 3) , 
	(48746, 1) , 
	(48820, 1) , 
	(48823, 1) , 
	(48858, 2) , 
	(48906, 1) , 
	(49007, 1) , 
	(49045, 1) , 
	(49053, 1) , 
	(49071, 1) , 
	(49085, 1) , 
	(49112, 3) , 
	(49240, 1) , 
	(49250, 1) , 
	(49321, 2) , 
	(49401, 1) , 
	(49419, 1) , 
	(49441, 1) , 
	(49456, 1) , 
	(49504, 1) , 
	(50105, 1) , 
	(50109, 1) , 
	(50112, 1) , 
	(50311, 2) , 
	(50312, 1) , 
	(50322, 1) , 
	(50323, 1) , 
	(51055, 1) , 
	(51104, 1) , 
	(52068, 1) , 
	(52402, 1) , 
	(52403, 2) , 
	(52722, 3) , 
	(52756, 3) , 
	(52761, 1) , 
	(52803, 1) , 
	(53022, 1) , 
	(53029, 1) , 
	(53066, 1) , 
	(53092, 1) , 
	(53186, 2) , 
	(53228, 1) , 
	(53532, 2) , 
	(53562, 1) , 
	(53574, 1) , 
	(53598, 2) , 
	(53705, 1) , 
	(53715, 1) , 
	(53717, 3) , 
	(53718, 1) , 
	(53719, 1) , 
	(54016, 2) , 
	(54115, 1) , 
	(54235, 1) , 
	(54449, 1) , 
	(54703, 1) , 
	(54880, 1) , 
	(54913, 1) , 
	(54915, 1) , 
	(55068, 2) , 
	(55082, 1) , 
	(55105, 1) , 
	(55106, 1) , 
	(55122, 1) , 
	(55124, 1) , 
	(55311, 2) , 
	(55352, 1) , 
	(55364, 1) , 
	(55409, 3) , 
	(55429, 1) , 
	(55449, 1) , 
	(55902, 1) , 
	(56081, 1) , 
	(56401, 1) , 
	(56425, 1) , 
	(57106, 1) , 
	(57580, 1) , 
	(58103, 1) , 
	(58701, 2) , 
	(58763, 2) , 
	(59047, 1) , 
	(59718, 2) , 
	(59725, 1) , 
	(60004, 2) , 
	(60007, 1) , 
	(60010, 1) , 
	(60014, 1) , 
	(60015, 1) , 
	(60030, 1) , 
	(60041, 1) , 
	(60044, 1) , 
	(60046, 1) , 
	(60048, 1) , 
	(60050, 1) , 
	(60051, 1) , 
	(60056, 1) , 
	(60060, 1) , 
	(60067, 1) , 
	(60073, 1) , 
	(60085, 1) , 
	(60089, 1) , 
	(60091, 4) , 
	(60103, 1) , 
	(60134, 1) , 
	(60174, 2) , 
	(60175, 3) , 
	(60177, 1) , 
	(60185, 1) , 
	(60188, 1) , 
	(60189, 1) , 
	(60190, 1) , 
	(60201, 1) , 
	(60408, 1) , 
	(60428, 1) , 
	(60441, 1) , 
	(60463, 3) , 
	(60471, 1) , 
	(60487, 1) , 
	(60491, 1) , 
	(60503, 1) , 
	(60506, 1) , 
	(60510, 2) , 
	(60516, 3) , 
	(60517, 2) , 
	(60521, 1) , 
	(60527, 1) , 
	(60532, 1) , 
	(60538, 1) , 
	(60543, 1) , 
	(60559, 2) , 
	(60561, 1) , 
	(60564, 1) , 
	(60565, 3) , 
	(60606, 1) , 
	(60616, 1) , 
	(60642, 1) , 
	(60654, 3) , 
	(60657, 2) , 
	(60963, 1) , 
	(61073, 1) , 
	(61107, 1) , 
	(61252, 1) , 
	(61265, 1) , 
	(61281, 1) , 
	(61350, 1) , 
	(61462, 4) , 
	(61531, 1) , 
	(61571, 1) , 
	(61602, 1) , 
	(61748, 1) , 
	(61801, 1) , 
	(61820, 1) , 
	(61856, 1) , 
	(61874, 1) , 
	(62035, 1) , 
	(62040, 1) , 
	(62208, 1) , 
	(62220, 1) , 
	(62225, 1) , 
	(62246, 1) , 
	(62249, 1) , 
	(62269, 1) , 
	(62521, 1) , 
	(62535, 1) , 
	(62557, 1) , 
	(62565, 1) , 
	(62644, 1) , 
	(62656, 1) , 
	(62707, 1) , 
	(62711, 1) , 
	(62858, 1) , 
	(62946, 1) , 
	(62966, 1) , 
	(63005, 1) , 
	(63031, 1) , 
	(63042, 1) , 
	(63104, 1) , 
	(63119, 1) , 
	(63122, 1) , 
	(63123, 5) , 
	(63126, 1) , 
	(63129, 1) , 
	(63301, 2) , 
	(63303, 1) , 
	(63368, 1) , 
	(63386, 2) , 
	(63701, 1) , 
	(63755, 4) , 
	(63801, 1) , 
	(63901, 1) , 
	(64012, 1) , 
	(64014, 5) , 
	(64060, 1) , 
	(64068, 1) , 
	(64093, 1) , 
	(64113, 1) , 
	(64117, 1) , 
	(64501, 1) , 
	(64801, 2) , 
	(64834, 1) , 
	(65063, 1) , 
	(65109, 1) , 
	(65202, 2) , 
	(65250, 1) , 
	(65251, 6) , 
	(65536, 1) , 
	(65583, 1) , 
	(65714, 2) , 
	(65739, 1) , 
	(65803, 1) , 
	(65810, 1) , 
	(66027, 1) , 
	(66044, 1) , 
	(66049, 2) , 
	(66061, 1) , 
	(66062, 25) , 
	(66208, 2) , 
	(66209, 1) , 
	(66210, 1) , 
	(66221, 2) , 
	(66502, 1) , 
	(66503, 1) , 
	(68028, 1) , 
	(68037, 1) , 
	(68108, 1) , 
	(68116, 1) , 
	(68123, 1) , 
	(68135, 1) , 
	(68154, 1) , 
	(68157, 1) , 
	(68352, 1) , 
	(68512, 1) , 
	(70001, 1) , 
	(70037, 1) , 
	(70070, 1) , 
	(70117, 1) , 
	(70124, 1) , 
	(70360, 1) , 
	(70433, 1) , 
	(70437, 1) , 
	(70471, 1) , 
	(70503, 2) , 
	(70506, 1) , 
	(70507, 1) , 
	(70774, 1) , 
	(70775, 1) , 
	(70785, 1) , 
	(70791, 1) , 
	(70809, 1) , 
	(71038, 1) , 
	(71111, 3) , 
	(71115, 1) , 
	(71118, 1) , 
	(71201, 2) , 
	(71203, 2) , 
	(71291, 3) , 
	(71457, 1) , 
	(71459, 1) , 
	(72007, 1) , 
	(72019, 1) , 
	(72032, 2) , 
	(72033, 1) , 
	(72034, 2) , 
	(72113, 2) , 
	(72114, 1) , 
	(72120, 1) , 
	(72135, 2) , 
	(72143, 1) , 
	(72176, 3) , 
	(72207, 1) , 
	(72364, 1) , 
	(72401, 1) , 
	(72404, 2) , 
	(72438, 1) , 
	(72472, 1) , 
	(72703, 2) , 
	(72718, 1) , 
	(72730, 1) , 
	(72865, 1) , 
	(72933, 1) , 
	(72956, 1) , 
	(73008, 1) , 
	(73034, 4) , 
	(73075, 1) , 
	(73099, 1) , 
	(73505, 8) , 
	(73538, 1) , 
	(74023, 1) , 
	(74037, 1) , 
	(74055, 1) , 
	(74075, 1) , 
	(74115, 1) , 
	(74134, 1) , 
	(74344, 1) , 
	(74523, 1) , 
	(74764, 1) , 
	(74804, 1) , 
	(75001, 4) , 
	(75013, 1) , 
	(75019, 6) , 
	(75022, 2) , 
	(75023, 1) , 
	(75024, 1) , 
	(75025, 1) , 
	(75028, 1) , 
	(75034, 1) , 
	(75035, 2) , 
	(75043, 8) , 
	(75052, 1) , 
	(75069, 2) , 
	(75075, 1) , 
	(75078, 1) , 
	(75080, 1) , 
	(75081, 1) , 
	(75090, 1) , 
	(75160, 1) , 
	(75204, 1) , 
	(75205, 2) , 
	(75206, 1) , 
	(75214, 1) , 
	(75219, 1) , 
	(75225, 1) , 
	(75229, 1) , 
	(75231, 3) , 
	(75243, 3) , 
	(75246, 1) , 
	(75248, 1) , 
	(75251, 1) , 
	(75402, 1) , 
	(75503, 1) , 
	(75605, 3) , 
	(75652, 1) , 
	(75753, 1) , 
	(75791, 2) , 
	(75901, 1) , 
	(75965, 1) , 
	(76018, 1) , 
	(76028, 2) , 
	(76034, 4) , 
	(76051, 1) , 
	(76052, 1) , 
	(76065, 5) , 
	(76092, 1) , 
	(76102, 1) , 
	(76107, 1) , 
	(76119, 1) , 
	(76129, 1) , 
	(76180, 1) , 
	(76182, 1) , 
	(76201, 1) , 
	(76202, 4) , 
	(76210, 1) , 
	(76226, 2) , 
	(76244, 2) , 
	(76262, 1) , 
	(76271, 1) , 
	(76426, 1) , 
	(76549, 1) , 
	(76801, 1) , 
	(77005, 1) , 
	(77008, 2) , 
	(77021, 1) , 
	(77024, 2) , 
	(77025, 1) , 
	(77027, 1) , 
	(77036, 1) , 
	(77044, 1) , 
	(77062, 1) , 
	(77069, 2) , 
	(77079, 1) , 
	(77098, 1) , 
	(77304, 2) , 
	(77378, 1) , 
	(77379, 1) , 
	(77380, 1) , 
	(77381, 2) , 
	(77382, 3) , 
	(77429, 1) , 
	(77450, 3) , 
	(77469, 1) , 
	(77471, 1) , 
	(77493, 2) , 
	(77494, 3) , 
	(77498, 1) , 
	(77536, 1) , 
	(77539, 1) , 
	(77554, 1) , 
	(77566, 1) , 
	(77840, 1) , 
	(78108, 2) , 
	(78130, 1) , 
	(78132, 2) , 
	(78150, 3) , 
	(78155, 1) , 
	(78209, 2) , 
	(78227, 1) , 
	(78234, 1) , 
	(78249, 2) , 
	(78254, 1) , 
	(78255, 1) , 
	(78258, 2) , 
	(78259, 1) , 
	(78260, 1) , 
	(78412, 3) , 
	(78414, 1) , 
	(78415, 1) , 
	(78418, 3) , 
	(78602, 1) , 
	(78620, 3) , 
	(78660, 1) , 
	(78664, 1) , 
	(78701, 2) , 
	(78703, 1) , 
	(78729, 1) , 
	(78739, 1) , 
	(78749, 1) , 
	(78750, 1) , 
	(78753, 1) , 
	(78759, 2) , 
	(79109, 1) , 
	(79606, 1) , 
	(79707, 1) , 
	(79904, 1) , 
	(79906, 1) , 
	(79922, 1) , 
	(80013, 4) , 
	(80023, 1) , 
	(80033, 2) , 
	(80104, 2) , 
	(80111, 1) , 
	(80112, 9) , 
	(80123, 2) , 
	(80124, 1) , 
	(80134, 1) , 
	(80204, 1) , 
	(80209, 1) , 
	(80210, 1) , 
	(80218, 1) , 
	(80234, 1) , 
	(80241, 1) , 
	(80310, 1) , 
	(80487, 1) , 
	(80503, 2) , 
	(80528, 1) , 
	(80538, 1) , 
	(80903, 1) , 
	(80904, 1) , 
	(80905, 3) , 
	(80908, 1) , 
	(80915, 2) , 
	(80923, 1) , 
	(81043, 1) , 
	(81082, 1) , 
	(82001, 1) , 
	(82442, 1) , 
	(83001, 2) , 
	(83202, 1) , 
	(83455, 1) , 
	(83647, 2) , 
	(83651, 1) , 
	(83686, 1) , 
	(83814, 1) , 
	(84004, 1) , 
	(84047, 1) , 
	(84050, 1) , 
	(84054, 1) , 
	(84092, 1) , 
	(84097, 1) , 
	(84111, 1) , 
	(84414, 1) , 
	(85021, 2) , 
	(85028, 1) , 
	(85031, 1) , 
	(85034, 1) , 
	(85044, 1) , 
	(85048, 1) , 
	(85050, 1) , 
	(85142, 1) , 
	(85207, 1) , 
	(85234, 4) , 
	(85253, 1) , 
	(85257, 1) , 
	(85262, 2) , 
	(85266, 1) , 
	(85282, 2) , 
	(85296, 2) , 
	(85303, 1) , 
	(85308, 1) , 
	(85364, 1) , 
	(85365, 1) , 
	(85381, 1) , 
	(85629, 6) , 
	(85635, 3) , 
	(85704, 2) , 
	(85710, 1) , 
	(85737, 1) , 
	(85749, 1) , 
	(85750, 1) , 
	(87059, 1) , 
	(87401, 8) , 
	(87544, 1) , 
	(89103, 1) , 
	(89115, 1) , 
	(89131, 1) , 
	(89134, 1) , 
	(89144, 1) , 
	(89318, 1) , 
	(89511, 5) , 
	(89801, 1) , 
	(90006, 1) , 
	(90026, 1) , 
	(90045, 2) , 
	(90069, 2) , 
	(90262, 1) , 
	(90272, 1) , 
	(90277, 1) , 
	(90293, 1) , 
	(90604, 1) , 
	(90620, 1) , 
	(90703, 2) , 
	(90740, 1) , 
	(90746, 3) , 
	(90803, 1) , 
	(91101, 1) , 
	(91108, 1) , 
	(91301, 2) , 
	(91325, 1) , 
	(91355, 1) , 
	(91602, 1) , 
	(91701, 3) , 
	(91730, 2) , 
	(91745, 2) , 
	(92011, 1) , 
	(92024, 1) , 
	(92058, 1) , 
	(92078, 5) , 
	(92104, 1) , 
	(92110, 2) , 
	(92117, 1) , 
	(92123, 1) , 
	(92127, 1) , 
	(92536, 2) , 
	(92562, 1) , 
	(92630, 1) , 
	(92656, 5) , 
	(92660, 1) , 
	(92663, 1) , 
	(92679, 1) , 
	(92870, 1) , 
	(93012, 1) , 
	(93065, 1) , 
	(93101, 3) , 
	(93292, 2) , 
	(93311, 1) , 
	(93313, 1) , 
	(93401, 2) , 
	(93420, 2) , 
	(93446, 1) , 
	(93619, 2) , 
	(93704, 1) , 
	(93940, 1) , 
	(94030, 8) , 
	(94063, 1) , 
	(94105, 1) , 
	(94121, 1) , 
	(94404, 1) , 
	(94530, 1) , 
	(94534, 3) , 
	(94541, 1) , 
	(94550, 1) , 
	(94551, 1) , 
	(94566, 1) , 
	(94568, 1) , 
	(94582, 1) , 
	(94588, 2) , 
	(94591, 3) , 
	(94592, 1) , 
	(94596, 1) , 
	(94611, 1) , 
	(94706, 1) , 
	(94928, 1) , 
	(95005, 3) , 
	(95008, 1) , 
	(95010, 2) , 
	(95127, 1) , 
	(95209, 1) , 
	(95242, 1) , 
	(95340, 1) , 
	(95377, 1) , 
	(95404, 1) , 
	(95603, 1) , 
	(95757, 1) , 
	(95758, 1) , 
	(95834, 1) , 
	(95843, 1) , 
	(95991, 3) , 
	(96326, 1) , 
	(96555, 1) , 
	(96706, 1) , 
	(96786, 4) , 
	(97005, 1) , 
	(97007, 1) , 
	(97015, 4) , 
	(97034, 1) , 
	(97035, 1) , 
	(97062, 1) , 
	(97219, 1) , 
	(97229, 1) , 
	(97302, 1) , 
	(97402, 1) , 
	(97504, 1) , 
	(98056, 1) , 
	(98117, 1) , 
	(98121, 1) , 
	(98122, 1) , 
	(98146, 3) , 
	(98178, 4) , 
	(98201, 1) , 
	(98315, 1) , 
	(98367, 1) , 
	(98382, 1) , 
	(98466, 1) , 
	(98498, 3) , 
	(98665, 1) , 
	(99005, 1) , 
	(99352, 1) , 
	(99353, 1) , 
	(99354, 3) , 
	(99508, 1) , 
	(99517, 5) , 
	(99567, 1)
;

UPDATE ehc_sec.volshop14
SET zip5_vshp = LPAD(zip5_vshp::varchar(5), 5, '0');