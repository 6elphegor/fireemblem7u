	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010010
sub_08010010: @ 0x08010010
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r0, #4]
	ldr r4, [r0, #8]
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _08010040
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08010040
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl EventStartCgTalk
	movs r0, #2
	b _08010042
_08010040:
	movs r0, #0
_08010042:
	pop {r4}
	pop {r1}
	bx r1
