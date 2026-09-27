	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxClouds_VSync
WfxClouds_VSync: @ 0x0802DCB0
	push {r4, lr}
	ldr r4, _0802DCCC @ =0x020027DC
	bl GetGameTime
	adds r1, r0, #0
	movs r0, #7
	ands r1, r0
	cmp r1, #7
	bhi _0802DD20
	lsls r0, r1, #2
	ldr r1, _0802DCD0 @ =_0802DCD4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802DCCC: .4byte 0x020027DC
_0802DCD0: .4byte _0802DCD4
_0802DCD4: @ jump table
	.4byte _0802DCF4 @ case 0
	.4byte _0802DD20 @ case 1
	.4byte _0802DCFC @ case 2
	.4byte _0802DD20 @ case 3
	.4byte _0802DD02 @ case 4
	.4byte _0802DD20 @ case 5
	.4byte _0802DD08 @ case 6
	.4byte _0802DD14 @ case 7
_0802DCF4:
	adds r0, r4, #0
	bl WfxCloudsOffsetGraphicsEffect
	b _0802DD20
_0802DCFC:
	movs r1, #0xe0
	lsls r1, r1, #1
	b _0802DD0C
_0802DD02:
	movs r1, #0xe0
	lsls r1, r1, #2
	b _0802DD0C
_0802DD08:
	movs r1, #0xa8
	lsls r1, r1, #3
_0802DD0C:
	adds r0, r4, r1
	bl WfxCloudsOffsetGraphicsEffect
	b _0802DD20
_0802DD14:
	ldr r1, _0802DD28 @ =0x06010240
	adds r0, r4, #0
	movs r2, #0xe
	movs r3, #4
	bl Copy2dChr
_0802DD20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DD28: .4byte 0x06010240
