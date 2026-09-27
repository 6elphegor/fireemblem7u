	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E36C
sub_0804E36C: @ 0x0804E36C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804E3D4 @ =0x08B9AD54
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r6, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	movs r0, #0xa
	strh r0, [r4, #0xa]
	strh r0, [r5, #0xa]
	bl AnimSort
	ldr r2, _0804E3D8 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _0804E3DC @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	ldr r1, _0804E3E0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x3d
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E3D4: .4byte 0x08B9AD54
_0804E3D8: .4byte 0x03002870
_0804E3DC: .4byte 0x0000FFE0
_0804E3E0: .4byte 0x0000E0FF
