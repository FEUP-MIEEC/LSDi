VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Co
        SIGNAL Ci
        SIGNAL A0
        SIGNAL A1
        SIGNAL A2
        SIGNAL A3
        SIGNAL B0
        SIGNAL B1
        SIGNAL B2
        SIGNAL B3
        SIGNAL S0
        SIGNAL S1
        SIGNAL S2
        SIGNAL S3
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL XLXN_19
        PORT Output Co
        PORT Input Ci
        PORT Input A0
        PORT Input A1
        PORT Input A2
        PORT Input A3
        PORT Input B0
        PORT Input B1
        PORT Input B2
        PORT Input B3
        PORT Output S0
        PORT Output S1
        PORT Output S2
        PORT Output S3
        BEGIN BLOCKDEF fulladder
            TIMESTAMP 2015 10 29 16 23 48
            RECTANGLE N 48 -240 208 -48 
            LINE N 80 -240 80 -288 
            LINE N 176 -240 176 -288 
            LINE N 128 -48 128 0 
            LINE N 48 -112 0 -112 
            LINE N 208 -112 256 -112 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fulladder
            PIN A A0
            PIN B B0
            PIN Ci Ci
            PIN Co XLXN_10
            PIN S S0
        END BLOCK
        BEGIN BLOCK XLXI_5 fulladder
            PIN A A1
            PIN B B1
            PIN Ci XLXN_10
            PIN Co XLXN_11
            PIN S S1
        END BLOCK
        BEGIN BLOCK XLXI_6 fulladder
            PIN A A3
            PIN B B3
            PIN Ci XLXN_12
            PIN Co Co
            PIN S S3
        END BLOCK
        BEGIN BLOCK XLXI_7 fulladder
            PIN A A2
            PIN B B2
            PIN Ci XLXN_11
            PIN Co XLXN_12
            PIN S S2
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1900 1344
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        BEGIN BRANCH Co
            WIRE 480 1152 560 1152
            WIRE 480 1152 480 1296
            WIRE 480 1296 848 1296
            WIRE 848 1248 848 1296
            WIRE 848 1248 1680 1248
            WIRE 1680 1248 1744 1248
        END BRANCH
        IOMARKER 1744 1248 Co R0 28
        BEGIN BRANCH Ci
            WIRE 128 80 192 80
            WIRE 192 80 256 80
            WIRE 256 80 256 1328
            WIRE 256 1328 1888 1328
            WIRE 1792 240 1888 240
            WIRE 1888 240 1888 1328
        END BRANCH
        BEGIN BRANCH A0
            WIRE 128 176 144 176
            WIRE 144 48 144 176
            WIRE 144 48 1616 48
            WIRE 1616 48 1616 64
        END BRANCH
        BEGIN BRANCH A1
            WIRE 128 240 144 240
            WIRE 144 240 192 240
            WIRE 192 240 1328 240
            WIRE 1328 240 1328 368
        END BRANCH
        BEGIN BRANCH A2
            WIRE 128 304 144 304
            WIRE 144 304 192 304
            WIRE 192 304 192 352
            WIRE 192 352 1008 352
            WIRE 1008 352 1008 656
        END BRANCH
        BEGIN BRANCH B0
            WIRE 128 464 208 464
            WIRE 208 16 208 464
            WIRE 208 16 1712 16
            WIRE 1712 16 1712 64
        END BRANCH
        BEGIN BRANCH B1
            WIRE 128 528 192 528
            WIRE 192 528 272 528
            WIRE 272 304 272 528
            WIRE 272 304 1424 304
            WIRE 1424 304 1424 368
        END BRANCH
        BEGIN BRANCH B2
            WIRE 128 592 144 592
            WIRE 144 592 192 592
            WIRE 192 592 1104 592
            WIRE 1104 592 1104 656
        END BRANCH
        IOMARKER 128 80 Ci R180 28
        IOMARKER 128 176 A0 R180 28
        IOMARKER 128 240 A1 R180 28
        IOMARKER 128 304 A2 R180 28
        IOMARKER 128 368 A3 R180 28
        IOMARKER 128 464 B0 R180 28
        IOMARKER 128 528 B1 R180 28
        IOMARKER 128 592 B2 R180 28
        IOMARKER 128 656 B3 R180 28
        BEGIN BRANCH S0
            WIRE 1664 352 1664 944
            WIRE 1664 944 1680 944
            WIRE 1680 944 1744 944
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1376 656 1376 1008
            WIRE 1376 1008 1680 1008
            WIRE 1680 1008 1744 1008
        END BRANCH
        BEGIN BRANCH S2
            WIRE 1056 944 1056 1072
            WIRE 1056 1072 1680 1072
            WIRE 1680 1072 1744 1072
        END BRANCH
        BEGIN BRANCH S3
            WIRE 688 1264 688 1312
            WIRE 688 1312 832 1312
            WIRE 832 1136 832 1312
            WIRE 832 1136 1680 1136
            WIRE 1680 1136 1744 1136
        END BRANCH
        IOMARKER 1744 944 S0 R0 28
        IOMARKER 1744 1008 S1 R0 28
        IOMARKER 1744 1072 S2 R0 28
        IOMARKER 1744 1136 S3 R0 28
        BEGIN BRANCH B3
            WIRE 128 656 192 656
            WIRE 192 656 736 656
            WIRE 736 656 736 912
            WIRE 736 912 736 976
        END BRANCH
        BEGIN BRANCH A3
            WIRE 128 368 192 368
            WIRE 192 368 640 368
            WIRE 640 368 640 976
        END BRANCH
        BEGIN INSTANCE XLXI_1 1536 352 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 928 944 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 560 1264 R0
        END INSTANCE
        BEGIN BRANCH XLXN_10
            WIRE 1504 544 1520 544
            WIRE 1520 240 1536 240
            WIRE 1520 240 1520 544
        END BRANCH
        BEGIN INSTANCE XLXI_5 1248 656 R0
        END INSTANCE
        BEGIN BRANCH XLXN_11
            WIRE 1184 832 1216 832
            WIRE 1216 544 1216 832
            WIRE 1216 544 1248 544
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 816 1152 864 1152
            WIRE 864 832 864 1152
            WIRE 864 832 928 832
        END BRANCH
    END SHEET
END SCHEMATIC
