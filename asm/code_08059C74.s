	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059C74
sub_08059C74: @ 0x08059C74
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08059CDA
	ldr r0, _08059CB0 @ =0x0203E02C
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	beq _08059CBE
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08059CB4
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl SetBgOffset
	b _08059CBE
	.align 2, 0
_08059CB0: .4byte 0x0203E02C
_08059CB4:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl SetBgOffset
_08059CBE:
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x93
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	adds r0, r4, #0
	bl Proc_Break
_08059CDA:
	pop {r4, r5}
	pop {r0}
	bx r0
