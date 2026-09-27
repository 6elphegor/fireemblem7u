	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092578
sub_08092578: @ 0x08092578
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r0, #0
	bl GetBgTilemap
	movs r1, #0
	bl TmFill
	ldr r4, _080925C8 @ =0x02012A20
	ldr r5, _080925CC @ =0x02022EA4
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_080929D0
	adds r4, #0x28
	adds r5, #0x1a
	adds r6, #0x29
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_080929D0
	movs r0, #1
	bl EnableBgSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080925C8: .4byte 0x02012A20
_080925CC: .4byte 0x02022EA4
