VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Co
        SIGNAL ZERO
        SIGNAL R(7:0)
        SIGNAL sA
        SIGNAL sB
        SIGNAL SINAL
        SIGNAL OPR(2:0)
        SIGNAL XLXN_11
        SIGNAL R(0)
        SIGNAL R(1)
        SIGNAL R(3)
        SIGNAL R(4)
        SIGNAL R(5)
        SIGNAL R(6)
        SIGNAL R(7)
        SIGNAL R(2)
        SIGNAL XLXN_22
        SIGNAL XLXN_31
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL OPR(2)
        SIGNAL OPR(1)
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL OPR(0)
        SIGNAL XLXN_66
        SIGNAL XLXN_67
        SIGNAL XLXN_68
        SIGNAL XLXN_69
        SIGNAL XLXN_70
        SIGNAL XLXN_71
        SIGNAL XLXN_72
        SIGNAL XLXN_73
        SIGNAL XLXN_75
        SIGNAL XLXN_76
        SIGNAL XLXN_77
        SIGNAL XLXN_78
        SIGNAL XLXN_79
        SIGNAL XLXN_80
        SIGNAL XLXN_81
        SIGNAL CARRY
        SIGNAL XLXN_82
        SIGNAL OVFL
        SIGNAL XLXN_86
        SIGNAL XLXN_87
        SIGNAL XLXN_88
        PORT Input Co
        PORT Output ZERO
        PORT Input R(7:0)
        PORT Input sA
        PORT Input sB
        PORT Output SINAL
        PORT Input OPR(2:0)
        PORT Output CARRY
        PORT Output OVFL
        BEGIN BLOCKDEF nor8
            TIMESTAMP 2000 1 1 10 10 10
            ARC N -40 -344 72 -232 48 -240 48 -336 
            LINE N 128 -336 64 -336 
            LINE N 128 -240 64 -240 
            ARC N 44 -416 220 -240 128 -240 208 -288 
            ARC N 44 -336 220 -160 208 -288 128 -336 
            LINE N 256 -288 228 -288 
            CIRCLE N 208 -296 228 -276 
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 48 -192 
            LINE N 0 -384 48 -384 
            LINE N 0 -448 48 -448 
            LINE N 0 -512 48 -512 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            LINE N 48 -336 48 -512 
            LINE N 48 -64 48 -240 
            LINE N 72 -336 48 -336 
            LINE N 72 -240 52 -240 
        END BLOCKDEF
        BEGIN BLOCKDEF buf
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 128 -32 
            LINE N 64 0 128 -32 
            LINE N 128 -32 64 -64 
            LINE N 64 -64 64 0 
        END BLOCKDEF
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF and4b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -208 144 -208 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
        END BLOCKDEF
        BEGIN BLOCKDEF and4b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
        END BLOCKDEF
        BEGIN BLOCKDEF and4b3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 40 -192 
            CIRCLE N 40 -204 64 -180 
            LINE N 0 -256 64 -256 
            LINE N 256 -160 192 -160 
            LINE N 64 -64 64 -256 
            LINE N 144 -112 64 -112 
            ARC N 96 -208 192 -112 144 -112 144 -208 
            LINE N 64 -208 144 -208 
        END BLOCKDEF
        BEGIN BLOCKDEF or4
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 48 -256 
            LINE N 256 -160 192 -160 
            ARC N 28 -208 204 -32 192 -160 112 -208 
            LINE N 112 -208 48 -208 
            LINE N 112 -112 48 -112 
            LINE N 48 -256 48 -208 
            LINE N 48 -64 48 -112 
            ARC N -40 -216 72 -104 48 -112 48 -208 
            ARC N 28 -288 204 -112 112 -112 192 -160 
        END BLOCKDEF
        BEGIN BLOCK XLXI_3 nor8
            PIN I0 R(7)
            PIN I1 R(6)
            PIN I2 R(5)
            PIN I3 R(4)
            PIN I4 R(3)
            PIN I5 R(2)
            PIN I6 R(1)
            PIN I7 R(0)
            PIN O ZERO
        END BLOCK
        BEGIN BLOCK XLXI_4 buf
            PIN I R(7)
            PIN O SINAL
        END BLOCK
        BEGIN BLOCK XLXI_6 and2
            PIN I0 XLXN_33
            PIN I1 Co
            PIN O CARRY
        END BLOCK
        BEGIN BLOCK XLXI_9 and3b2
            PIN I0 OPR(2)
            PIN I1 OPR(0)
            PIN I2 OPR(1)
            PIN O XLXN_29
        END BLOCK
        BEGIN BLOCK XLXI_10 and3b2
            PIN I0 OPR(2)
            PIN I1 OPR(0)
            PIN I2 OPR(1)
            PIN O XLXN_30
        END BLOCK
        BEGIN BLOCK XLXI_11 or2
            PIN I0 XLXN_30
            PIN I1 XLXN_29
            PIN O XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_25 and4b2
            PIN I0 R(7)
            PIN I1 OPR(0)
            PIN I2 sA
            PIN I3 sB
            PIN O XLXN_77
        END BLOCK
        BEGIN BLOCK XLXI_26 and4b2
            PIN I0 sA
            PIN I1 R(7)
            PIN I2 sB
            PIN I3 OPR(0)
            PIN O XLXN_78
        END BLOCK
        BEGIN BLOCK XLXI_27 and4b1
            PIN I0 sB
            PIN I1 sA
            PIN I2 R(7)
            PIN I3 OPR(0)
            PIN O XLXN_79
        END BLOCK
        BEGIN BLOCK XLXI_28 and4b3
            PIN I0 sB
            PIN I1 sA
            PIN I2 OPR(0)
            PIN I3 R(7)
            PIN O XLXN_80
        END BLOCK
        BEGIN BLOCK XLXI_31 or4
            PIN I0 XLXN_80
            PIN I1 XLXN_79
            PIN I2 XLXN_78
            PIN I3 XLXN_77
            PIN O XLXN_88
        END BLOCK
        BEGIN BLOCK XLXI_33 and2
            PIN I0 XLXN_88
            PIN I1 CARRY
            PIN O OVFL
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN BRANCH Co
            WIRE 128 688 144 688
            WIRE 144 688 144 880
            WIRE 144 880 2496 880
        END BRANCH
        BEGIN BRANCH ZERO
            WIRE 864 272 2032 272
            WIRE 2032 272 2032 320
            WIRE 2032 320 2880 320
            WIRE 2880 304 3088 304
            WIRE 2880 304 2880 320
        END BRANCH
        IOMARKER 3088 576 SINAL R0 28
        BEGIN BRANCH SINAL
            WIRE 1136 560 2896 560
            WIRE 2896 560 2896 576
            WIRE 2896 576 3088 576
        END BRANCH
        IOMARKER 160 272 R(7:0) R180 28
        IOMARKER 144 2128 sA R180 28
        IOMARKER 3088 304 ZERO R0 28
        IOMARKER 128 688 Co R180 28
        IOMARKER 144 1728 sB R180 28
        BEGIN BRANCH sB
            WIRE 144 1728 352 1728
            WIRE 352 1728 352 1760
            WIRE 352 1760 352 1808
            WIRE 352 1808 352 1872
            WIRE 352 1872 352 2320
            WIRE 352 2320 800 2320
            WIRE 352 1872 544 1872
            WIRE 352 1808 560 1808
            WIRE 560 1808 560 1904
            WIRE 560 1904 800 1904
            WIRE 352 1760 528 1760
            WIRE 528 1760 528 2592
            WIRE 528 2592 800 2592
            WIRE 544 1536 544 1872
            WIRE 544 1536 800 1536
        END BRANCH
        BEGIN BRANCH sA
            WIRE 144 2128 416 2128
            WIRE 416 2128 416 2160
            WIRE 416 2160 416 2256
            WIRE 416 2256 464 2256
            WIRE 464 2256 688 2256
            WIRE 688 2256 800 2256
            WIRE 464 2256 464 2528
            WIRE 464 2528 800 2528
            WIRE 416 2160 560 2160
            WIRE 560 2032 560 2160
            WIRE 560 2032 800 2032
            WIRE 688 1600 800 1600
            WIRE 688 1600 688 2256
        END BRANCH
        IOMARKER 3104 912 CARRY R0 28
        IOMARKER 3120 1488 OVFL R0 28
        BEGIN BRANCH OPR(2:0)
            WIRE 208 1040 304 1040
        END BRANCH
        IOMARKER 208 1040 OPR(2:0) R180 28
        BEGIN BRANCH R(7:0)
            WIRE 160 272 272 272
        END BRANCH
        INSTANCE XLXI_3 608 560 R0
        BEGIN BRANCH R(0)
            WIRE 496 48 608 48
            BEGIN DISPLAY 496 48 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(1)
            WIRE 464 112 608 112
            BEGIN DISPLAY 464 112 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(2)
            WIRE 464 176 608 176
            BEGIN DISPLAY 464 176 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(3)
            WIRE 464 240 608 240
            BEGIN DISPLAY 464 240 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(4)
            WIRE 464 304 608 304
            BEGIN DISPLAY 464 304 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(5)
            WIRE 464 368 608 368
            BEGIN DISPLAY 464 368 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(6)
            WIRE 464 432 608 432
            BEGIN DISPLAY 464 432 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH R(7)
            WIRE 464 496 528 496
            WIRE 528 496 608 496
            WIRE 528 496 528 640
            WIRE 528 640 720 640
            WIRE 720 560 720 640
            WIRE 720 560 912 560
            BEGIN DISPLAY 464 496 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_4 912 592 R0
        INSTANCE XLXI_9 608 1120 R0
        INSTANCE XLXI_10 608 1328 R0
        BEGIN BRANCH OPR(1)
            WIRE 448 928 608 928
            BEGIN DISPLAY 448 928 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OPR(0)
            WIRE 448 992 608 992
            BEGIN DISPLAY 448 992 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OPR(2)
            WIRE 448 1056 608 1056
            BEGIN DISPLAY 448 1056 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OPR(1)
            WIRE 432 1136 608 1136
            BEGIN DISPLAY 432 1136 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OPR(0)
            WIRE 432 1200 608 1200
            BEGIN DISPLAY 432 1200 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OPR(2)
            WIRE 432 1264 608 1264
            BEGIN DISPLAY 432 1264 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_11 976 1184 R0
        BEGIN BRANCH XLXN_29
            WIRE 864 992 912 992
            WIRE 912 992 912 1056
            WIRE 912 1056 976 1056
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 864 1200 912 1200
            WIRE 912 1120 912 1200
            WIRE 912 1120 976 1120
        END BRANCH
        BEGIN BRANCH R(7)
            WIRE 176 1648 336 1648
            WIRE 336 1648 336 1712
            WIRE 336 1712 560 1712
            WIRE 560 1712 560 1728
            WIRE 560 1728 800 1728
            WIRE 336 1712 336 1968
            WIRE 336 1968 800 1968
            WIRE 336 1968 336 2192
            WIRE 336 2192 592 2192
            WIRE 592 2192 800 2192
            WIRE 592 2192 592 2400
            WIRE 592 2400 800 2400
            BEGIN DISPLAY 176 1648 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_25 800 1792 R0
        INSTANCE XLXI_26 800 2096 R0
        INSTANCE XLXI_27 800 2384 R0
        INSTANCE XLXI_28 800 2656 R0
        BEGIN BRANCH OPR(0)
            WIRE 176 1552 304 1552
            WIRE 304 1552 304 1664
            WIRE 304 1664 512 1664
            WIRE 512 1664 512 2464
            WIRE 512 2464 800 2464
            WIRE 512 1664 576 1664
            WIRE 576 1664 624 1664
            WIRE 624 1664 800 1664
            WIRE 624 1664 624 1840
            WIRE 624 1840 800 1840
            WIRE 576 1664 576 2128
            WIRE 576 2128 800 2128
            BEGIN DISPLAY 176 1552 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_77
            WIRE 1056 1632 1504 1632
            WIRE 1504 1632 1504 1888
        END BRANCH
        BEGIN BRANCH XLXN_78
            WIRE 1056 1936 1280 1936
            WIRE 1280 1936 1280 1952
            WIRE 1280 1952 1504 1952
        END BRANCH
        BEGIN BRANCH XLXN_79
            WIRE 1056 2224 1280 2224
            WIRE 1280 2016 1280 2224
            WIRE 1280 2016 1504 2016
        END BRANCH
        BEGIN BRANCH XLXN_80
            WIRE 1056 2496 1504 2496
            WIRE 1504 2080 1504 2496
        END BRANCH
        BEGIN BRANCH CARRY
            WIRE 2080 1824 2080 1904
            WIRE 2080 1904 2144 1904
            WIRE 2080 1824 2912 1824
            WIRE 2752 912 2912 912
            WIRE 2912 912 3104 912
            WIRE 2912 912 2912 1824
        END BRANCH
        INSTANCE XLXI_6 2496 1008 R0
        BEGIN BRANCH XLXN_33
            WIRE 1232 1088 1248 1088
            WIRE 1248 944 2496 944
            WIRE 1248 944 1248 1088
        END BRANCH
        BEGIN BRANCH OVFL
            WIRE 2400 1936 3104 1936
            WIRE 3104 1488 3120 1488
            WIRE 3104 1488 3104 1936
        END BRANCH
        INSTANCE XLXI_31 1504 2144 R0
        INSTANCE XLXI_33 2144 2032 R0
        BEGIN BRANCH XLXN_88
            WIRE 1760 1984 2096 1984
            WIRE 2096 1968 2144 1968
            WIRE 2096 1968 2096 1984
        END BRANCH
    END SHEET
END SCHEMATIC
