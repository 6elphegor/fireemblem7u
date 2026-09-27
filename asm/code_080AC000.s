	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC000
sub_080AC000: @ 0x080AC000
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AC020 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #5
	ands r0, r1
	cmp r0, #0
	beq _080AC024
	adds r0, r4, #0
	bl sub_080AB4EC
	adds r1, r4, #0
	bl sub_080AC87C
	b _080AC068
	.align 2, 0
_080AC020: .4byte 0x08B857F8
_080AC024:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AC034
	adds r0, r4, #0
	bl sub_080AB1C8
	b _080AC068
_080AC034:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AC044
	adds r0, r4, #0
	bl sub_080AB228
	b _080AC068
_080AC044:
	ldr r0, _080AC054 @ =0x00000302
	ands r0, r1
	cmp r0, #0
	beq _080AC058
	adds r0, r4, #0
	bl Proc_Break
	b _080AC068
	.align 2, 0
_080AC054: .4byte 0x00000302
_080AC058:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080AC068
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080AC068:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
