	.include "macro.inc"

	.syntax unified

	thumb_func_start WmPutMapTile
WmPutMapTile: @ 0x080B5B80
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	blt _080B5BE4
	cmp r5, #0
	blt _080B5BE4
	cmp r6, #0x7f
	bgt _080B5BE4
	cmp r5, #0x55
	bgt _080B5BE4
	ldr r1, _080B5BEC @ =0x08CE7848
	asrs r3, r6, #5
	lsls r3, r3, #2
	asrs r0, r5, #5
	lsls r0, r0, #4
	adds r3, r3, r0
	adds r1, r3, r1
	ldr r4, [r1]
	movs r2, #0x1f
	adds r1, r2, #0
	ands r1, r5
	subs r0, r2, r1
	lsls r0, r0, #6
	adds r0, #2
	adds r4, r4, r0
	ands r2, r6
	lsls r0, r2, #1
	adds r4, r4, r0
	ldr r5, _080B5BF0 @ =0x02024460
	lsls r1, r1, #5
	adds r1, r1, r2
	lsls r0, r1, #1
	adds r0, r0, r5
	ldrh r2, [r4]
	strh r2, [r0]
	ldr r0, _080B5BF4 @ =0x08CE7818
	adds r3, r3, r0
	ldr r0, [r3]
	lsls r1, r1, #5
	adds r0, r0, r1
	ldr r2, _080B5BF8 @ =0x06008000
	adds r1, r1, r2
	movs r2, #8
	bl CpuFastSet
	movs r0, #8
	bl EnableBgSync
_080B5BE4:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B5BEC: .4byte 0x08CE7848
_080B5BF0: .4byte 0x02024460
_080B5BF4: .4byte 0x08CE7818
_080B5BF8: .4byte 0x06008000
