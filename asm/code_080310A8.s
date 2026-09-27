	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080310A8
sub_080310A8: @ 0x080310A8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080310C4 @ =0x03004690
	ldr r2, [r5]
	cmp r2, #0
	bne _080310C8
	bl RefreshBMapGraphics
	adds r0, r6, #0
	movs r1, #0xc
	bl Proc_Goto
	b _0803111A
	.align 2, 0
_080310C4: .4byte 0x03004690
_080310C8:
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r4, _08031120 @ =0x0202E3DC
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r2, #0xb]
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	bl RefreshBMapGraphics
	ldr r2, [r5]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, [r5]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0xb
	bl Proc_Goto
_0803111A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031120: .4byte 0x0202E3DC
