	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B3C90
sub_080B3C90: @ 0x080B3C90
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x29
	movs r2, #0
	movs r4, #1
	movs r1, #1
	strb r1, [r3]
	adds r0, #0x2a
	strb r2, [r0]
	bl sub_080B3C58
	ldr r0, _080B3CC0 @ =0x02000814
	ldrb r1, [r0]
	eors r4, r1
	strb r4, [r0]
	ldr r0, _080B3CC4 @ =0x02022AE0
	ldr r2, _080B3CC8 @ =0x000044C3
	ldr r3, _080B3CCC @ =0x00007247
	movs r1, #0x28
	bl sub_080B3858
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3CC0: .4byte 0x02000814
_080B3CC4: .4byte 0x02022AE0
_080B3CC8: .4byte 0x000044C3
_080B3CCC: .4byte 0x00007247
