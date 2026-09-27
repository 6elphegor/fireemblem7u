	.include "macro.inc"

	.syntax unified

	thumb_func_start StartModeSelectFace
StartModeSelectFace: @ 0x080A77C0
	push {r4, r5, lr}
	sub sp, #0x10
	add r2, sp, #4
	ldr r1, _080A77F4 @ =0x08418DB4
	ldm r1!, {r3, r4, r5}
	stm r2!, {r3, r4, r5}
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r1, [r0]
	movs r0, #0x42
	str r0, [sp]
	movs r0, #0
	movs r2, #0xcc
	movs r3, #0x48
	bl StartBmFace
	adds r4, r0, #0
	bl StartFaceFadeIn
	adds r0, r4, #0
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A77F4: .4byte 0x08418DB4
