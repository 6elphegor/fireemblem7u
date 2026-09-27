	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxClasschgBGSE00Main
EfxClasschgBGSE00Main: @ 0x08068654
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _08068696
	cmp r0, #0x11
	beq _08068696
	cmp r0, #0x22
	beq _08068696
	cmp r0, #0x28
	beq _08068696
	cmp r0, #0x2e
	beq _08068696
	cmp r0, #0x34
	beq _08068696
	cmp r0, #0x3a
	beq _08068696
	cmp r0, #0x3e
	beq _08068696
	cmp r0, #0x42
	beq _08068696
	cmp r0, #0x44
	beq _08068696
	movs r1, #0x2c
	ldrsh r0, [r2, r1]
	cmp r0, #0x46
	beq _08068696
	cmp r0, #0x48
	bne _080686AC
_08068696:
	movs r0, #0x9f
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r2, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl PlaySFX
	b _080686B6
_080686AC:
	cmp r0, #0x50
	bne _080686B6
	adds r0, r2, #0
	bl Proc_Break
_080686B6:
	pop {r0}
	bx r0
	.align 2, 0
