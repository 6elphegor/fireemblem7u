	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonFireBG3_Loop
EkrDragonFireBG3_Loop: @ 0x08066554
	push {r4, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x44]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r2, #0x44]
	ldr r1, _08066594 @ =0x03002870
	asrs r0, r0, #8
	movs r3, #0
	strh r0, [r1, #0x20]
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #1
	beq _080665AC
	movs r4, #0x2e
	ldrsh r0, [r2, r4]
	cmp r1, r0
	bne _08066598
	ldr r0, [r2, #0x5c]
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	b _080665AC
	.align 2, 0
_08066594: .4byte 0x03002870
_08066598:
	movs r0, #0x2c
	ldrsh r1, [r2, r0]
	movs r3, #0x2e
	ldrsh r0, [r2, r3]
	adds r0, #0x1e
	cmp r1, r0
	bne _080665AC
	adds r0, r2, #0
	bl Proc_Break
_080665AC:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
