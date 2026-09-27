	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010508
sub_08010508: @ 0x08010508
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r6, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r2, _08010588 @ =0x03002870
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r5]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0x44
	adds r0, r0, r2
	mov sb, r0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x45
	adds r1, r1, r2
	mov r8, r1
	strb r0, [r1]
	adds r7, r2, #0
	adds r7, #0x46
	strb r6, [r7]
	cmp r4, #0x10
	bne _08010578
	adds r0, r3, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r6, [r1]
	strb r6, [r7]
	ldr r0, _0801058C @ =0x08B91EDC
	bl Proc_Find
	movs r1, #0
	bl sub_08010464
_08010578:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010588: .4byte 0x03002870
_0801058C: .4byte 0x08B91EDC
