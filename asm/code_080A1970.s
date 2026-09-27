	.include "macro.inc"

	.syntax unified

	thumb_func_start SramChecksum32
SramChecksum32: @ 0x080A1970
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _080A1990 @ =0x03005E70
	ldr r4, _080A1994 @ =0x02020140
	ldr r3, [r1]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r0, r4, #0
	adds r1, r5, #0
	bl Checksum32_thm
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A1990: .4byte 0x03005E70
_080A1994: .4byte 0x02020140
