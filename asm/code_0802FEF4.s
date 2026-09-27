	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802FEF4
sub_0802FEF4: @ 0x0802FEF4
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _0802FF64 @ =0x083FDE3C
	ldr r1, _0802FF68 @ =0x06015E00
	bl Decompress
	ldr r0, _0802FF6C @ =0x083FE074
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	cmp r4, #0
	bne _0802FF5C
	ldr r5, _0802FF70 @ =0x08B96444
	ldr r2, [r5]
	ldr r4, _0802FF74 @ =0x03004690
	ldr r1, [r4]
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	ldr r1, _0802FF78 @ =0x0203A85C
	ldrb r1, [r1, #0x10]
	subs r0, r0, r1
	adds r2, #0x2b
	strb r0, [r2]
	movs r0, #0
	bl CutOffPathLength
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl AddPointToPathArrowProc
	ldr r0, [r5]
	adds r1, r0, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	adds r0, #0x55
	strb r1, [r0]
	ldr r1, _0802FF7C @ =0x0000FFFF
	adds r0, r1, #0
	bl SetLastCoords
	bl sub_0802FF80
_0802FF5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF64: .4byte 0x083FDE3C
_0802FF68: .4byte 0x06015E00
_0802FF6C: .4byte 0x083FE074
_0802FF70: .4byte 0x08B96444
_0802FF74: .4byte 0x03004690
_0802FF78: .4byte 0x0203A85C
_0802FF7C: .4byte 0x0000FFFF
