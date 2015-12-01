<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_6(7:0)" />
        <signal name="B(7:0)" />
        <signal name="A(7:0)" />
        <signal name="I5(7:0)" />
        <signal name="I7(7:0)" />
        <signal name="I6(7:0)" />
        <signal name="I7(0)" />
        <signal name="I7(7:1)" />
        <signal name="FLAGS(2)" />
        <signal name="I6(3:0)" />
        <signal name="X(7:0)" />
        <signal name="I5(0)" />
        <signal name="I5(7:1)" />
        <signal name="FLAGS(3:0)" />
        <signal name="XLXN_94" />
        <signal name="reset" />
        <signal name="SEL(2:0)" />
        <signal name="CE(1:0)" />
        <signal name="OPR(2:0)" />
        <signal name="clock" />
        <signal name="I6(7:4)" />
        <signal name="XLXN_95(7:0)" />
        <signal name="XLXN_98(7:0)" />
        <signal name="XLXN_99(7:0)" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102" />
        <signal name="XLXN_103" />
        <signal name="XLXN_104" />
        <signal name="XLXN_105" />
        <signal name="XLXN_106(3:0)" />
        <signal name="XLXN_108" />
        <signal name="XLXN_109" />
        <signal name="XLXN_111(2:0)" />
        <signal name="XLXN_112(7:0)" />
        <signal name="XLXN_113(7:0)" />
        <signal name="XLXN_114(7:0)" />
        <port polarity="Output" name="B(7:0)" />
        <port polarity="Output" name="A(7:0)" />
        <port polarity="Input" name="X(7:0)" />
        <port polarity="Output" name="FLAGS(3:0)" />
        <port polarity="Input" name="reset" />
        <port polarity="Input" name="SEL(2:0)" />
        <port polarity="Input" name="CE(1:0)" />
        <port polarity="Input" name="OPR(2:0)" />
        <port polarity="Input" name="clock" />
        <blockdef name="lsdalu">
            <timestamp>2011-11-29T15:15:17</timestamp>
            <rect width="256" x="64" y="-340" height="340" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-92" height="24" />
            <line x2="384" y1="-80" y2="-80" x1="320" />
        </blockdef>
        <blockdef name="mux81">
            <timestamp>2011-12-1T9:26:51</timestamp>
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="64" y1="-568" y2="-632" x1="320" />
            <line x2="64" y1="-632" y2="0" x1="64" />
            <line x2="320" y1="0" y2="-56" x1="64" />
            <line x2="320" y1="-56" y2="-568" x1="320" />
            <rect width="64" x="320" y="-332" height="24" />
            <line x2="384" y1="-320" y2="-320" x1="320" />
            <line x2="208" y1="16" y2="-32" x1="208" />
            <line x2="220" y1="16" y2="-32" x1="220" />
            <line x2="196" y1="16" y2="16" x1="220" />
            <line x2="196" y1="16" y2="-28" x1="196" />
            <line x2="220" y1="-28" y2="-32" x1="196" />
        </blockdef>
        <blockdef name="dec24">
            <timestamp>2011-12-1T12:10:44</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="reg4b">
            <timestamp>2011-12-1T12:24:28</timestamp>
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="112" y1="-108" y2="-96" x1="64" />
            <line x2="64" y1="-96" y2="-84" x1="112" />
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="reg8b">
            <timestamp>2011-12-1T12:21:51</timestamp>
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="112" y1="-108" y2="-96" x1="64" />
            <line x2="64" y1="-96" y2="-84" x1="112" />
            <rect width="256" x="64" y="-256" height="256" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="mux81" name="XLXI_20">
            <blockpin signalname="A(7:0)" name="I0(7:0)" />
            <blockpin signalname="XLXN_99(7:0)" name="I1(7:0)" />
            <blockpin signalname="XLXN_98(7:0)" name="I2(7:0)" />
            <blockpin signalname="XLXN_95(7:0)" name="I3(7:0)" />
            <blockpin signalname="X(7:0)" name="I4(7:0)" />
            <blockpin signalname="I5(7:0)" name="I5(7:0)" />
            <blockpin signalname="I6(7:0)" name="I6(7:0)" />
            <blockpin signalname="I7(7:0)" name="I7(7:0)" />
            <blockpin signalname="B(7:0)" name="Y(7:0)" />
            <blockpin signalname="SEL(2:0)" name="SEL(2:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_38(6:0)">
            <blockpin signalname="I7(7:1)" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_47">
            <blockpin signalname="FLAGS(2)" name="I" />
            <blockpin signalname="I7(0)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_42(3:0)">
            <blockpin signalname="I6(7:4)" name="G" />
        </block>
        <block symbolname="vcc" name="VCC(3:0)">
            <blockpin signalname="I6(3:0)" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_29">
            <blockpin signalname="I5(0)" name="P" />
        </block>
        <block symbolname="gnd" name="GND1(6:0)">
            <blockpin signalname="I5(7:1)" name="G" />
        </block>
        <block symbolname="reg8b" name="XLXI_23">
            <blockpin signalname="clock" name="ck" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_101" name="enable" />
            <blockpin signalname="XLXN_6(7:0)" name="D(7:0)" />
            <blockpin signalname="A(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="reg8b" name="XLXI_24">
            <blockpin signalname="clock" name="ck" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_102" name="enable" />
            <blockpin signalname="XLXN_6(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_99(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="reg8b" name="XLXI_25">
            <blockpin signalname="clock" name="ck" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_103" name="enable" />
            <blockpin signalname="XLXN_6(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_98(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="reg8b" name="XLXI_26">
            <blockpin signalname="clock" name="ck" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_104" name="enable" />
            <blockpin signalname="XLXN_6(7:0)" name="D(7:0)" />
            <blockpin signalname="XLXN_95(7:0)" name="Q(7:0)" />
        </block>
        <block symbolname="lsdalu" name="XLXI_9">
            <blockpin signalname="OPR(2:0)" name="OPR(2:0)" />
            <blockpin signalname="A(7:0)" name="A(7:0)" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_6(7:0)" name="R(7:0)" />
            <blockpin signalname="XLXN_106(3:0)" name="FLAGS(3:0)" />
        </block>
        <block symbolname="reg4b" name="XLXI_22">
            <blockpin signalname="clock" name="ck" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="XLXN_94" name="enable" />
            <blockpin signalname="XLXN_106(3:0)" name="D(3:0)" />
            <blockpin signalname="FLAGS(3:0)" name="Q(3:0)" />
        </block>
        <block symbolname="vcc" name="XLXI_76">
            <blockpin signalname="XLXN_94" name="P" />
        </block>
        <block symbolname="dec24" name="XLXI_21">
            <blockpin signalname="CE(1:0)" name="CE(1:0)" />
            <blockpin signalname="XLXN_104" name="Y3" />
            <blockpin signalname="XLXN_101" name="Y0" />
            <blockpin signalname="XLXN_102" name="Y1" />
            <blockpin signalname="XLXN_103" name="Y2" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="I5(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1428" y="1856" type="branch" />
            <wire x2="1152" y1="1856" y2="2000" x1="1152" />
            <wire x2="1428" y1="1856" y2="1856" x1="1152" />
            <wire x2="1824" y1="1856" y2="1856" x1="1428" />
        </branch>
        <branch name="I7(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1696" y="1984" type="branch" />
            <wire x2="1696" y1="1984" y2="2352" x1="1696" />
            <wire x2="1824" y1="1984" y2="1984" x1="1696" />
        </branch>
        <branch name="I6(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1596" y="1920" type="branch" />
            <wire x2="1488" y1="1920" y2="2080" x1="1488" />
            <wire x2="1596" y1="1920" y2="1920" x1="1488" />
            <wire x2="1824" y1="1920" y2="1920" x1="1596" />
        </branch>
        <instance x="1824" y="2080" name="XLXI_20" orien="R0">
        </instance>
        <text style="fontsize:32;fontname:Arial;textcolor:rgb(255,0,0)" x="1780" y="1840">1</text>
        <text style="fontsize:32;fontname:Arial;textcolor:rgb(255,0,0)" x="1772" y="1904">15</text>
        <branch name="I7(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2288" type="branch" />
            <wire x2="1584" y1="2288" y2="2288" x1="1568" />
        </branch>
        <instance x="1456" y="2464" name="XLXI_38(6:0)" orien="R0" />
        <branch name="I7(7:1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1584" y="2336" type="branch" />
            <wire x2="1584" y1="2336" y2="2336" x1="1520" />
        </branch>
        <branch name="FLAGS(2)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1312" y="2288" type="branch" />
            <wire x2="1344" y1="2288" y2="2288" x1="1312" />
        </branch>
        <instance x="1344" y="2320" name="XLXI_47" orien="R0" />
        <text style="fontsize:24;fontname:Arial" x="1176" y="2332">(flag CARRY)</text>
        <branch name="I6(3:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1376" y="2016" type="branch" />
            <wire x2="1312" y1="2000" y2="2016" x1="1312" />
            <wire x2="1376" y1="2016" y2="2016" x1="1312" />
        </branch>
        <instance x="1248" y="2192" name="XLXI_42(3:0)" orien="R0" />
        <instance x="1248" y="2000" name="VCC(3:0)" orien="R0" />
        <text style="fontsize:32;fontname:Arial;textcolor:rgb(255,0,0)" x="1780" y="1968">C</text>
        <branch name="X(7:0)">
            <wire x2="1824" y1="1792" y2="1792" x1="288" />
        </branch>
        <instance x="896" y="1920" name="XLXI_29" orien="R0" />
        <branch name="I5(0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1024" y="1936" type="branch" />
            <wire x2="960" y1="1920" y2="1936" x1="960" />
            <wire x2="1024" y1="1936" y2="1936" x1="960" />
        </branch>
        <branch name="I5(7:1)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1024" y="1984" type="branch" />
            <wire x2="1024" y1="1984" y2="1984" x1="960" />
        </branch>
        <instance x="896" y="2112" name="GND1(6:0)" orien="R0" />
        <instance x="1072" y="464" name="XLXI_23" orien="R0">
        </instance>
        <instance x="1072" y="864" name="XLXI_24" orien="R0">
        </instance>
        <instance x="1072" y="1264" name="XLXI_25" orien="R0">
        </instance>
        <instance x="1072" y="1664" name="XLXI_26" orien="R0">
        </instance>
        <instance x="2336" y="1120" name="XLXI_9" orien="R0">
        </instance>
        <branch name="FLAGS(3:0)">
            <wire x2="3312" y1="1312" y2="1312" x1="3264" />
        </branch>
        <instance x="2640" y="1344" name="XLXI_76" orien="R0" />
        <branch name="XLXN_94">
            <wire x2="2704" y1="1344" y2="1376" x1="2704" />
            <wire x2="2880" y1="1376" y2="1376" x1="2704" />
        </branch>
        <text style="fontsize:32;fontname:Arial;textcolor:rgb(255,0,0)" x="2828" y="1360">1</text>
        <instance x="224" y="528" name="XLXI_21" orien="R0">
        </instance>
        <iomarker fontsize="28" x="320" y="2624" name="clock" orien="R180" />
        <iomarker fontsize="28" x="320" y="2688" name="reset" orien="R180" />
        <iomarker fontsize="28" x="3280" y="1760" name="B(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3248" y="240" name="A(7:0)" orien="R0" />
        <instance x="2880" y="1536" name="XLXI_22" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3312" y="1312" name="FLAGS(3:0)" orien="R0" />
        <branch name="CE(1:0)">
            <wire x2="224" y1="304" y2="304" x1="192" />
        </branch>
        <iomarker fontsize="28" x="192" y="304" name="CE(1:0)" orien="R180" />
        <text style="fontsize:60;fontname:Arial;textcolor:rgb(0,0,0)" x="1304" y="404">A</text>
        <text style="fontsize:60;fontname:Arial;textcolor:rgb(0,0,0)" x="1292" y="808">R1</text>
        <text style="fontsize:60;fontname:Arial;textcolor:rgb(0,0,0)" x="1292" y="1208">R2</text>
        <text style="fontsize:60;fontname:Arial;textcolor:rgb(0,0,0)" x="1292" y="1608">R3</text>
        <iomarker fontsize="28" x="320" y="2496" name="SEL(2:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="2560" name="OPR(2:0)" orien="R180" />
        <branch name="reset">
            <wire x2="624" y1="2688" y2="2688" x1="320" />
            <wire x2="2800" y1="2688" y2="2688" x1="624" />
            <wire x2="624" y1="2672" y2="2688" x1="624" />
            <wire x2="912" y1="2672" y2="2672" x1="624" />
            <wire x2="1072" y1="432" y2="432" x1="912" />
            <wire x2="912" y1="432" y2="832" x1="912" />
            <wire x2="1072" y1="832" y2="832" x1="912" />
            <wire x2="912" y1="832" y2="1232" x1="912" />
            <wire x2="1072" y1="1232" y2="1232" x1="912" />
            <wire x2="912" y1="1232" y2="1632" x1="912" />
            <wire x2="912" y1="1632" y2="2672" x1="912" />
            <wire x2="1072" y1="1632" y2="1632" x1="912" />
            <wire x2="2880" y1="1504" y2="1504" x1="2800" />
            <wire x2="2800" y1="1504" y2="2688" x1="2800" />
        </branch>
        <branch name="A(7:0)">
            <wire x2="1712" y1="240" y2="240" x1="1456" />
            <wire x2="1712" y1="240" y2="1536" x1="1712" />
            <wire x2="1824" y1="1536" y2="1536" x1="1712" />
            <wire x2="2160" y1="240" y2="240" x1="1712" />
            <wire x2="3248" y1="240" y2="240" x1="2160" />
            <wire x2="2160" y1="240" y2="816" x1="2160" />
            <wire x2="2336" y1="816" y2="816" x1="2160" />
        </branch>
        <branch name="SEL(2:0)">
            <wire x2="496" y1="2496" y2="2496" x1="320" />
            <wire x2="512" y1="2496" y2="2496" x1="496" />
            <wire x2="2032" y1="2496" y2="2496" x1="512" />
            <wire x2="2032" y1="2096" y2="2496" x1="2032" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="2384" y1="1760" y2="1760" x1="2208" />
            <wire x2="3280" y1="1760" y2="1760" x1="2384" />
            <wire x2="2336" y1="976" y2="976" x1="2256" />
            <wire x2="2256" y1="976" y2="1200" x1="2256" />
            <wire x2="2384" y1="1200" y2="1200" x1="2256" />
            <wire x2="2384" y1="1200" y2="1760" x1="2384" />
        </branch>
        <branch name="XLXN_6(7:0)">
            <wire x2="2784" y1="112" y2="112" x1="992" />
            <wire x2="2784" y1="112" y2="896" x1="2784" />
            <wire x2="992" y1="112" y2="240" x1="992" />
            <wire x2="1072" y1="240" y2="240" x1="992" />
            <wire x2="992" y1="240" y2="640" x1="992" />
            <wire x2="1072" y1="640" y2="640" x1="992" />
            <wire x2="992" y1="640" y2="1040" x1="992" />
            <wire x2="992" y1="1040" y2="1440" x1="992" />
            <wire x2="1072" y1="1440" y2="1440" x1="992" />
            <wire x2="1072" y1="1040" y2="1040" x1="992" />
            <wire x2="2784" y1="896" y2="896" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="288" y="1792" name="X(7:0)" orien="R180" />
        <branch name="I6(7:4)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="1376" y="2064" type="branch" />
            <wire x2="1376" y1="2064" y2="2064" x1="1312" />
        </branch>
        <branch name="XLXN_95(7:0)">
            <wire x2="1632" y1="1440" y2="1440" x1="1456" />
            <wire x2="1632" y1="1440" y2="1728" x1="1632" />
            <wire x2="1824" y1="1728" y2="1728" x1="1632" />
        </branch>
        <branch name="XLXN_98(7:0)">
            <wire x2="1648" y1="1040" y2="1040" x1="1456" />
            <wire x2="1648" y1="1040" y2="1664" x1="1648" />
            <wire x2="1824" y1="1664" y2="1664" x1="1648" />
        </branch>
        <branch name="XLXN_99(7:0)">
            <wire x2="1664" y1="640" y2="640" x1="1456" />
            <wire x2="1664" y1="640" y2="1600" x1="1664" />
            <wire x2="1824" y1="1600" y2="1600" x1="1664" />
        </branch>
        <branch name="XLXN_101">
            <wire x2="1072" y1="304" y2="304" x1="608" />
        </branch>
        <branch name="XLXN_102">
            <wire x2="832" y1="368" y2="368" x1="608" />
            <wire x2="832" y1="368" y2="704" x1="832" />
            <wire x2="1072" y1="704" y2="704" x1="832" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="816" y1="432" y2="432" x1="608" />
            <wire x2="816" y1="432" y2="1104" x1="816" />
            <wire x2="1072" y1="1104" y2="1104" x1="816" />
        </branch>
        <branch name="XLXN_104">
            <wire x2="800" y1="496" y2="496" x1="608" />
            <wire x2="800" y1="496" y2="1504" x1="800" />
            <wire x2="1072" y1="1504" y2="1504" x1="800" />
        </branch>
        <branch name="XLXN_106(3:0)">
            <wire x2="2800" y1="1040" y2="1040" x1="2720" />
            <wire x2="2800" y1="1040" y2="1312" x1="2800" />
            <wire x2="2880" y1="1312" y2="1312" x1="2800" />
        </branch>
        <branch name="clock">
            <wire x2="592" y1="2624" y2="2624" x1="320" />
            <wire x2="2704" y1="2624" y2="2624" x1="592" />
            <wire x2="592" y1="2608" y2="2624" x1="592" />
            <wire x2="880" y1="2608" y2="2608" x1="592" />
            <wire x2="1072" y1="368" y2="368" x1="880" />
            <wire x2="880" y1="368" y2="768" x1="880" />
            <wire x2="1072" y1="768" y2="768" x1="880" />
            <wire x2="880" y1="768" y2="1168" x1="880" />
            <wire x2="1072" y1="1168" y2="1168" x1="880" />
            <wire x2="880" y1="1168" y2="1568" x1="880" />
            <wire x2="880" y1="1568" y2="2608" x1="880" />
            <wire x2="1072" y1="1568" y2="1568" x1="880" />
            <wire x2="2880" y1="1440" y2="1440" x1="2704" />
            <wire x2="2704" y1="1440" y2="2624" x1="2704" />
        </branch>
        <branch name="OPR(2:0)">
            <wire x2="512" y1="2560" y2="2560" x1="320" />
            <wire x2="1616" y1="2560" y2="2560" x1="512" />
            <wire x2="1616" y1="1088" y2="2560" x1="1616" />
            <wire x2="2336" y1="1088" y2="1088" x1="1616" />
        </branch>
    </sheet>
</drawing>