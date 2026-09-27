	.include "macro.inc"

	.syntax unified

	thumb_func_start WfxFlamesUpdateParticles
WfxFlamesUpdateParticles: @ 0x0802DB74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _0802DC00 @ =0x020027DC
	bl GetOamSplice
	cmp r0, #0
	beq _0802DBF4
	ldr r0, _0802DC04 @ =0x0202BBB8
	mov r8, r0
	movs r1, #0xff
	mov sb, r1
	movs r6, #0xf
_0802DB90:
	ldrh r2, [r4]
	ldrh r3, [r4, #4]
	adds r5, r2, r3
	strh r5, [r4]
	ldrh r7, [r4, #2]
	ldrh r1, [r4, #6]
	adds r0, r7, r1
	strh r0, [r4, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	mov r2, r8
	movs r3, #0xe
	ldrsh r1, [r2, r3]
	subs r2, r0, r1
	mov r7, sb
	ands r2, r7
	cmp r2, #0x3f
	ble _0802DBEC
	cmp r2, #0xa0
	bgt _0802DBEC
	adds r1, r2, #0
	subs r1, #0x40
	cmp r1, #0
	bge _0802DBC2
	adds r1, #7
_0802DBC2:
	asrs r1, r1, #3
	movs r0, #0x1f
	subs r3, r0, r1
	cmp r3, #0x17
	bgt _0802DBCE
	movs r3, #0x18
_0802DBCE:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x18
	mov r5, r8
	movs r7, #0xc
	ldrsh r1, [r5, r7]
	subs r0, r0, r1
	mov r1, sb
	ands r0, r1
	movs r5, #0xa0
	lsls r5, r5, #8
	adds r3, r3, r5
	adds r1, r2, #0
	ldr r2, _0802DC08 @ =0x08B905B0
	bl PutOamLoRam
_0802DBEC:
	subs r6, #1
	adds r4, #0xc
	cmp r6, #0
	bge _0802DB90
_0802DBF4:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DC00: .4byte 0x020027DC
_0802DC04: .4byte 0x0202BBB8
_0802DC08: .4byte 0x08B905B0
