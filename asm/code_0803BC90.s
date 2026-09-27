	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BC90
sub_0803BC90: @ 0x0803BC90
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	ldr r1, _0803BCC8 @ =0x0202E3E8
	ldr r0, [r1]
	lsls r2, r4, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BCC4
	ldr r0, _0803BCCC @ =0x0202E3DC
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r2, [r0]
	cmp r2, #0
	beq _0803BCD4
	ldr r0, _0803BCD0 @ =0x0202BD48
	ldrb r0, [r0]
	cmp r2, r0
	beq _0803BCD4
_0803BCC4:
	movs r0, #0xff
	b _0803BCE0
	.align 2, 0
_0803BCC8: .4byte 0x0202E3E8
_0803BCCC: .4byte 0x0202E3DC
_0803BCD0: .4byte 0x0202BD48
_0803BCD4:
	ldr r1, [r1]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
_0803BCE0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
