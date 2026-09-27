	.include "macro.inc"

	.syntax unified

	thumb_func_start BgAffinAnchoringHighPrecision
BgAffinAnchoringHighPrecision: @ 0x080A9FE8
	push {r4, r5, r6, lr}
	adds r5, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	cmp r0, #2
	bne _080A9FF8
	ldr r4, _080AA02C @ =0x030028B8
_080A9FF8:
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r3, r1, #0
	muls r0, r3, r0
	movs r6, #2
	ldrsh r1, [r4, r6]
	rsbs r2, r2, #0
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	adds r0, r0, r5
	str r0, [r4, #8]
	movs r1, #4
	ldrsh r0, [r4, r1]
	muls r0, r3, r0
	movs r3, #6
	ldrsh r1, [r4, r3]
	muls r1, r2, r1
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [sp, #0x10]
	adds r0, r0, r1
	str r0, [r4, #0xc]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080AA02C: .4byte 0x030028B8
