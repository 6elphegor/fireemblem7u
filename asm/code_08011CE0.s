	.include "macro.inc"

	.syntax unified

	thumb_func_start EventEA_StartMixPalette
EventEA_StartMixPalette: @ 0x08011CE0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r6, [r0, #4]
	ldr r7, [r0, #8]
	ldr r4, [r0, #0xc]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08011D00
	movs r0, #0
	b _08011D1A
_08011D00:
	movs r1, #0xff
	adds r2, r4, #0
	ands r2, r1
	asrs r3, r4, #0x10
	ands r3, r1
	asrs r0, r4, #0x18
	ands r0, r1
	str r0, [sp]
	str r5, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl StartMixPalette
_08011D1A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
