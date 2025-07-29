********************************************************************
* The code below works to multiply together two 8-bit numbers and  *
* stores the result in the ‘PRODUCT’ location.                     *
*                                                                  *
* Author: Rayyan Faisal                                            *
*         501196760                                                *
*         Section 02                                               *
********************************************************************

    XDEF Entry, _Startup ; export ‘Entry’ symbols
    ABSENTRY Entry ; for absolute assembly: mark this as applications entry point 
    INCLUDE 'derivative.inc'; Include derivative-specific definitions

********************************************************************
* Code section                                                     *
********************************************************************

    ORG $3000
MULTIPLICAND FCB 04 ; First Number (8-bit)
MULTIPLIER FCB 03 ; Second Number (8-bit)
PRODUCT RMB 2 ; Result of multiplication (16-bit)

********************************************************************
* The actual program starts here                                   *
********************************************************************

    ORG $4000
Entry:
_Startup:
    LDAA MULTIPLICAND ; Load first number into ACCA
    LDAB MULTIPLIER ; Load second number into ACCB
    MUL ; Multiply ACCA by ACCB
    STD PRODUCT ; Stores the 16-bit product from D
    SWI ; break to the monitor

********************************************************************
* Interrupt Vectors                                                *
********************************************************************
    
    ORG $FFFE
    FDB Entry ; Reset Vector