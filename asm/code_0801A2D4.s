	.include "macro.inc"

	.syntax unified

	thumb_func_start MapAddInRange
MapAddInRange: @ 0x0801A2D4
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
	mov r4, sb
	adds r0, r4, r5
	cmp r4, r0
	bgt _0801A354
	ldr r1, _0801A3D0 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r4, r0
	bge _0801A354
_0801A2FC:
	ldr r6, [sp]
	subs r1, r6, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A30C
	adds r0, r0, r1
	movs r1, #0
_0801A30C:
	adds r3, r1, r0
	ldr r2, _0801A3D0 @ =0x0202E3D8
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A31A
	adds r3, r0, #0
_0801A31A:
	adds r2, r1, #0
	subs r5, #1
	adds r7, r4, #1
	mov r6, sb
	add r6, r8
	cmp r2, r3
	bge _0801A344
	ldr r0, _0801A3D4 @ =0x030041E0
	mov ip, r0
	lsls r4, r4, #2
_0801A32E:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A32E
_0801A344:
	adds r4, r7, #0
	cmp r4, r6
	bgt _0801A354
	ldr r2, _0801A3D0 @ =0x0202E3D8
	movs r6, #2
	ldrsh r0, [r2, r6]
	cmp r4, r0
	blt _0801A2FC
_0801A354:
	mov r5, r8
	subs r5, #1
	mov r4, sb
	subs r4, #1
	mov r0, sb
	mov r1, r8
	subs r0, r0, r1
	mov r8, r0
	cmp r4, r8
	blt _0801A3BE
	cmp r4, #0
	blt _0801A3BE
	ldr r2, _0801A3D0 @ =0x0202E3D8
	mov ip, r2
	ldr r6, _0801A3D4 @ =0x030041E0
	mov sb, r6
_0801A374:
	ldr r0, [sp]
	subs r1, r0, r5
	lsls r0, r5, #1
	adds r0, #1
	cmp r1, #0
	bge _0801A384
	adds r0, r0, r1
	movs r1, #0
_0801A384:
	adds r3, r1, r0
	mov r2, ip
	movs r6, #0
	ldrsh r0, [r2, r6]
	cmp r3, r0
	ble _0801A392
	adds r3, r0, #0
_0801A392:
	adds r2, r1, #0
	subs r5, #1
	subs r6, r4, #1
	cmp r2, r3
	bge _0801A3B4
	mov r7, sb
	lsls r4, r4, #2
_0801A3A0:
	ldr r0, [r7]
	adds r0, r4, r0
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	add r1, sl
	strb r1, [r0]
	adds r2, #1
	cmp r2, r3
	blt _0801A3A0
_0801A3B4:
	adds r4, r6, #0
	cmp r6, r8
	blt _0801A3BE
	cmp r6, #0
	bge _0801A374
_0801A3BE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A3D0: .4byte 0x0202E3D8
_0801A3D4: .4byte 0x030041E0
