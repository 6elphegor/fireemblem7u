	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F9C4
sub_0802F9C4: @ 0x0802F9C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r6, #0
	movs r2, #0
	ldr r5, _0802FA58 @ =0x0203A3F0
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	adds r0, #0x64
	strh r1, [r0]
	ldr r4, _0802FA5C @ =0x0203A470
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	adds r1, r7, #0
	adds r1, #0x66
	strh r0, [r1]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0802FA00
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r2, r0, #0
_0802FA00:
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802FA1C
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r6, r0, #0
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r2, r0, #0
_0802FA1C:
	cmp r6, #0
	beq _0802FA60
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _0802FA60
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	beq _0802FA60
	movs r0, #0xc0
	ldrb r1, [r2, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0802FA60
	adds r0, r6, #0
	str r2, [sp]
	bl GetUnitLastItem
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, [sp]
	adds r0, r2, #0
	adds r2, r7, #0
	bl StartGiveItem
	movs r0, #0
	b _0802FA62
	.align 2, 0
_0802FA58: .4byte 0x0203A3F0
_0802FA5C: .4byte 0x0203A470
_0802FA60:
	movs r0, #1
_0802FA62:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
