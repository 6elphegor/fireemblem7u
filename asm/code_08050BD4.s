	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050BD4
sub_08050BD4: @ 0x08050BD4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2c]
	ldrh r1, [r7, #0x2e]
	cmp r0, r1
	beq _08050BEC
	adds r0, #1
	strh r0, [r7, #0x2c]
_08050BEC:
	movs r0, #0x32
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r6, r0, #0
	movs r0, #0x3a
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	adds r5, r0, #0
	movs r0, #0x34
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xf0
	bl Interpolate
	adds r4, r0, #0
	movs r0, #0x3c
	ldrsh r2, [r7, r0]
	movs r1, #0x2c
	ldrsh r3, [r7, r1]
	movs r1, #0x2e
	ldrsh r0, [r7, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	bl Interpolate
	ldr r1, _08050CD4 @ =0x03002870
	movs r2, #0x2d
	adds r2, r2, r1
	mov r8, r2
	movs r2, #0
	mov sb, r2
	mov r2, r8
	strb r6, [r2]
	adds r6, r1, #0
	adds r6, #0x31
	strb r5, [r6]
	adds r5, r1, #0
	adds r5, #0x2c
	strb r4, [r5]
	adds r4, r1, #0
	adds r4, #0x30
	strb r0, [r4]
	ldrh r0, [r7, #0x2c]
	ldrh r2, [r7, #0x2e]
	cmp r0, r2
	bne _08050CC4
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #1
	ldrb r1, [r2]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	bl LockBmDisplay
	mov r0, sb
	mov r2, r8
	strb r0, [r2]
	strb r0, [r6]
	movs r0, #0xf0
	strb r0, [r5]
	movs r0, #0xa0
	strb r0, [r4]
	ldr r0, _08050CD8 @ =0x02022860
	movs r1, #6
	movs r2, #0xa
	movs r3, #4
	bl EfxPalBlackInOut
	bl EnablePalSync
	bl EndAllMus
	adds r0, r7, #0
	bl Proc_Break
_08050CC4:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050CD4: .4byte 0x03002870
_08050CD8: .4byte 0x02022860
