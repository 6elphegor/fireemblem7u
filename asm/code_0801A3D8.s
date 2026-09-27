	.include "macro.inc"

	.syntax unified

	thumb_func_start MapSetInRange
MapSetInRange: @ 0x0801A3D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	mov sb, r1
	mov r8, r2
	mov sl, r3
	mov r5, r8
	mov r3, sb
	adds r0, r3, r5
	cmp r3, r0
	bgt _0801A454
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r3, r0
	bge _0801A454
_0801A400:
	ldr r2, [sp]
	subs r1, r2, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A410
	adds r0, r0, r1
	movs r1, #0
_0801A410:
	adds r2, r1, r0
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A41E
	adds r2, r0, #0
_0801A41E:
	subs r6, r5, #1
	adds r7, r3, #1
	mov r0, sb
	add r0, r8
	mov ip, r0
	cmp r1, r2
	bge _0801A442
	ldr r5, _0801A4D0 @ =0x030041E0
	lsls r4, r3, #2
_0801A430:
	ldr r0, [r5]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A430
_0801A442:
	adds r5, r6, #0
	adds r3, r7, #0
	cmp r3, ip
	bgt _0801A454
	ldr r4, _0801A4CC @ =0x0202E3D8
	movs r6, #2
	ldrsh r0, [r4, r6]
	cmp r3, r0
	blt _0801A400
_0801A454:
	mov r5, r8
	subs r5, #1
	mov r3, sb
	subs r3, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r3, r8
	blt _0801A4BC
	cmp r3, #0
	blt _0801A4BC
	ldr r2, _0801A4CC @ =0x0202E3D8
	mov ip, r2
	ldr r4, _0801A4D0 @ =0x030041E0
	mov sb, r4
_0801A474:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A484
	adds r0, r0, r1
	movs r1, #0
_0801A484:
	adds r2, r1, r0
	mov r4, ip
	movs r6, #0
	ldrsh r0, [r4, r6]
	cmp r2, r0
	ble _0801A492
	adds r2, r0, #0
_0801A492:
	subs r6, r5, #1
	subs r4, r3, #1
	cmp r1, r2
	bge _0801A4B0
	mov r7, sb
	lsls r5, r3, #2
_0801A49E:
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r1
	mov r3, sl
	strb r3, [r0]
	adds r1, #1
	cmp r1, r2
	blt _0801A49E
_0801A4B0:
	adds r5, r6, #0
	adds r3, r4, #0
	cmp r4, r8
	blt _0801A4BC
	cmp r4, #0
	bge _0801A474
_0801A4BC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A4CC: .4byte 0x0202E3D8
_0801A4D0: .4byte 0x030041E0
