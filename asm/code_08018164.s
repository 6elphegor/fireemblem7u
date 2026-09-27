	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitBeginCantoAction
UnitBeginCantoAction: @ 0x08018164
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080181B8 @ =0x03004690
	str r4, [r6]
	ldr r1, _080181BC @ =0x0202BD48
	ldrb r0, [r4, #0xb]
	strb r0, [r1]
	ldr r1, _080181C0 @ =0x0202BD4C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _080181C4 @ =0x0203A85C
	strb r5, [r0, #0x11]
	ldr r0, _080181C8 @ =0x0202BBB8
	adds r0, #0x3d
	strb r5, [r0]
	bl sub_08029D6C
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080181CC @ =0x0202E3DC
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
_080181B8: .4byte 0x03004690
_080181BC: .4byte 0x0202BD48
_080181C0: .4byte 0x0202BD4C
_080181C4: .4byte 0x0203A85C
_080181C8: .4byte 0x0202BBB8
_080181CC: .4byte 0x0202E3DC
