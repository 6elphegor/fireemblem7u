	.include "macro.inc"

	.syntax unified

	thumb_func_start EvCheck0E_
EvCheck0E_: @ 0x0807870C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r0, #8]
	adds r0, r4, #0
	bl _call_via_r1
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078724
	movs r0, #0
	b _08078730
_08078724:
	ldr r0, [r4]
	ldr r1, [r0, #4]
	str r1, [r4, #4]
	ldrh r0, [r0, #2]
	str r0, [r4, #8]
	movs r0, #1
_08078730:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
