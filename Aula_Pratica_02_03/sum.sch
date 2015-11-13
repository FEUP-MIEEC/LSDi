VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A
        SIGNAL B
        SIGNAL Ci
        SIGNAL S
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL XLXN_14
        SIGNAL XLXN_15
        SIGNAL XLXN_21
        SIGNAL XLXN_22
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_31
        SIGNAL XLXN_32
        SIGNAL XLXN_33
        SIGNAL XLXN_39
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        PORT Input A
        PORT Input B
        PORT Input Ci
        PORT Output S
        BEGIN BLOCKDEF OR
            TIMESTAMP 2015 10 29 16 23 48
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            ARC N -40 -120 72 -8 48 -16 48 -112 
            ARC N -20 -112 156 64 144 -64 64 -112 
            ARC N -20 -192 156 -16 64 -16 144 -64 
            LINE N 208 -64 144 -64 
            LINE N 64 -112 44 -112 
            LINE N 64 -16 44 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF NOT
            TIMESTAMP 2015 10 29 16 23 48
            LINE N 64 -32 0 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
            LINE N 160 -32 224 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF AND
            TIMESTAMP 2015 10 29 16 23 48
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 64 -16 80 -16 
            LINE N 64 -112 80 -112 
            LINE N 64 -16 64 -112 
            ARC N 32 -112 128 -16 80 -16 80 -112 
            LINE N 128 -64 192 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 NOT
            PIN a A
            PIN o XLXN_21
        END BLOCK
        BEGIN BLOCK XLXI_6 NOT
            PIN a B
            PIN o XLXN_24
        END BLOCK
        BEGIN BLOCK XLXI_7 NOT
            PIN a Ci
            PIN o XLXN_29
        END BLOCK
        BEGIN BLOCK XLXI_8 AND
            PIN a A
            PIN b XLXN_29
            PIN o XLXN_23
        END BLOCK
        BEGIN BLOCK XLXI_9 AND
            PIN a XLXN_23
            PIN b XLXN_24
            PIN o XLXN_30
        END BLOCK
        BEGIN BLOCK XLXI_10 AND
            PIN a XLXN_21
            PIN b XLXN_24
            PIN o XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_11 AND
            PIN a A
            PIN b B
            PIN o XLXN_27
        END BLOCK
        BEGIN BLOCK XLXI_12 AND
            PIN a XLXN_21
            PIN b B
            PIN o XLXN_28
        END BLOCK
        BEGIN BLOCK XLXI_13 AND
            PIN a XLXN_26
            PIN b Ci
            PIN o XLXN_31
        END BLOCK
        BEGIN BLOCK XLXI_14 AND
            PIN a XLXN_27
            PIN b Ci
            PIN o XLXN_32
        END BLOCK
        BEGIN BLOCK XLXI_15 AND
            PIN a XLXN_28
            PIN b XLXN_29
            PIN o XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_16 OR
            PIN a XLXN_30
            PIN b XLXN_31
            PIN o XLXN_45
        END BLOCK
        BEGIN BLOCK XLXI_17 OR
            PIN a XLXN_32
            PIN b XLXN_33
            PIN o XLXN_46
        END BLOCK
        BEGIN BLOCK XLXI_18 OR
            PIN a XLXN_45
            PIN b XLXN_46
            PIN o S
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1900 1344
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        BEGIN BRANCH Ci
            WIRE 224 848 272 848
            WIRE 272 848 272 880
            WIRE 272 848 464 848
            WIRE 464 848 512 848
            WIRE 464 848 464 880
            WIRE 464 880 608 880
            WIRE 256 784 272 784
            WIRE 256 784 256 880
            WIRE 256 880 272 880
            WIRE 512 480 512 848
            WIRE 512 480 848 480
            WIRE 608 720 608 880
            WIRE 608 720 848 720
        END BRANCH
        IOMARKER 224 848 Ci R180 28
        BEGIN BRANCH S
            WIRE 1520 512 1552 512
            WIRE 1552 512 1552 688
            WIRE 1552 688 1680 688
        END BRANCH
        IOMARKER 1680 688 S R0 28
        BEGIN BRANCH B
            WIRE 224 704 256 704
            WIRE 256 704 256 736
            WIRE 256 704 400 704
            WIRE 400 704 416 704
            WIRE 416 704 592 704
            WIRE 400 704 400 736
            WIRE 400 736 544 736
            WIRE 544 736 544 848
            WIRE 544 848 640 848
            WIRE 240 640 256 640
            WIRE 240 640 240 736
            WIRE 240 736 256 736
            WIRE 592 608 592 704
            WIRE 592 608 640 608
        END BRANCH
        IOMARKER 224 704 B R180 28
        IOMARKER 224 560 A R180 28
        INSTANCE XLXI_6 256 672 R0
        INSTANCE XLXI_7 272 816 R0
        INSTANCE XLXI_8 640 160 R0
        INSTANCE XLXI_10 640 400 R0
        INSTANCE XLXI_11 640 640 R0
        INSTANCE XLXI_12 640 880 R0
        BEGIN BRANCH A
            WIRE 192 464 192 512
            WIRE 192 512 256 512
            WIRE 256 512 256 544
            WIRE 256 544 256 560
            WIRE 256 560 416 560
            WIRE 416 560 528 560
            WIRE 256 544 640 544
            WIRE 192 464 256 464
            WIRE 224 560 256 560
            WIRE 528 64 528 560
            WIRE 528 64 640 64
        END BRANCH
        INSTANCE XLXI_5 256 496 R0
        BEGIN BRANCH XLXN_21
            WIRE 480 464 512 464
            WIRE 512 464 544 464
            WIRE 512 384 512 464
            WIRE 512 384 624 384
            WIRE 624 384 624 784
            WIRE 624 784 640 784
            WIRE 544 304 544 464
            WIRE 544 304 640 304
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 608 256 848 256
            WIRE 848 256 848 336
            WIRE 608 256 608 416
            WIRE 608 416 848 416
            WIRE 832 336 848 336
        END BRANCH
        BEGIN BRANCH XLXN_27
            WIRE 784 656 784 752
            WIRE 784 752 1104 752
            WIRE 784 656 848 656
            WIRE 832 576 1104 576
            WIRE 1104 576 1104 752
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 768 896 832 896
            WIRE 768 896 768 1056
            WIRE 768 1056 1088 1056
            WIRE 832 816 1088 816
            WIRE 1088 816 1088 1056
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 1024 928 1072 928
            WIRE 1072 720 1072 928
            WIRE 1072 720 1120 720
        END BRANCH
        INSTANCE XLXI_9 832 256 R0
        BEGIN BRANCH XLXN_23
            WIRE 576 16 576 160
            WIRE 576 160 832 160
            WIRE 576 16 848 16
            WIRE 848 16 848 96
            WIRE 832 96 848 96
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 480 640 496 640
            WIRE 496 640 576 640
            WIRE 496 224 832 224
            WIRE 496 224 496 640
            WIRE 576 368 576 640
            WIRE 576 368 640 368
        END BRANCH
        INSTANCE XLXI_13 848 512 R0
        INSTANCE XLXI_14 848 752 R0
        INSTANCE XLXI_15 832 992 R0
        BEGIN BRANCH XLXN_29
            WIRE 496 784 528 784
            WIRE 528 784 560 784
            WIRE 528 784 528 960
            WIRE 528 960 832 960
            WIRE 560 128 560 784
            WIRE 560 128 640 128
        END BRANCH
        INSTANCE XLXI_17 1120 752 R0
        BEGIN BRANCH XLXN_32
            WIRE 1040 688 1056 688
            WIRE 1056 656 1120 656
            WIRE 1056 656 1056 688
        END BRANCH
        INSTANCE XLXI_16 1104 416 R0
        BEGIN BRANCH XLXN_30
            WIRE 1024 192 1040 192
            WIRE 1040 192 1040 320
            WIRE 1040 320 1104 320
        END BRANCH
        BEGIN BRANCH XLXN_31
            WIRE 1040 448 1056 448
            WIRE 1056 384 1104 384
            WIRE 1056 384 1056 448
        END BRANCH
        INSTANCE XLXI_18 1312 576 R0
        BEGIN BRANCH XLXN_45
            WIRE 1232 448 1392 448
            WIRE 1232 448 1232 480
            WIRE 1232 480 1312 480
            WIRE 1312 352 1392 352
            WIRE 1392 352 1392 448
        END BRANCH
        BEGIN BRANCH XLXN_46
            WIRE 1232 544 1312 544
            WIRE 1232 544 1232 624
            WIRE 1232 624 1392 624
            WIRE 1392 624 1392 688
            WIRE 1328 688 1392 688
        END BRANCH
    END SHEET
END SCHEMATIC
