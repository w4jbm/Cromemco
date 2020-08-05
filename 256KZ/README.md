# 256KZ Memory Card
When looking for a spare memory card for my Cromemco Z-2D, I ended up with a 64KZ with a failed voltage regulator. Basically, that seems to have pretty much fried the card (although I still hope to repair it one day). Looking more, several 256KZ cards were up for auction and at prices lower than the 64KZ. Four times the memory (even if I didn't need it for my work with the Z80) at a lower price seemed like a great opportunity and I bought one of the boards.

And then I figured out why they tended to be cheaper...

The 256KZ can operate either as a banked 8-bit memory card for the Z80 or a contiguous 256K 16-bit memory card for systems with a 68000 processor.

For 8-bit systems IC39, a 256 location (8 bit address), 1 nibble (4 bit) bipolar programmable PROM. To be the base board in a Z80 system, the board is provided with Cromemco P/N 74947. This allows the board to operate as Banks 0, 1, 2, and 3 (each 64K in size). When two 256KZ boards are installed, one must have the PROM replaced with P/N 74948 (for Banks 0, 1, 2, and 3) and the other with P/N 74949 (for Banks 4, 5, and 6). This is needed to coordinate what happens with a bad bank select bit an how Bank 7 (the commond bank) is handled.

It turned out that the board I received had no PROM making it useless in my Z80 system. After some studying of the schematic and information from members of the Cromemco e-mail group, I figured out a way that let me simply strap the memory card so that Bank 0 was always selected and that the upper 32K was enabled as it typically is when Bank 0 was selected. (The lower 32K is always present on the Bank 0 memory card to allow the Z80 to boot-strap bringing up the 68000 system.) Below is a picture of the DIP header with the necessary resistors allowing use of the card:

![Header as PROM replacement](https://raw.githubusercontent.com/w4jbm/Cromemco/master/256KZ/header.jpg)
