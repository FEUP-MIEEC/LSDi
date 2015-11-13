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
        SIGNAL Co
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL XLXN_9
        SIGNAL XLXN_13
        SIGNAL XLXN_15
        PORT Input A
        PORT Input B
        PORT Input Ci
        PORT Output Co
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
        BEGIN BLOCK XLXI_1 AND
            PIN a A
            PIN b Ci
            PIN o XLXN_9
        END BLOCK
        BEGIN BLOCK XLXI_2 AND
            PIN a B
            PIN b A
            PIN o XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_3 AND
            PIN a Ci
            PIN b B
            PIN o XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_4 OR
            PIN a XLXN_9
            PIN b XLXN_13
            PIN o Co
        END BLOCK
        BEGIN BLOCK XLXI_5 OR
            PIN a XLXN_8
            PIN b XLXN_7
            PIN o XLXN_13
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 1900 1344
        ATTR LengthUnitName "CM"
        ATTR GridsPerUnit "4"
        BEGIN BRANCH A
            WIRE 224 560 320 560
            WIRE 320 560 416 560
            WIRE 320 560 320 736
            WIRE 320 736 608 736
            WIRE 416 512 608 512
            WIRE 416 512 416 560
        END BRANCH
        BEGIN BRANCH B
            WIRE 224 704 384 704
            WIRE 384 704 416 704
            WIRE 384 704 384 880
            WIRE 384 880 608 880
            WIRE 416 672 608 672
            WIRE 416 672 416 704
        END BRANCH
        BEGIN BRANCH Ci
            WIRE 224 848 320 848
            WIRE 320 848 416 848
            WIRE 416 848 512 848
            WIRE 320 816 608 816
            WIRE 320 816 320 848
            WIRE 512 576 512 848
            WIRE 512 576 608 576
        END BRANCH
        IOMARKER 224 560 A R180 28
        IOMARKER 224 704 B R180 28
        IOMARKER 224 848 Ci R180 28
        IOMARKER 1680 688 Co R0 28
        INSTANCE XLXI_1 608 608 R0
        INSTANCE XLXI_2 608 768 R0
        INSTANCE XLXI_3 608 912 R0
        INSTANCE XLXI_5 864 848 R0
        BEGIN BRANCH XLXN_8
            WIRE 800 704 816 704
            WIRE 816 704 816 752
            WIRE 816 752 864 752
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 800 848 816 848
            WIRE 816 816 864 816
            WIRE 816 816 816 848
        END BRANCH
        INSTANCE XLXI_4 1136 688 R0
        BEGIN BRANCH XLXN_9
            WIRE 800 544 816 544
            WIRE 816 544 816 592
            WIRE 816 592 1136 592
        END BRANCH
        BEGIN BRANCH XLXN_13
            WIRE 1072 784 1104 784
            WIRE 1104 656 1104 784
            WIRE 1104 656 1136 656
        END BRANCH
        BEGIN BRANCH Co
            WIRE 1344 624 1456 624
            WIRE 1456 624 1584 624
            WIRE 1584 624 1584 688
            WIRE 1584 688 1680 688
        END BRANCH
    END SHEET
END SCHEMATIC
