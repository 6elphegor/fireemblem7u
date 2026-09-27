	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackChapterMap
UnpackChapterMap: @ 0x08019174
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetChapterMapPointer
	adds r1, r4, #0
	bl Decompress
	ldr r5, _080191C4 @ =0x0202E3D8
	ldrb r0, [r4]
	strh r0, [r5]
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	ldr r4, _080191C8 @ =0x08C9C9C8
	adds r0, r6, #0
	bl GetChapterInfo
	ldrb r0, [r0, #7]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080191CC @ =0x02030A90
	bl Decompress
	ldr r1, _080191D0 @ =0x0202BBB8
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xf0
	strh r0, [r1, #0x28]
	movs r2, #2
	ldrsh r0, [r5, r2]
	lsls r0, r0, #4
	subs r0, #0xa0
	strh r0, [r1, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080191C4: .4byte 0x0202E3D8
_080191C8: .4byte 0x08C9C9C8
_080191CC: .4byte 0x02030A90
_080191D0: .4byte 0x0202BBB8
