	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrBaseKaitenMain
EkrBaseKaitenMain: @ 0x0805164C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0805166E
	adds r0, r5, #0
	bl AnimDelete
	adds r0, r4, #0
	bl Proc_Break
	b _080516DE
_0805166E:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051698
	movs r3, #0x32
	ldrsh r1, [r4, r3]
	movs r6, #0x34
	ldrsh r2, [r4, r6]
	movs r0, #0x2c
	ldrsh r3, [r4, r0]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	b _080516BA
_08051698:
	movs r0, #0x34
	ldrsh r1, [r4, r0]
	movs r3, #0x32
	ldrsh r2, [r4, r3]
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #2]
	movs r0, #0x3c
	ldrsh r1, [r4, r0]
	movs r3, #0x3a
	ldrsh r2, [r4, r3]
_080516BA:
	movs r6, #0x2c
	ldrsh r3, [r4, r6]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	strh r0, [r5, #4]
	ldrh r2, [r4, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r3, #0x2e
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bgt _080516DE
	adds r0, r2, #1
	strh r0, [r4, #0x2c]
_080516DE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
