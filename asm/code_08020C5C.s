	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcWhiteCircleFx_Loop
ProcWhiteCircleFx_Loop: @ 0x08020C5C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r2, r7, #0
	adds r2, #0x4c
	movs r0, #0
	ldrsh r1, [r2, r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	movs r1, #0x40
	subs r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov sl, r2
_08020C7E:
	movs r6, #0
	lsls r5, r0, #3
	adds r1, r0, #1
	mov r8, r1
	lsls r0, r0, #6
	ldr r2, _08020D14 @ =0x02022C60
	adds r4, r0, r2
_08020C8C:
	lsls r2, r6, #3
	ldr r1, [r7, #0x2c]
	subs r0, r1, r2
	cmp r0, #0
	bge _08020C98
	subs r0, r2, r1
_08020C98:
	ldr r2, [r7, #0x30]
	subs r1, r2, r5
	cmp r1, #0
	bge _08020CA2
	subs r1, r5, r2
_08020CA2:
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r0, r0, r1
	bl Sqrt
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r0, sb
	cmp r0, #0
	bge _08020CC0
	adds r0, #3
_08020CC0:
	asrs r1, r0, #2
	movs r0, #0xf
	subs r0, r0, r1
	cmp r0, #0xf
	ble _08020CCC
	movs r0, #0xf
_08020CCC:
	cmp r0, #0
	bge _08020CD2
	movs r0, #0
_08020CD2:
	movs r1, #0x84
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r6, #1
	cmp r6, #0x1d
	ble _08020C8C
	mov r0, r8
	cmp r0, #0x13
	ble _08020C7E
	movs r0, #1
	bl EnableBgSync
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x46
	ble _08020D04
	adds r0, r7, #0
	bl Proc_Break
_08020D04:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08020D14: .4byte 0x02022C60
