	.include "macro.inc"

	.syntax unified

	thumb_func_start MarkWorkingMapEdges
MarkWorkingMapEdges: @ 0x0801A1E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r1, _0801A2C8 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r4, r0, #1
	ldr r7, _0801A2CC @ =0x030046A0
	mov sb, r7
	cmp r4, #0
	blt _0801A2B0
	mov ip, r1
	mov sl, sb
_0801A206:
	mov r1, ip
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r7, r4, #1
	mov r8, r7
	cmp r3, #0
	blt _0801A2AA
	lsls r5, r4, #2
	mov r6, sl
_0801A21A:
	ldr r1, _0801A2D0 @ =0x030041E0
	ldr r0, [r1]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r3
	ldrb r2, [r1]
	cmp r2, #0x78
	bhi _0801A2A4
	movs r0, #0
	ldrsb r0, [r1, r0]
	ldrb r2, [r6, #0xb]
	cmp r0, r2
	beq _0801A2A4
	subs r1, #1
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A244
	cmp r3, #0
	beq _0801A244
	strb r2, [r1]
_0801A244:
	ldr r7, _0801A2D0 @ =0x030041E0
	ldr r0, [r7]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r3, r0
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A266
	mov r2, ip
	movs r7, #0
	ldrsh r0, [r2, r7]
	subs r0, #1
	cmp r3, r0
	beq _0801A266
	ldrb r0, [r6, #0xb]
	strb r0, [r1, #1]
_0801A266:
	ldr r1, _0801A2D0 @ =0x030041E0
	ldr r0, [r1]
	adds r0, r5, r0
	subs r0, #4
	ldr r0, [r0]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A282
	cmp r4, #0
	beq _0801A282
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A282:
	ldr r2, _0801A2D0 @ =0x030041E0
	ldr r0, [r2]
	adds r0, r5, r0
	ldr r0, [r0, #4]
	adds r1, r0, r3
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0801A2A4
	mov r7, ip
	movs r2, #2
	ldrsh r0, [r7, r2]
	subs r0, #1
	cmp r4, r0
	beq _0801A2A4
	ldrb r0, [r6, #0xb]
	strb r0, [r1]
_0801A2A4:
	subs r3, #1
	cmp r3, #0
	bge _0801A21A
_0801A2AA:
	mov r4, r8
	cmp r4, #0
	bge _0801A206
_0801A2B0:
	mov r7, sb
	ldrb r0, [r7, #0xb]
	adds r0, #1
	strb r0, [r7, #0xb]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A2C8: .4byte 0x0202E3D8
_0801A2CC: .4byte 0x030046A0
_0801A2D0: .4byte 0x030041E0
