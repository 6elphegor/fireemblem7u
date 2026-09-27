	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D9E4
sub_0809D9E4: @ 0x0809D9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _0809DA1C @ =0x02014404
	ldr r0, [r0]
	ldr r5, _0809DA20 @ =0x02014438
	adds r0, r0, r5
	ldr r4, _0809DA24 @ =0x020144D8
	ldrh r1, [r4, #6]
	bl sub_0809D9A4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_0809DA08:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _0809DA28
	mov r0, r8
	ldrh r4, [r0]
	b _0809DA40
	.align 2, 0
_0809DA1C: .4byte 0x02014404
_0809DA20: .4byte 0x02014438
_0809DA24: .4byte 0x020144D8
_0809DA28:
	cmp r5, #1
	bne _0809DA3C
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _0809DA4A
_0809DA3C:
	mov r0, r8
	ldrh r4, [r0, #4]
_0809DA40:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_0809DA4A:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _0809DAA8 @ =0x020143FC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _0809DA72
	adds r7, #1
_0809DA72:
	cmp r6, #0x1e
	bne _0809DA08
	movs r2, #0
	ldr r3, _0809DAAC @ =0x02014404
	ldr r0, [r3]
	cmp r2, r0
	bge _0809DA98
	ldr r5, _0809DAB0 @ =0x02014438
	ldr r4, _0809DAB4 @ =0x02014400
_0809DA84:
	adds r0, r2, r5
	ldrb r1, [r0]
	add r1, sb
	ldrb r6, [r4]
	ands r1, r6
	strb r1, [r0]
	adds r2, #1
	ldr r0, [r3]
	cmp r2, r0
	blt _0809DA84
_0809DA98:
	bl sub_0809D844
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DAA8: .4byte 0x020143FC
_0809DAAC: .4byte 0x02014404
_0809DAB0: .4byte 0x02014438
_0809DAB4: .4byte 0x02014400
