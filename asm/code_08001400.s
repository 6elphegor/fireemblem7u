	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgTilemapOffset
GetBgTilemapOffset: @ 0x08001400
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl GetBgCt
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r0]
	lsls r0, r1, #0x13
	lsrs r2, r0, #0x1b
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	adds r1, r0, #0
	lsls r2, r1, #0xb
	adds r0, r2, #0
	b _0800142C
_0800142C:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1
