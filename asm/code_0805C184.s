	.include "macro.inc"

	.syntax unified

	thumb_func_start efxHazymoonOBJ3_Loop
efxHazymoonOBJ3_Loop: @ 0x0805C184
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _0805C1D6
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r0, _0805C1DC @ =0x08BA2DC0
	movs r1, #0x2e
	ldrsh r2, [r4, r1]
	lsls r1, r2, #2
	adds r1, r1, r0
	lsls r2, r2, #1
	adds r2, #1
	lsls r2, r2, #1
	adds r2, r2, r0
	ldr r0, [r4, #0x5c]
	movs r3, #0
	ldrsh r1, [r1, r3]
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl StartSubSpell_efxHazymoonOBJ3RND
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0805C1D6
	ldr r1, _0805C1E0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0805C1D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C1DC: .4byte 0x08BA2DC0
_0805C1E0: .4byte 0x0201774C
