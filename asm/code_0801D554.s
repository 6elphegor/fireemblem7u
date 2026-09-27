	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D554
sub_0801D554: @ 0x0801D554
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r0, _0801D5E4 @ =0x03002870
	mov ip, r0
	mov r4, ip
	adds r4, #0x3c
	movs r1, #0x3f
	mov sl, r1
	mov r0, sl
	ldrb r6, [r4]
	ands r0, r6
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
	adds r3, r5, #0
	adds r3, #0x4c
	ldrh r1, [r3]
	movs r0, #0x44
	add r0, ip
	mov sb, r0
	movs r2, #0
	strb r1, [r0]
	movs r0, #0x10
	subs r0, r0, r1
	movs r6, #0x45
	add r6, ip
	mov r8, r6
	strb r0, [r6]
	mov r7, ip
	adds r7, #0x46
	strb r2, [r7]
	subs r1, #1
	movs r6, #0
	strh r1, [r3]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801D5D6
	adds r0, r5, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r4]
	ands r0, r1
	strb r0, [r4]
	movs r0, #0x10
	mov r1, sb
	strb r0, [r1]
	mov r0, r8
	strb r6, [r0]
	strb r6, [r7]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	ldr r0, _0801D5E8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
_0801D5D6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D5E4: .4byte 0x03002870
_0801D5E8: .4byte 0x02023C60
