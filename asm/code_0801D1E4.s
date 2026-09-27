	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801D1E4
sub_0801D1E4: @ 0x0801D1E4
	push {r4, r5, lr}
	adds r4, r0, #0
	bl GetGameTime
	lsrs r5, r0, #1
	movs r0, #0x1f
	ands r5, r0
	adds r4, #0x4a
	movs r0, #1
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D20C
	lsls r0, r5, #1
	ldr r1, _0801D25C @ =0x083FDD1C
	adds r0, r0, r1
	movs r1, #0x82
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D20C:
	movs r0, #2
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D224
	lsls r0, r5, #1
	ldr r1, _0801D260 @ =0x083FDD7C
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D224:
	movs r0, #4
	ldrh r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0801D23C
	lsls r0, r5, #1
	ldr r1, _0801D264 @ =0x083FDDDC
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D23C:
	movs r0, #0x10
	ldrh r4, [r4]
	ands r0, r4
	cmp r0, #0
	beq _0801D254
	lsls r0, r5, #1
	ldr r1, _0801D25C @ =0x083FDD1C
	adds r0, r0, r1
	movs r1, #0xa2
	movs r2, #0x20
	bl ApplyPaletteExt
_0801D254:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D25C: .4byte 0x083FDD1C
_0801D260: .4byte 0x083FDD7C
_0801D264: .4byte 0x083FDDDC
