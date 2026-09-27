	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800E8A4
sub_0800E8A4: @ 0x0800E8A4
	push {lr}
	adds r3, r0, #0
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800E8C6
	ldr r2, [r3, #0x30]
	ldr r0, [r2, #4]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl sub_080AEC5C
	movs r0, #2
	b _0800E8C8
_0800E8C6:
	movs r0, #0
_0800E8C8:
	pop {r1}
	bx r1
