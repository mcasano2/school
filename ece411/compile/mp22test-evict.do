echo "--- Executing initialization force file for ../testcode/mp22test-evict.asm ---"

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5
echo "Initializing the processor."
force /start_h 0 @0
force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
force /start_h 0 @ 100

echo "Done initializing processor, loading ../testcode/mp22test-evict.asm program code."
run 5
change mp2_cpu/dram/pdram/vhdl_memory/mem(0) X"0E"
change mp2_cpu/dram/pdram/vhdl_memory/mem(1) X"60"
change mp2_cpu/dram/pdram/vhdl_memory/mem(2) X"56"
change mp2_cpu/dram/pdram/vhdl_memory/mem(3) X"62"
change mp2_cpu/dram/pdram/vhdl_memory/mem(4) X"41"
change mp2_cpu/dram/pdram/vhdl_memory/mem(5) X"12"
change mp2_cpu/dram/pdram/vhdl_memory/mem(6) X"D6"
change mp2_cpu/dram/pdram/vhdl_memory/mem(7) X"72"
change mp2_cpu/dram/pdram/vhdl_memory/mem(8) X"9E"
change mp2_cpu/dram/pdram/vhdl_memory/mem(9) X"64"
change mp2_cpu/dram/pdram/vhdl_memory/mem(10) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(11) X"66"
change mp2_cpu/dram/pdram/vhdl_memory/mem(12) X"C3"
change mp2_cpu/dram/pdram/vhdl_memory/mem(13) X"1A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(14) X"CC"
change mp2_cpu/dram/pdram/vhdl_memory/mem(15) X"7A"
change mp2_cpu/dram/pdram/vhdl_memory/mem(16) X"0D"
change mp2_cpu/dram/pdram/vhdl_memory/mem(17) X"69"
change mp2_cpu/dram/pdram/vhdl_memory/mem(18) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(19) X"69"
change mp2_cpu/dram/pdram/vhdl_memory/mem(20) X"FF"
change mp2_cpu/dram/pdram/vhdl_memory/mem(21) X"0F"
change mp2_cpu/dram/pdram/vhdl_memory/mem(22) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(23) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(24) X"8C"
change mp2_cpu/dram/pdram/vhdl_memory/mem(25) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(26) X"22"
change mp2_cpu/dram/pdram/vhdl_memory/mem(27) X"01"
change mp2_cpu/dram/pdram/vhdl_memory/mem(28) X"80"
change mp2_cpu/dram/pdram/vhdl_memory/mem(29) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(30) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(31) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(32) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(33) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(34) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(35) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(36) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(37) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(38) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(39) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(40) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(41) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(42) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(43) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(44) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(45) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(46) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(47) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(48) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(49) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(50) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(51) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(52) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(53) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(54) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(55) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(56) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(57) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(58) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(59) X"10"
change mp2_cpu/dram/pdram/vhdl_memory/mem(60) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(61) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(62) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(63) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(64) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(65) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(66) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(67) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(68) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(69) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(70) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(71) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(72) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(73) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(74) X"23"
change mp2_cpu/dram/pdram/vhdl_memory/mem(75) X"11"
change mp2_cpu/dram/pdram/vhdl_memory/mem(76) X"03"
change mp2_cpu/dram/pdram/vhdl_memory/mem(77) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(78) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(79) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(80) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(81) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(82) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(83) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(84) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(85) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(86) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(87) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(88) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(89) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(90) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(91) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(92) X"03"
change mp2_cpu/dram/pdram/vhdl_memory/mem(93) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(94) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(95) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(96) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(97) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(98) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(99) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(100) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(101) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(102) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(103) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(104) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(105) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(106) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(107) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(108) X"04"
change mp2_cpu/dram/pdram/vhdl_memory/mem(109) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(110) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(111) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(112) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(113) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(114) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(115) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(116) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(117) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(118) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(119) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(120) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(121) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(122) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(123) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(124) X"05"
change mp2_cpu/dram/pdram/vhdl_memory/mem(125) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(126) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(127) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(128) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(129) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(130) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(131) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(132) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(133) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(134) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(135) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(136) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(137) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(138) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(139) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(140) X"09"
change mp2_cpu/dram/pdram/vhdl_memory/mem(141) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(142) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(143) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(144) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(145) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(146) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(147) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(148) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(149) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(150) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(151) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(152) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(153) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(154) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(155) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(156) X"03"
change mp2_cpu/dram/pdram/vhdl_memory/mem(157) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(158) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(159) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(160) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(161) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(162) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(163) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(164) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(165) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(166) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(167) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(168) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(169) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(170) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(171) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(172) X"04"
change mp2_cpu/dram/pdram/vhdl_memory/mem(173) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(174) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(175) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(176) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(177) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(178) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(179) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(180) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(181) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(182) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(183) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(184) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(185) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(186) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(187) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(188) X"05"
change mp2_cpu/dram/pdram/vhdl_memory/mem(189) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(190) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(191) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(192) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(193) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(194) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(195) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(196) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(197) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(198) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(199) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(200) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(201) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(202) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(203) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(204) X"06"
change mp2_cpu/dram/pdram/vhdl_memory/mem(205) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(206) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(207) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(208) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(209) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(210) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(211) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(212) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(213) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(214) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(215) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(216) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(217) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(218) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(219) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(220) X"06"
change mp2_cpu/dram/pdram/vhdl_memory/mem(221) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(222) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(223) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(224) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(225) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(226) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(227) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(228) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(229) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(230) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(231) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(232) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(233) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(234) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(235) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(236) X"07"
change mp2_cpu/dram/pdram/vhdl_memory/mem(237) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(238) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(239) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(240) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(241) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(242) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(243) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(244) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(245) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(246) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(247) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(248) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(249) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(250) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(251) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(252) X"08"
change mp2_cpu/dram/pdram/vhdl_memory/mem(253) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(254) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(255) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(256) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(257) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(258) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(259) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(260) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(261) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(262) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(263) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(264) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(265) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(266) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(267) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(268) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(269) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(270) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(271) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(272) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(273) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(274) X"06"
change mp2_cpu/dram/pdram/vhdl_memory/mem(275) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(276) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(277) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(278) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(279) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(280) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(281) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(282) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(283) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(284) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(285) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(286) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(287) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(288) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(289) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(290) X"19"
change mp2_cpu/dram/pdram/vhdl_memory/mem(291) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(292) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(293) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(294) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(295) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(296) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(297) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(298) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(299) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(300) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(301) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(302) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(303) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(304) X"00"
change mp2_cpu/dram/pdram/vhdl_memory/mem(305) X"00"
run 5
echo "Done loading ../testcode/mp22test-evict.asm program code."
