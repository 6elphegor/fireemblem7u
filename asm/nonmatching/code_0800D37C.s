	.include "macro.inc"

	.syntax unified

	thumb_func_start Event3C_ASMC1
Event3C_ASMC1: @ 0x0800D37C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r5, r0, #4
	ldr r1, [r0, #4]
	adds r0, r4, #0
	bl _call_via_r1
	ldr r0, [r4, #0x30]
	adds r0, #4
	cmp r5, r0
	bne _0800D398
	movs r0, #2
	b _0800D39A
_0800D398:
	movs r0, #1
_0800D39A:
	pop {r4, r5}
	pop {r1}
	bx r1
