	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_DragonTailDisplay
EkrDragon_DragonTailDisplay: @ 0x08064E70
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r1, #0xf8
	rsbs r1, r1, #0
	movs r2, #0x18
	rsbs r2, r2, #0
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #4
	bl Interpolate
	adds r4, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #1
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	bl Interpolate
	adds r1, r0, #0
	adds r0, r4, #0
	bl EkrDragonTmCpyExt
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	adds r0, #1
	cmp r1, r0
	bne _08064ECC
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_08064ECC:
	ldrh r5, [r5, #0x2c]
	cmp r5, #0xf
	bne _08064EE0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xe6
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_08064EE0:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
