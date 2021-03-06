%% This file generates the Broyden Banded function in 15 variables 
 sf =10^-5; 
 scale = false; 
 
%% generate polynomial F  nvar = 1.5e1;
  F = sparse(461,15);
  F(1,1) = 6.0;
  F(2,1) = 4.0;
  F(3,1) = 3.0;
  F(3,2) = 2.0;
  F(4,1) = 3.0;
  F(4,2) = 1.0;
  F(5,1) = 3.0;
  F(6,1) = 2.0;
  F(6,2) = 3.0;
  F(7,1) = 2.0;
  F(7,2) = 2.0;
  F(8,1) = 2.0;
  F(8,2) = 1.0;
  F(9,1) = 2.0;
  F(9,3) = 3.0;
  F(10,1) = 2.0;
  F(10,3) = 2.0;
  F(11,1) = 2.0;
  F(11,3) = 1.0;
  F(12,1) = 2.0;
  F(12,4) = 3.0;
  F(13,1) = 2.0;
  F(13,4) = 2.0;
  F(14,1) = 2.0;
  F(14,4) = 1.0;
  F(15,1) = 2.0;
  F(15,5) = 3.0;
  F(16,1) = 2.0;
  F(16,5) = 2.0;
  F(17,1) = 2.0;
  F(17,6) = 3.0;
  F(18,1) = 2.0;
  F(18,6) = 2.0;
  F(19,1) = 2.0;
  F(19,6) = 1.0;
  F(20,1) = 2.0;
  F(20,7) = 2.0;
  F(21,1) = 2.0;
  F(21,7) = 1.0;
  F(22,1) = 2.0;
  F(23,1) = 1.0;
  F(23,2) = 3.0;
  F(24,1) = 1.0;
  F(24,2) = 2.0;
  F(25,1) = 1.0;
  F(25,3) = 3.0;
  F(26,1) = 1.0;
  F(26,3) = 2.0;
  F(27,1) = 1.0;
  F(27,3) = 1.0;
  F(28,1) = 1.0;
  F(28,4) = 3.0;
  F(29,1) = 1.0;
  F(29,4) = 2.0;
  F(30,1) = 1.0;
  F(30,4) = 1.0;
  F(31,1) = 1.0;
  F(31,5) = 3.0;
  F(32,1) = 1.0;
  F(32,5) = 2.0;
  F(33,1) = 1.0;
  F(33,6) = 3.0;
  F(34,1) = 1.0;
  F(34,6) = 2.0;
  F(35,1) = 1.0;
  F(35,6) = 1.0;
  F(36,1) = 1.0;
  F(36,7) = 2.0;
  F(37,1) = 1.0;
  F(37,7) = 1.0;
  F(38,1) = 1.0;
  F(39,2) = 6.0;
  F(40,2) = 4.0;
  F(41,2) = 3.0;
  F(41,3) = 2.0;
  F(42,2) = 3.0;
  F(42,3) = 1.0;
  F(43,2) = 3.0;
  F(44,2) = 2.0;
  F(44,3) = 3.0;
  F(45,2) = 2.0;
  F(45,3) = 2.0;
  F(46,2) = 2.0;
  F(46,3) = 1.0;
  F(47,2) = 2.0;
  F(47,4) = 3.0;
  F(48,2) = 2.0;
  F(48,4) = 2.0;
  F(49,2) = 2.0;
  F(49,4) = 1.0;
  F(50,2) = 2.0;
  F(50,5) = 3.0;
  F(51,2) = 2.0;
  F(51,5) = 2.0;
  F(52,2) = 2.0;
  F(52,5) = 1.0;
  F(53,2) = 2.0;
  F(53,6) = 3.0;
  F(54,2) = 2.0;
  F(54,6) = 2.0;
  F(55,2) = 2.0;
  F(55,7) = 3.0;
  F(56,2) = 2.0;
  F(56,7) = 2.0;
  F(57,2) = 2.0;
  F(57,7) = 1.0;
  F(58,2) = 2.0;
  F(58,8) = 2.0;
  F(59,2) = 2.0;
  F(59,8) = 1.0;
  F(60,2) = 2.0;
  F(61,2) = 1.0;
  F(61,3) = 3.0;
  F(62,2) = 1.0;
  F(62,3) = 2.0;
  F(63,2) = 1.0;
  F(63,4) = 3.0;
  F(64,2) = 1.0;
  F(64,4) = 2.0;
  F(65,2) = 1.0;
  F(65,4) = 1.0;
  F(66,2) = 1.0;
  F(66,5) = 3.0;
  F(67,2) = 1.0;
  F(67,5) = 2.0;
  F(68,2) = 1.0;
  F(68,5) = 1.0;
  F(69,2) = 1.0;
  F(69,6) = 3.0;
  F(70,2) = 1.0;
  F(70,6) = 2.0;
  F(71,2) = 1.0;
  F(71,7) = 3.0;
  F(72,2) = 1.0;
  F(72,7) = 2.0;
  F(73,2) = 1.0;
  F(73,7) = 1.0;
  F(74,2) = 1.0;
  F(74,8) = 2.0;
  F(75,2) = 1.0;
  F(75,8) = 1.0;
  F(76,2) = 1.0;
  F(77,3) = 6.0;
  F(78,3) = 4.0;
  F(79,3) = 3.0;
  F(79,4) = 2.0;
  F(80,3) = 3.0;
  F(80,4) = 1.0;
  F(81,3) = 3.0;
  F(82,3) = 2.0;
  F(82,4) = 3.0;
  F(83,3) = 2.0;
  F(83,4) = 2.0;
  F(84,3) = 2.0;
  F(84,4) = 1.0;
  F(85,3) = 2.0;
  F(85,5) = 3.0;
  F(86,3) = 2.0;
  F(86,5) = 2.0;
  F(87,3) = 2.0;
  F(87,5) = 1.0;
  F(88,3) = 2.0;
  F(88,6) = 3.0;
  F(89,3) = 2.0;
  F(89,6) = 2.0;
  F(90,3) = 2.0;
  F(90,6) = 1.0;
  F(91,3) = 2.0;
  F(91,7) = 3.0;
  F(92,3) = 2.0;
  F(92,7) = 2.0;
  F(93,3) = 2.0;
  F(93,8) = 3.0;
  F(94,3) = 2.0;
  F(94,8) = 2.0;
  F(95,3) = 2.0;
  F(95,8) = 1.0;
  F(96,3) = 2.0;
  F(96,9) = 2.0;
  F(97,3) = 2.0;
  F(97,9) = 1.0;
  F(98,3) = 2.0;
  F(99,3) = 1.0;
  F(99,4) = 3.0;
  F(100,3) = 1.0;
  F(100,4) = 2.0;
  F(101,3) = 1.0;
  F(101,5) = 3.0;
  F(102,3) = 1.0;
  F(102,5) = 2.0;
  F(103,3) = 1.0;
  F(103,5) = 1.0;
  F(104,3) = 1.0;
  F(104,6) = 3.0;
  F(105,3) = 1.0;
  F(105,6) = 2.0;
  F(106,3) = 1.0;
  F(106,6) = 1.0;
  F(107,3) = 1.0;
  F(107,7) = 3.0;
  F(108,3) = 1.0;
  F(108,7) = 2.0;
  F(109,3) = 1.0;
  F(109,8) = 3.0;
  F(110,3) = 1.0;
  F(110,8) = 2.0;
  F(111,3) = 1.0;
  F(111,8) = 1.0;
  F(112,3) = 1.0;
  F(112,9) = 2.0;
  F(113,3) = 1.0;
  F(113,9) = 1.0;
  F(114,3) = 1.0;
  F(115,4) = 6.0;
  F(116,4) = 4.0;
  F(117,4) = 3.0;
  F(117,5) = 2.0;
  F(118,4) = 3.0;
  F(118,5) = 1.0;
  F(119,4) = 3.0;
  F(120,4) = 2.0;
  F(120,5) = 3.0;
  F(121,4) = 2.0;
  F(121,5) = 2.0;
  F(122,4) = 2.0;
  F(122,5) = 1.0;
  F(123,4) = 2.0;
  F(123,6) = 3.0;
  F(124,4) = 2.0;
  F(124,6) = 2.0;
  F(125,4) = 2.0;
  F(125,6) = 1.0;
  F(126,4) = 2.0;
  F(126,7) = 3.0;
  F(127,4) = 2.0;
  F(127,7) = 2.0;
  F(128,4) = 2.0;
  F(128,7) = 1.0;
  F(129,4) = 2.0;
  F(129,8) = 3.0;
  F(130,4) = 2.0;
  F(130,8) = 2.0;
  F(131,4) = 2.0;
  F(131,9) = 3.0;
  F(132,4) = 2.0;
  F(132,9) = 2.0;
  F(133,4) = 2.0;
  F(133,9) = 1.0;
  F(134,4) = 2.0;
  F(134,10) = 2.0;
  F(135,4) = 2.0;
  F(135,10) = 1.0;
  F(136,4) = 2.0;
  F(137,4) = 1.0;
  F(137,5) = 3.0;
  F(138,4) = 1.0;
  F(138,5) = 2.0;
  F(139,4) = 1.0;
  F(139,6) = 3.0;
  F(140,4) = 1.0;
  F(140,6) = 2.0;
  F(141,4) = 1.0;
  F(141,6) = 1.0;
  F(142,4) = 1.0;
  F(142,7) = 3.0;
  F(143,4) = 1.0;
  F(143,7) = 2.0;
  F(144,4) = 1.0;
  F(144,7) = 1.0;
  F(145,4) = 1.0;
  F(145,8) = 3.0;
  F(146,4) = 1.0;
  F(146,8) = 2.0;
  F(147,4) = 1.0;
  F(147,9) = 3.0;
  F(148,4) = 1.0;
  F(148,9) = 2.0;
  F(149,4) = 1.0;
  F(149,9) = 1.0;
  F(150,4) = 1.0;
  F(150,10) = 2.0;
  F(151,4) = 1.0;
  F(151,10) = 1.0;
  F(152,4) = 1.0;
  F(153,5) = 6.0;
  F(154,5) = 4.0;
  F(155,5) = 3.0;
  F(155,6) = 2.0;
  F(156,5) = 3.0;
  F(156,6) = 1.0;
  F(157,5) = 3.0;
  F(158,5) = 2.0;
  F(158,6) = 3.0;
  F(159,5) = 2.0;
  F(159,6) = 2.0;
  F(160,5) = 2.0;
  F(160,6) = 1.0;
  F(161,5) = 2.0;
  F(161,7) = 3.0;
  F(162,5) = 2.0;
  F(162,7) = 2.0;
  F(163,5) = 2.0;
  F(163,7) = 1.0;
  F(164,5) = 2.0;
  F(164,8) = 3.0;
  F(165,5) = 2.0;
  F(165,8) = 2.0;
  F(166,5) = 2.0;
  F(166,8) = 1.0;
  F(167,5) = 2.0;
  F(167,9) = 3.0;
  F(168,5) = 2.0;
  F(168,9) = 2.0;
  F(169,5) = 2.0;
  F(169,10) = 3.0;
  F(170,5) = 2.0;
  F(170,10) = 2.0;
  F(171,5) = 2.0;
  F(171,10) = 1.0;
  F(172,5) = 2.0;
  F(172,11) = 2.0;
  F(173,5) = 2.0;
  F(173,11) = 1.0;
  F(174,5) = 2.0;
  F(175,5) = 1.0;
  F(175,6) = 3.0;
  F(176,5) = 1.0;
  F(176,6) = 2.0;
  F(177,5) = 1.0;
  F(177,7) = 3.0;
  F(178,5) = 1.0;
  F(178,7) = 2.0;
  F(179,5) = 1.0;
  F(179,7) = 1.0;
  F(180,5) = 1.0;
  F(180,8) = 3.0;
  F(181,5) = 1.0;
  F(181,8) = 2.0;
  F(182,5) = 1.0;
  F(182,8) = 1.0;
  F(183,5) = 1.0;
  F(183,9) = 3.0;
  F(184,5) = 1.0;
  F(184,9) = 2.0;
  F(185,5) = 1.0;
  F(185,10) = 3.0;
  F(186,5) = 1.0;
  F(186,10) = 2.0;
  F(187,5) = 1.0;
  F(187,10) = 1.0;
  F(188,5) = 1.0;
  F(188,11) = 2.0;
  F(189,5) = 1.0;
  F(189,11) = 1.0;
  F(190,5) = 1.0;
  F(191,6) = 6.0;
  F(192,6) = 4.0;
  F(193,6) = 3.0;
  F(193,7) = 2.0;
  F(194,6) = 3.0;
  F(194,7) = 1.0;
  F(195,6) = 3.0;
  F(196,6) = 2.0;
  F(196,7) = 3.0;
  F(197,6) = 2.0;
  F(197,7) = 2.0;
  F(198,6) = 2.0;
  F(198,7) = 1.0;
  F(199,6) = 2.0;
  F(199,8) = 3.0;
  F(200,6) = 2.0;
  F(200,8) = 2.0;
  F(201,6) = 2.0;
  F(201,8) = 1.0;
  F(202,6) = 2.0;
  F(202,9) = 3.0;
  F(203,6) = 2.0;
  F(203,9) = 2.0;
  F(204,6) = 2.0;
  F(204,9) = 1.0;
  F(205,6) = 2.0;
  F(205,10) = 3.0;
  F(206,6) = 2.0;
  F(206,10) = 2.0;
  F(207,6) = 2.0;
  F(207,11) = 3.0;
  F(208,6) = 2.0;
  F(208,11) = 2.0;
  F(209,6) = 2.0;
  F(209,11) = 1.0;
  F(210,6) = 2.0;
  F(210,12) = 2.0;
  F(211,6) = 2.0;
  F(211,12) = 1.0;
  F(212,6) = 2.0;
  F(213,6) = 1.0;
  F(213,7) = 3.0;
  F(214,6) = 1.0;
  F(214,7) = 2.0;
  F(215,6) = 1.0;
  F(215,8) = 3.0;
  F(216,6) = 1.0;
  F(216,8) = 2.0;
  F(217,6) = 1.0;
  F(217,8) = 1.0;
  F(218,6) = 1.0;
  F(218,9) = 3.0;
  F(219,6) = 1.0;
  F(219,9) = 2.0;
  F(220,6) = 1.0;
  F(220,9) = 1.0;
  F(221,6) = 1.0;
  F(221,10) = 3.0;
  F(222,6) = 1.0;
  F(222,10) = 2.0;
  F(223,6) = 1.0;
  F(223,11) = 3.0;
  F(224,6) = 1.0;
  F(224,11) = 2.0;
  F(225,6) = 1.0;
  F(225,11) = 1.0;
  F(226,6) = 1.0;
  F(226,12) = 2.0;
  F(227,6) = 1.0;
  F(227,12) = 1.0;
  F(228,6) = 1.0;
  F(229,7) = 6.0;
  F(230,7) = 4.0;
  F(231,7) = 3.0;
  F(231,8) = 2.0;
  F(232,7) = 3.0;
  F(232,8) = 1.0;
  F(233,7) = 3.0;
  F(234,7) = 2.0;
  F(234,8) = 3.0;
  F(235,7) = 2.0;
  F(235,8) = 2.0;
  F(236,7) = 2.0;
  F(236,8) = 1.0;
  F(237,7) = 2.0;
  F(237,9) = 3.0;
  F(238,7) = 2.0;
  F(238,9) = 2.0;
  F(239,7) = 2.0;
  F(239,9) = 1.0;
  F(240,7) = 2.0;
  F(240,10) = 3.0;
  F(241,7) = 2.0;
  F(241,10) = 2.0;
  F(242,7) = 2.0;
  F(242,10) = 1.0;
  F(243,7) = 2.0;
  F(243,11) = 3.0;
  F(244,7) = 2.0;
  F(244,11) = 2.0;
  F(245,7) = 2.0;
  F(245,12) = 3.0;
  F(246,7) = 2.0;
  F(246,12) = 2.0;
  F(247,7) = 2.0;
  F(247,12) = 1.0;
  F(248,7) = 2.0;
  F(248,13) = 2.0;
  F(249,7) = 2.0;
  F(249,13) = 1.0;
  F(250,7) = 2.0;
  F(251,7) = 1.0;
  F(251,8) = 3.0;
  F(252,7) = 1.0;
  F(252,8) = 2.0;
  F(253,7) = 1.0;
  F(253,9) = 3.0;
  F(254,7) = 1.0;
  F(254,9) = 2.0;
  F(255,7) = 1.0;
  F(255,9) = 1.0;
  F(256,7) = 1.0;
  F(256,10) = 3.0;
  F(257,7) = 1.0;
  F(257,10) = 2.0;
  F(258,7) = 1.0;
  F(258,10) = 1.0;
  F(259,7) = 1.0;
  F(259,11) = 3.0;
  F(260,7) = 1.0;
  F(260,11) = 2.0;
  F(261,7) = 1.0;
  F(261,12) = 3.0;
  F(262,7) = 1.0;
  F(262,12) = 2.0;
  F(263,7) = 1.0;
  F(263,12) = 1.0;
  F(264,7) = 1.0;
  F(264,13) = 2.0;
  F(265,7) = 1.0;
  F(265,13) = 1.0;
  F(266,7) = 1.0;
  F(267,8) = 6.0;
  F(268,8) = 4.0;
  F(269,8) = 3.0;
  F(269,9) = 2.0;
  F(270,8) = 3.0;
  F(270,9) = 1.0;
  F(271,8) = 3.0;
  F(272,8) = 2.0;
  F(272,9) = 3.0;
  F(273,8) = 2.0;
  F(273,9) = 2.0;
  F(274,8) = 2.0;
  F(274,9) = 1.0;
  F(275,8) = 2.0;
  F(275,10) = 3.0;
  F(276,8) = 2.0;
  F(276,10) = 2.0;
  F(277,8) = 2.0;
  F(277,10) = 1.0;
  F(278,8) = 2.0;
  F(278,11) = 3.0;
  F(279,8) = 2.0;
  F(279,11) = 2.0;
  F(280,8) = 2.0;
  F(280,11) = 1.0;
  F(281,8) = 2.0;
  F(281,12) = 3.0;
  F(282,8) = 2.0;
  F(282,12) = 2.0;
  F(283,8) = 2.0;
  F(283,13) = 3.0;
  F(284,8) = 2.0;
  F(284,13) = 2.0;
  F(285,8) = 2.0;
  F(285,13) = 1.0;
  F(286,8) = 2.0;
  F(286,14) = 2.0;
  F(287,8) = 2.0;
  F(287,14) = 1.0;
  F(288,8) = 2.0;
  F(289,8) = 1.0;
  F(289,9) = 3.0;
  F(290,8) = 1.0;
  F(290,9) = 2.0;
  F(291,8) = 1.0;
  F(291,10) = 3.0;
  F(292,8) = 1.0;
  F(292,10) = 2.0;
  F(293,8) = 1.0;
  F(293,10) = 1.0;
  F(294,8) = 1.0;
  F(294,11) = 3.0;
  F(295,8) = 1.0;
  F(295,11) = 2.0;
  F(296,8) = 1.0;
  F(296,11) = 1.0;
  F(297,8) = 1.0;
  F(297,12) = 3.0;
  F(298,8) = 1.0;
  F(298,12) = 2.0;
  F(299,8) = 1.0;
  F(299,13) = 3.0;
  F(300,8) = 1.0;
  F(300,13) = 2.0;
  F(301,8) = 1.0;
  F(301,13) = 1.0;
  F(302,8) = 1.0;
  F(302,14) = 2.0;
  F(303,8) = 1.0;
  F(303,14) = 1.0;
  F(304,8) = 1.0;
  F(305,9) = 6.0;
  F(306,9) = 4.0;
  F(307,9) = 3.0;
  F(307,10) = 2.0;
  F(308,9) = 3.0;
  F(308,10) = 1.0;
  F(309,9) = 3.0;
  F(310,9) = 2.0;
  F(310,10) = 3.0;
  F(311,9) = 2.0;
  F(311,10) = 2.0;
  F(312,9) = 2.0;
  F(312,10) = 1.0;
  F(313,9) = 2.0;
  F(313,11) = 3.0;
  F(314,9) = 2.0;
  F(314,11) = 2.0;
  F(315,9) = 2.0;
  F(315,11) = 1.0;
  F(316,9) = 2.0;
  F(316,12) = 3.0;
  F(317,9) = 2.0;
  F(317,12) = 2.0;
  F(318,9) = 2.0;
  F(318,12) = 1.0;
  F(319,9) = 2.0;
  F(319,13) = 3.0;
  F(320,9) = 2.0;
  F(320,13) = 2.0;
  F(321,9) = 2.0;
  F(321,14) = 3.0;
  F(322,9) = 2.0;
  F(322,14) = 2.0;
  F(323,9) = 2.0;
  F(323,14) = 1.0;
  F(324,9) = 2.0;
  F(324,15) = 2.0;
  F(325,9) = 2.0;
  F(325,15) = 1.0;
  F(326,9) = 2.0;
  F(327,9) = 1.0;
  F(327,10) = 3.0;
  F(328,9) = 1.0;
  F(328,10) = 2.0;
  F(329,9) = 1.0;
  F(329,11) = 3.0;
  F(330,9) = 1.0;
  F(330,11) = 2.0;
  F(331,9) = 1.0;
  F(331,11) = 1.0;
  F(332,9) = 1.0;
  F(332,12) = 3.0;
  F(333,9) = 1.0;
  F(333,12) = 2.0;
  F(334,9) = 1.0;
  F(334,12) = 1.0;
  F(335,9) = 1.0;
  F(335,13) = 3.0;
  F(336,9) = 1.0;
  F(336,13) = 2.0;
  F(337,9) = 1.0;
  F(337,14) = 3.0;
  F(338,9) = 1.0;
  F(338,14) = 2.0;
  F(339,9) = 1.0;
  F(339,14) = 1.0;
  F(340,9) = 1.0;
  F(340,15) = 2.0;
  F(341,9) = 1.0;
  F(341,15) = 1.0;
  F(342,9) = 1.0;
  F(343,10) = 6.0;
  F(344,10) = 4.0;
  F(345,10) = 3.0;
  F(345,11) = 2.0;
  F(346,10) = 3.0;
  F(346,11) = 1.0;
  F(347,10) = 3.0;
  F(348,10) = 2.0;
  F(348,11) = 3.0;
  F(349,10) = 2.0;
  F(349,11) = 2.0;
  F(350,10) = 2.0;
  F(350,11) = 1.0;
  F(351,10) = 2.0;
  F(351,12) = 3.0;
  F(352,10) = 2.0;
  F(352,12) = 2.0;
  F(353,10) = 2.0;
  F(353,12) = 1.0;
  F(354,10) = 2.0;
  F(354,13) = 3.0;
  F(355,10) = 2.0;
  F(355,13) = 2.0;
  F(356,10) = 2.0;
  F(356,13) = 1.0;
  F(357,10) = 2.0;
  F(357,14) = 3.0;
  F(358,10) = 2.0;
  F(358,14) = 2.0;
  F(359,10) = 2.0;
  F(359,15) = 3.0;
  F(360,10) = 2.0;
  F(360,15) = 2.0;
  F(361,10) = 2.0;
  F(361,15) = 1.0;
  F(362,10) = 2.0;
  F(363,10) = 1.0;
  F(363,11) = 3.0;
  F(364,10) = 1.0;
  F(364,11) = 2.0;
  F(365,10) = 1.0;
  F(365,12) = 3.0;
  F(366,10) = 1.0;
  F(366,12) = 2.0;
  F(367,10) = 1.0;
  F(367,12) = 1.0;
  F(368,10) = 1.0;
  F(368,13) = 3.0;
  F(369,10) = 1.0;
  F(369,13) = 2.0;
  F(370,10) = 1.0;
  F(370,13) = 1.0;
  F(371,10) = 1.0;
  F(371,14) = 3.0;
  F(372,10) = 1.0;
  F(372,14) = 2.0;
  F(373,10) = 1.0;
  F(373,15) = 3.0;
  F(374,10) = 1.0;
  F(374,15) = 2.0;
  F(375,10) = 1.0;
  F(375,15) = 1.0;
  F(376,10) = 1.0;
  F(377,11) = 6.0;
  F(378,11) = 4.0;
  F(379,11) = 3.0;
  F(379,12) = 2.0;
  F(380,11) = 3.0;
  F(380,12) = 1.0;
  F(381,11) = 3.0;
  F(382,11) = 2.0;
  F(382,12) = 3.0;
  F(383,11) = 2.0;
  F(383,12) = 2.0;
  F(384,11) = 2.0;
  F(384,12) = 1.0;
  F(385,11) = 2.0;
  F(385,13) = 3.0;
  F(386,11) = 2.0;
  F(386,13) = 2.0;
  F(387,11) = 2.0;
  F(387,13) = 1.0;
  F(388,11) = 2.0;
  F(388,14) = 3.0;
  F(389,11) = 2.0;
  F(389,14) = 2.0;
  F(390,11) = 2.0;
  F(390,15) = 3.0;
  F(391,11) = 2.0;
  F(391,15) = 2.0;
  F(392,11) = 2.0;
  F(392,15) = 1.0;
  F(393,11) = 2.0;
  F(394,11) = 1.0;
  F(394,12) = 3.0;
  F(395,11) = 1.0;
  F(395,12) = 2.0;
  F(396,11) = 1.0;
  F(396,12) = 1.0;
  F(397,11) = 1.0;
  F(397,13) = 3.0;
  F(398,11) = 1.0;
  F(398,13) = 2.0;
  F(399,11) = 1.0;
  F(399,13) = 1.0;
  F(400,11) = 1.0;
  F(400,14) = 3.0;
  F(401,11) = 1.0;
  F(401,14) = 2.0;
  F(402,11) = 1.0;
  F(402,15) = 3.0;
  F(403,11) = 1.0;
  F(403,15) = 2.0;
  F(404,11) = 1.0;
  F(404,15) = 1.0;
  F(405,11) = 1.0;
  F(406,12) = 6.0;
  F(407,12) = 4.0;
  F(408,12) = 3.0;
  F(408,13) = 2.0;
  F(409,12) = 3.0;
  F(409,13) = 1.0;
  F(410,12) = 3.0;
  F(411,12) = 2.0;
  F(411,13) = 3.0;
  F(412,12) = 2.0;
  F(412,13) = 2.0;
  F(413,12) = 2.0;
  F(413,14) = 3.0;
  F(414,12) = 2.0;
  F(414,14) = 2.0;
  F(415,12) = 2.0;
  F(415,15) = 3.0;
  F(416,12) = 2.0;
  F(416,15) = 2.0;
  F(417,12) = 2.0;
  F(417,15) = 1.0;
  F(418,12) = 1.0;
  F(418,13) = 3.0;
  F(419,12) = 1.0;
  F(419,13) = 1.0;
  F(420,12) = 1.0;
  F(420,14) = 3.0;
  F(421,12) = 1.0;
  F(421,14) = 2.0;
  F(422,12) = 1.0;
  F(422,15) = 3.0;
  F(423,12) = 1.0;
  F(423,15) = 2.0;
  F(424,12) = 1.0;
  F(424,15) = 1.0;
  F(425,12) = 1.0;
  F(426,13) = 6.0;
  F(427,13) = 4.0;
  F(428,13) = 3.0;
  F(428,14) = 2.0;
  F(429,13) = 3.0;
  F(429,14) = 1.0;
  F(430,13) = 3.0;
  F(431,13) = 2.0;
  F(431,14) = 3.0;
  F(432,13) = 2.0;
  F(432,14) = 2.0;
  F(433,13) = 2.0;
  F(433,14) = 1.0;
  F(434,13) = 2.0;
  F(434,15) = 3.0;
  F(435,13) = 2.0;
  F(435,15) = 2.0;
  F(436,13) = 2.0;
  F(436,15) = 1.0;
  F(437,13) = 2.0;
  F(438,13) = 1.0;
  F(438,14) = 3.0;
  F(439,13) = 1.0;
  F(439,14) = 2.0;
  F(440,13) = 1.0;
  F(440,14) = 1.0;
  F(441,13) = 1.0;
  F(441,15) = 3.0;
  F(442,13) = 1.0;
  F(442,15) = 2.0;
  F(443,13) = 1.0;
  F(443,15) = 1.0;
  F(444,13) = 1.0;
  F(445,14) = 6.0;
  F(446,14) = 4.0;
  F(447,14) = 3.0;
  F(447,15) = 2.0;
  F(448,14) = 3.0;
  F(448,15) = 1.0;
  F(449,14) = 3.0;
  F(450,14) = 2.0;
  F(450,15) = 3.0;
  F(451,14) = 2.0;
  F(451,15) = 1.0;
  F(452,14) = 2.0;
  F(453,14) = 1.0;
  F(453,15) = 3.0;
  F(454,14) = 1.0;
  F(454,15) = 2.0;
  F(455,14) = 1.0;
  F(455,15) = 1.0;
  F(456,15) = 6.0;
  F(457,15) = 4.0;
  F(458,15) = 3.0;
  F(459,15) = 2.0;
  F(460,15) = 1.0;
  %Coefficients:
  F(1,16) = 1.0e2;
  F(2,16) = 4.5e1;
  F(3,16) = -2.0e1;
  F(4,16) = -2.0e1;
  F(5,16) = 3.0e1;
  F(6,16) = -2.0e1;
  F(7,16) = 8.0;
  F(8,16) = 4.0;
  F(9,16) = -2.0e1;
  F(10,16) = 8.0;
  F(11,16) = 4.0;
  F(12,16) = -2.0e1;
  F(13,16) = 6.0;
  F(14,16) = 2.0;
  F(15,16) = -2.0e1;
  F(16,16) = 4.0;
  F(17,16) = -2.0e1;
  F(18,16) = 2.0;
  F(19,16) = -2.0;
  F(20,16) = 2.0;
  F(21,16) = 2.0;
  F(22,16) = -1.0;
  F(23,16) = -2.0e1;
  F(24,16) = 4.0;
  F(25,16) = -2.0e1;
  F(26,16) = 8.0;
  F(27,16) = 4.0;
  F(28,16) = -2.0e1;
  F(29,16) = 6.0;
  F(30,16) = 2.0;
  F(31,16) = -2.0e1;
  F(32,16) = 4.0;
  F(33,16) = -2.0e1;
  F(34,16) = 2.0;
  F(35,16) = -2.0;
  F(36,16) = 2.0;
  F(37,16) = 2.0;
  F(38,16) = -6.0;
  F(39,16) = 1.0e2;
  F(40,16) = 4.6e1;
  F(41,16) = -2.0e1;
  F(42,16) = -2.0e1;
  F(43,16) = 3.2e1;
  F(44,16) = -2.0e1;
  F(45,16) = 8.0;
  F(46,16) = 4.0;
  F(47,16) = -2.0e1;
  F(48,16) = 8.0;
  F(49,16) = 4.0;
  F(50,16) = -2.0e1;
  F(51,16) = 6.0;
  F(52,16) = 2.0;
  F(53,16) = -2.0e1;
  F(54,16) = 4.0;
  F(55,16) = -2.0e1;
  F(56,16) = 2.0;
  F(57,16) = -2.0;
  F(58,16) = 2.0;
  F(59,16) = 2.0;
  F(60,16) = -2.0;
  F(61,16) = -2.0e1;
  F(62,16) = 4.0;
  F(63,16) = -2.0e1;
  F(64,16) = 8.0;
  F(65,16) = 4.0;
  F(66,16) = -2.0e1;
  F(67,16) = 6.0;
  F(68,16) = 2.0;
  F(69,16) = -2.0e1;
  F(70,16) = 4.0;
  F(71,16) = -2.0e1;
  F(72,16) = 2.0;
  F(73,16) = -2.0;
  F(74,16) = 2.0;
  F(75,16) = 2.0;
  F(76,16) = -8.0;
  F(77,16) = 1.0e2;
  F(78,16) = 4.6e1;
  F(79,16) = -2.0e1;
  F(80,16) = -2.0e1;
  F(81,16) = 3.2e1;
  F(82,16) = -2.0e1;
  F(83,16) = 8.0;
  F(84,16) = 4.0;
  F(85,16) = -2.0e1;
  F(86,16) = 8.0;
  F(87,16) = 4.0;
  F(88,16) = -2.0e1;
  F(89,16) = 6.0;
  F(90,16) = 2.0;
  F(91,16) = -2.0e1;
  F(92,16) = 4.0;
  F(93,16) = -2.0e1;
  F(94,16) = 2.0;
  F(95,16) = -2.0;
  F(96,16) = 2.0;
  F(97,16) = 2.0;
  F(98,16) = -2.0;
  F(99,16) = -2.0e1;
  F(100,16) = 4.0;
  F(101,16) = -2.0e1;
  F(102,16) = 8.0;
  F(103,16) = 4.0;
  F(104,16) = -2.0e1;
  F(105,16) = 6.0;
  F(106,16) = 2.0;
  F(107,16) = -2.0e1;
  F(108,16) = 4.0;
  F(109,16) = -2.0e1;
  F(110,16) = 2.0;
  F(111,16) = -2.0;
  F(112,16) = 2.0;
  F(113,16) = 2.0;
  F(114,16) = -8.0;
  F(115,16) = 1.0e2;
  F(116,16) = 4.6e1;
  F(117,16) = -2.0e1;
  F(118,16) = -2.0e1;
  F(119,16) = 3.2e1;
  F(120,16) = -2.0e1;
  F(121,16) = 8.0;
  F(122,16) = 4.0;
  F(123,16) = -2.0e1;
  F(124,16) = 8.0;
  F(125,16) = 4.0;
  F(126,16) = -2.0e1;
  F(127,16) = 6.0;
  F(128,16) = 2.0;
  F(129,16) = -2.0e1;
  F(130,16) = 4.0;
  F(131,16) = -2.0e1;
  F(132,16) = 2.0;
  F(133,16) = -2.0;
  F(134,16) = 2.0;
  F(135,16) = 2.0;
  F(136,16) = -2.0;
  F(137,16) = -2.0e1;
  F(138,16) = 4.0;
  F(139,16) = -2.0e1;
  F(140,16) = 8.0;
  F(141,16) = 4.0;
  F(142,16) = -2.0e1;
  F(143,16) = 6.0;
  F(144,16) = 2.0;
  F(145,16) = -2.0e1;
  F(146,16) = 4.0;
  F(147,16) = -2.0e1;
  F(148,16) = 2.0;
  F(149,16) = -2.0;
  F(150,16) = 2.0;
  F(151,16) = 2.0;
  F(152,16) = -8.0;
  F(153,16) = 1.0e2;
  F(154,16) = 4.6e1;
  F(155,16) = -2.0e1;
  F(156,16) = -2.0e1;
  F(157,16) = 3.2e1;
  F(158,16) = -2.0e1;
  F(159,16) = 8.0;
  F(160,16) = 4.0;
  F(161,16) = -2.0e1;
  F(162,16) = 8.0;
  F(163,16) = 4.0;
  F(164,16) = -2.0e1;
  F(165,16) = 6.0;
  F(166,16) = 2.0;
  F(167,16) = -2.0e1;
  F(168,16) = 4.0;
  F(169,16) = -2.0e1;
  F(170,16) = 2.0;
  F(171,16) = -2.0;
  F(172,16) = 2.0;
  F(173,16) = 2.0;
  F(174,16) = -2.0;
  F(175,16) = -2.0e1;
  F(176,16) = 4.0;
  F(177,16) = -2.0e1;
  F(178,16) = 8.0;
  F(179,16) = 4.0;
  F(180,16) = -2.0e1;
  F(181,16) = 6.0;
  F(182,16) = 2.0;
  F(183,16) = -2.0e1;
  F(184,16) = 4.0;
  F(185,16) = -2.0e1;
  F(186,16) = 2.0;
  F(187,16) = -2.0;
  F(188,16) = 2.0;
  F(189,16) = 2.0;
  F(190,16) = -8.0;
  F(191,16) = 1.0e2;
  F(192,16) = 4.6e1;
  F(193,16) = -2.0e1;
  F(194,16) = -2.0e1;
  F(195,16) = 3.2e1;
  F(196,16) = -2.0e1;
  F(197,16) = 8.0;
  F(198,16) = 4.0;
  F(199,16) = -2.0e1;
  F(200,16) = 8.0;
  F(201,16) = 4.0;
  F(202,16) = -2.0e1;
  F(203,16) = 6.0;
  F(204,16) = 2.0;
  F(205,16) = -2.0e1;
  F(206,16) = 4.0;
  F(207,16) = -2.0e1;
  F(208,16) = 2.0;
  F(209,16) = -2.0;
  F(210,16) = 2.0;
  F(211,16) = 2.0;
  F(212,16) = -2.0;
  F(213,16) = -2.0e1;
  F(214,16) = 4.0;
  F(215,16) = -2.0e1;
  F(216,16) = 8.0;
  F(217,16) = 4.0;
  F(218,16) = -2.0e1;
  F(219,16) = 6.0;
  F(220,16) = 2.0;
  F(221,16) = -2.0e1;
  F(222,16) = 4.0;
  F(223,16) = -2.0e1;
  F(224,16) = 2.0;
  F(225,16) = -2.0;
  F(226,16) = 2.0;
  F(227,16) = 2.0;
  F(228,16) = -8.0;
  F(229,16) = 1.0e2;
  F(230,16) = 4.6e1;
  F(231,16) = -2.0e1;
  F(232,16) = -2.0e1;
  F(233,16) = 3.2e1;
  F(234,16) = -2.0e1;
  F(235,16) = 8.0;
  F(236,16) = 4.0;
  F(237,16) = -2.0e1;
  F(238,16) = 8.0;
  F(239,16) = 4.0;
  F(240,16) = -2.0e1;
  F(241,16) = 6.0;
  F(242,16) = 2.0;
  F(243,16) = -2.0e1;
  F(244,16) = 4.0;
  F(245,16) = -2.0e1;
  F(246,16) = 2.0;
  F(247,16) = -2.0;
  F(248,16) = 2.0;
  F(249,16) = 2.0;
  F(250,16) = -2.0;
  F(251,16) = -2.0e1;
  F(252,16) = 4.0;
  F(253,16) = -2.0e1;
  F(254,16) = 8.0;
  F(255,16) = 4.0;
  F(256,16) = -2.0e1;
  F(257,16) = 6.0;
  F(258,16) = 2.0;
  F(259,16) = -2.0e1;
  F(260,16) = 4.0;
  F(261,16) = -2.0e1;
  F(262,16) = 2.0;
  F(263,16) = -2.0;
  F(264,16) = 2.0;
  F(265,16) = 2.0;
  F(266,16) = -8.0;
  F(267,16) = 1.0e2;
  F(268,16) = 4.6e1;
  F(269,16) = -2.0e1;
  F(270,16) = -2.0e1;
  F(271,16) = 3.2e1;
  F(272,16) = -2.0e1;
  F(273,16) = 8.0;
  F(274,16) = 4.0;
  F(275,16) = -2.0e1;
  F(276,16) = 8.0;
  F(277,16) = 4.0;
  F(278,16) = -2.0e1;
  F(279,16) = 6.0;
  F(280,16) = 2.0;
  F(281,16) = -2.0e1;
  F(282,16) = 4.0;
  F(283,16) = -2.0e1;
  F(284,16) = 2.0;
  F(285,16) = -2.0;
  F(286,16) = 2.0;
  F(287,16) = 2.0;
  F(288,16) = -2.0;
  F(289,16) = -2.0e1;
  F(290,16) = 4.0;
  F(291,16) = -2.0e1;
  F(292,16) = 8.0;
  F(293,16) = 4.0;
  F(294,16) = -2.0e1;
  F(295,16) = 6.0;
  F(296,16) = 2.0;
  F(297,16) = -2.0e1;
  F(298,16) = 4.0;
  F(299,16) = -2.0e1;
  F(300,16) = 2.0;
  F(301,16) = -2.0;
  F(302,16) = 2.0;
  F(303,16) = 2.0;
  F(304,16) = -8.0;
  F(305,16) = 1.0e2;
  F(306,16) = 4.6e1;
  F(307,16) = -2.0e1;
  F(308,16) = -2.0e1;
  F(309,16) = 3.2e1;
  F(310,16) = -2.0e1;
  F(311,16) = 8.0;
  F(312,16) = 4.0;
  F(313,16) = -2.0e1;
  F(314,16) = 8.0;
  F(315,16) = 4.0;
  F(316,16) = -2.0e1;
  F(317,16) = 6.0;
  F(318,16) = 2.0;
  F(319,16) = -2.0e1;
  F(320,16) = 4.0;
  F(321,16) = -2.0e1;
  F(322,16) = 2.0;
  F(323,16) = -2.0;
  F(324,16) = 2.0;
  F(325,16) = 2.0;
  F(326,16) = -2.0;
  F(327,16) = -2.0e1;
  F(328,16) = 4.0;
  F(329,16) = -2.0e1;
  F(330,16) = 8.0;
  F(331,16) = 4.0;
  F(332,16) = -2.0e1;
  F(333,16) = 6.0;
  F(334,16) = 2.0;
  F(335,16) = -2.0e1;
  F(336,16) = 4.0;
  F(337,16) = -2.0e1;
  F(338,16) = 2.0;
  F(339,16) = -2.0;
  F(340,16) = 2.0;
  F(341,16) = 2.0;
  F(342,16) = -8.0;
  F(343,16) = 1.0e2;
  F(344,16) = 4.6e1;
  F(345,16) = -2.0e1;
  F(346,16) = -2.0e1;
  F(347,16) = 3.2e1;
  F(348,16) = -2.0e1;
  F(349,16) = 8.0;
  F(350,16) = 4.0;
  F(351,16) = -2.0e1;
  F(352,16) = 8.0;
  F(353,16) = 4.0;
  F(354,16) = -2.0e1;
  F(355,16) = 6.0;
  F(356,16) = 2.0;
  F(357,16) = -2.0e1;
  F(358,16) = 4.0;
  F(359,16) = -2.0e1;
  F(360,16) = 2.0;
  F(361,16) = -2.0;
  F(362,16) = -2.0;
  F(363,16) = -2.0e1;
  F(364,16) = 4.0;
  F(365,16) = -2.0e1;
  F(366,16) = 8.0;
  F(367,16) = 4.0;
  F(368,16) = -2.0e1;
  F(369,16) = 6.0;
  F(370,16) = 2.0;
  F(371,16) = -2.0e1;
  F(372,16) = 4.0;
  F(373,16) = -2.0e1;
  F(374,16) = 2.0;
  F(375,16) = -2.0;
  F(376,16) = -8.0;
  F(377,16) = 1.0e2;
  F(378,16) = 4.5e1;
  F(379,16) = -2.0e1;
  F(380,16) = -2.0e1;
  F(381,16) = 3.0e1;
  F(382,16) = -2.0e1;
  F(383,16) = 6.0;
  F(384,16) = 2.0;
  F(385,16) = -2.0e1;
  F(386,16) = 6.0;
  F(387,16) = 2.0;
  F(388,16) = -2.0e1;
  F(389,16) = 4.0;
  F(390,16) = -2.0e1;
  F(391,16) = 2.0;
  F(392,16) = -2.0;
  F(393,16) = -1.0;
  F(394,16) = -2.0e1;
  F(395,16) = 2.0;
  F(396,16) = -2.0;
  F(397,16) = -2.0e1;
  F(398,16) = 6.0;
  F(399,16) = 2.0;
  F(400,16) = -2.0e1;
  F(401,16) = 4.0;
  F(402,16) = -2.0e1;
  F(403,16) = 2.0;
  F(404,16) = -2.0;
  F(405,16) = -6.0;
  F(406,16) = 1.0e2;
  F(407,16) = 4.4e1;
  F(408,16) = -2.0e1;
  F(409,16) = -2.0e1;
  F(410,16) = 2.8e1;
  F(411,16) = -2.0e1;
  F(412,16) = 4.0;
  F(413,16) = -2.0e1;
  F(414,16) = 4.0;
  F(415,16) = -2.0e1;
  F(416,16) = 2.0;
  F(417,16) = -2.0;
  F(418,16) = -2.0e1;
  F(419,16) = -4.0;
  F(420,16) = -2.0e1;
  F(421,16) = 4.0;
  F(422,16) = -2.0e1;
  F(423,16) = 2.0;
  F(424,16) = -2.0;
  F(425,16) = -4.0;
  F(426,16) = 1.0e2;
  F(427,16) = 4.3e1;
  F(428,16) = -2.0e1;
  F(429,16) = -2.0e1;
  F(430,16) = 2.6e1;
  F(431,16) = -2.0e1;
  F(432,16) = 2.0;
  F(433,16) = -2.0;
  F(434,16) = -2.0e1;
  F(435,16) = 2.0;
  F(436,16) = -2.0;
  F(437,16) = 1.0;
  F(438,16) = -2.0e1;
  F(439,16) = -2.0;
  F(440,16) = -6.0;
  F(441,16) = -2.0e1;
  F(442,16) = 2.0;
  F(443,16) = -2.0;
  F(444,16) = -2.0;
  F(445,16) = 1.0e2;
  F(446,16) = 4.2e1;
  F(447,16) = -2.0e1;
  F(448,16) = -2.0e1;
  F(449,16) = 2.4e1;
  F(450,16) = -2.0e1;
  F(451,16) = -4.0;
  F(452,16) = 2.0;
  F(453,16) = -2.0e1;
  F(454,16) = -4.0;
  F(455,16) = -8.0;
  F(456,16) = 1.0e2;
  F(457,16) = 4.1e1;
  F(458,16) = 2.2e1;
  F(459,16) = 3.0;
  F(460,16) = 2.0;
  F(461,16) = 1.5e1;

 if scale 
 F(:,15+1) = F(:,15+1)*sf; 
 end
 G ={};
 
I={[1, 2, 3, 4, 5, 6, 7], [2, 3, 4, 5, 6, 7, 8], [3, 4, 5, 6, 7, 8, 9], [4, 5, 6, 7, 8, 9, 10], [5, 6, 7, 8, 9, 10, 11], [6, 7, 8, 9, 10, 11, 12], [7, 8, 9, 10, 11, 12, 13], [8, 9, 10, 11, 12, 13, 14], [9, 10, 11, 12, 13, 14, 15]};
 
J={[], [], [], [], [], [], [], [], []};

pop.F = F; pop.I = I; pop.G = G; pop.J = J; pop.n = size(F,2)-1;