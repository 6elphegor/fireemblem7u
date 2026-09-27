	.include "macro.inc"

	.syntax unified

	thumb_func_start WipeSram
WipeSram: @ 0x0809E488
	push {r4, r5, r6, lr}
	sub sp, #0x40
	movs r1, #1
	rsbs r1, r1, #0
	add r0, sp, #0x3c
_0809E492:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _0809E492
	movs r4, #0
	ldr r6, _0809E4BC @ =0x08CE3B58
	ldr r5, _0809E4C0 @ =0x000001FF
_0809E4A0:
	lsls r0, r4, #6
	ldr r1, [r6]
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x40
	bl WriteAndVerifySramFast
	adds r4, #1
	cmp r4, r5
	ble _0809E4A0
	add sp, #0x40
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809E4BC: .4byte 0x08CE3B58
_0809E4C0: .4byte 0x000001FF
