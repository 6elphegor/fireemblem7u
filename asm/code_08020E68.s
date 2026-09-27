	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020E68
sub_08020E68: @ 0x08020E68
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08020E86
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08020EA2
_08020E86:
	ldr r2, [r4, #0x34]
	ldr r0, [r4, #0x3c]
	adds r2, r2, r0
	str r2, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x40]
	adds r1, r1, r0
	str r1, [r4, #0x38]
	ldr r0, [r4, #0x2c]
	adds r0, r0, r2
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x30]
	adds r0, r0, r1
	str r0, [r4, #0x30]
_08020EA2:
	ldr r2, [r4, #0x30]
	cmp r2, #0
	bge _08020EBA
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, [r4, #0x14]
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	b _08020ECE
_08020EBA:
	movs r0, #0x2e
	ldrsh r1, [r4, r0]
	asrs r2, r2, #0x10
	ldr r3, _08020ED8 @ =0x08B905B0
	movs r0, #0xa0
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #0xa
	bl PutSprite
_08020ECE:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08020ED8: .4byte 0x08B905B0
