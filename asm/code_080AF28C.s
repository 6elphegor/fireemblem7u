	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF28C
sub_080AF28C: @ 0x080AF28C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080AF2A8
	adds r0, r4, #0
	bl Proc_Break
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x44]
	ldr r0, [r0]
	str r0, [r4, #0x30]
	b _080AF2C4
_080AF2A8:
	cmp r0, #0xf
	bls _080AF2BE
	ldrh r0, [r4, #0x2a]
	subs r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080AF2BE
	adds r0, r4, #0
	bl sub_080AF0FC
_080AF2BE:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
	strh r0, [r4, #0x2a]
_080AF2C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
