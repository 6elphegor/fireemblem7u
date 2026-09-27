	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E6F0
sub_0801E6F0: @ 0x0801E6F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801E7C0 @ =0x02023460
	mov ip, r1
_0801E70A:
	movs r3, #0xe
	str r3, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r7, r6, #1
	mov sb, r7
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801E736:
	mov r3, r8
	movs r7, #0
	ldrsh r0, [r3, r7]
	ldr r3, [sp]
	subs r0, r3, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801E74A
	movs r3, #0x10
_0801E74A:
	cmp r3, #0
	bge _0801E750
	movs r3, #0
_0801E750:
	movs r0, #0x10
	subs r3, r0, r3
	movs r0, #0xfe
	ands r3, r0
	movs r7, #0xa2
	lsls r7, r7, #7
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	adds r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x1f
	adds r0, r3, r7
	strh r0, [r5]
	adds r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801E736
	mov r6, sb
	cmp r6, #0
	bge _0801E70A
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl EnableBgSync
	mov r3, r8
	ldrh r3, [r3]
	cmp r3, #0x22
	bne _0801E7B0
	movs r0, #0
	mov r7, r8
	strh r0, [r7]
	mov r0, sl
	bl Proc_Break
_0801E7B0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E7C0: .4byte 0x02023460
