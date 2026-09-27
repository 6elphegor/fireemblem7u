	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080686D8
sub_080686D8: @ 0x080686D8
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x56
	beq _08068716
	cmp r0, #0x58
	beq _08068716
	cmp r0, #0x5a
	beq _08068716
	cmp r0, #0x5c
	beq _08068716
	cmp r0, #0x5e
	beq _08068716
	cmp r0, #0x60
	beq _08068716
	cmp r0, #0x62
	beq _08068716
	cmp r0, #0x64
	beq _08068716
	cmp r0, #0x66
	beq _08068716
	cmp r0, #0x68
	beq _08068716
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x6a
	bne _0806872C
_08068716:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _08068736
_0806872C:
	cmp r0, #0x6e
	bne _08068736
	adds r0, r2, #0
	bl Proc_Break
_08068736:
	pop {r0}
	bx r0
	.align 2, 0
