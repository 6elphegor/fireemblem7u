	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitBeginAction
UnitBeginAction: @ 0x080180EC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _0801814C @ =0x03004690
	str r4, [r6]
	ldr r0, _08018150 @ =0x0202BD48
	ldrb r2, [r4, #0xb]
	strb r2, [r0]
	ldr r1, _08018154 @ =0x0202BD4C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _08018158 @ =0x0203A85C
	strb r2, [r0, #0xc]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	ldr r0, _0801815C @ =0x0202BBB8
	adds r1, r0, #0
	adds r1, #0x3d
	strb r5, [r1]
	adds r0, #0x3f
	movs r1, #0xff
	strb r1, [r0]
	bl sub_08029D6C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _08018160 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801814C: .4byte 0x03004690
_08018150: .4byte 0x0202BD48
_08018154: .4byte 0x0202BD4C
_08018158: .4byte 0x0203A85C
_0801815C: .4byte 0x0202BBB8
_08018160: .4byte 0x0202E3DC
