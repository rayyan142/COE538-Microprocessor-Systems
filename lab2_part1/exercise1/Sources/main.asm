;**********************************************************************
;* This program reads the switches and shows their state on the       *
;* LEDs. The program keeps running in a infinite loop.                *
;**********************************************************************

; export symbols
            XDEF Entry, _Startup            ; export 'Entry' symbol
            ABSENTRY Entry        ; for absolute assembly: mark this as application entry point



; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; ******** Code section *********

            ORG $4000

Entry:
_Startup:

; ******** Write code here *********

            LDAA #$FF                ; Load $FF into Accumulator A
            STAA DDRH                ; Configure Port H for output (LEDs)
            STAA PERT                ; Enable pull-up resistors on Port T (Switches)

MainLoop:
            LDAA PTT             ; Read the state of the switches (SW1)
            STAA PTH             ; Display the switch state on the LEDs (LED1)
            BRA MainLoop         ; Loop indefinitely

; ******** Interrupt Vectors *********

            ORG   $FFFE
            DC.W  Entry           ; Reset Vector

