	.include "macro.inc"

	.syntax unified

	thumb_func_start PutUnitAidIconForTextAt
PutUnitAidIconForTextAt: @ 0x08031938
	push {r4, lr}
	lsls r4, r2, #5
	adds r4, #4
	adds r4, r4, r1
	lsls r4, r4, #1
	ldr r1, _08031968 @ =0x02022C60
	adds r4, r4, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08031968: .4byte 0x02022C60
