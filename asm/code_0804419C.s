	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawLinkArenaPointsBox
DrawLinkArenaPointsBox: @ 0x0804419C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	lsls r0, r2, #5
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080441E8 @ =0x02023460
	adds r0, r0, r1
	movs r1, #0
	adds r4, r2, #1
_080441B0:
	adds r2, r1, #1
	movs r1, #5
_080441B4:
	strh r3, [r0]
	adds r0, #2
	adds r3, #1
	subs r1, #1
	cmp r1, #0
	bge _080441B4
	adds r0, #0x34
	adds r1, r2, #0
	cmp r1, #3
	ble _080441B0
	adds r0, r6, #0
	bl ClearText
	lsls r0, r4, #5
	adds r0, #4
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080441EC @ =0x02022C60
	adds r0, r0, r1
	movs r1, #2
	ldr r2, [sp, #0x10]
	bl PutNumber
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080441E8: .4byte 0x02023460
_080441EC: .4byte 0x02022C60
