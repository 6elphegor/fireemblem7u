	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800404C
sub_0800404C: @ 0x0800404C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_080034F4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _080040AE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _080040AE
	ldr r0, [r7]
	ldr r1, [r0, #0x5c]
	movs r0, #1
	cmn r1, r0
	bne _08004098
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x66
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r3, [r7]
	ldr r2, [r3, #0x58]
	ldr r3, [r7]
	bl StartBgmVolumeChange
	b _080040AE
_08004098:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	ldr r1, [r7]
	ldr r2, [r1, #0x58]
	movs r1, #0
	ldr r3, [r7]
	bl StartBgmVolumeChange
_080040AE:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
