!P1_CURRENT_ORB       = $e6
!P1_CURRENT_ORB_LEVEL = $e7
!P2_CURRENT_ORB       = $e8
!P2_CURRENT_ORB_LEVEL = $e9

!ORB_NONE = $00
!ORB_BLUE = $01
!ORB_RED  = $02

lorom

org $04ea15
        jml     player1
org $04ee98
        jml     player2

org $01fe00
player1:
.save_next_orb_color
        tay
.check_for_possession_of_any_orbs
        lda     !P1_CURRENT_ORB
        cmp     #!ORB_NONE
        beq     .no_orbs
.have_orbs
        tya
        sta     !P1_CURRENT_ORB
        jml     $04ea2c
.no_orbs
        tya
        sta     !P1_CURRENT_ORB
        jml     $04ea1b

player2:
.save_next_orb_color
        tay
.check_for_possession_of_any_orbs
        lda     !P2_CURRENT_ORB
        cmp     #!ORB_NONE
        beq     .no_orbs
.have_orbs
        tya
        sta     !P2_CURRENT_ORB
        jml     $04eeaf
.no_orbs
        tya
        sta     !P2_CURRENT_ORB
        jml     $04ee9e
