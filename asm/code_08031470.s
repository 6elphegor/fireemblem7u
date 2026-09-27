	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08031470
sub_08031470: @ 0x08031470
	push {r4, lr}
	ldr r4, _080314A4 @ =0x0202E3E4
	ldr r0, [r4]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r0, _080314A8 @ =0x03004690
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl GetUnitCommandUseFlags
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080314A4: .4byte 0x0202E3E4
_080314A8: .4byte 0x03004690
