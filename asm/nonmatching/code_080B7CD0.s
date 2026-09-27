	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7CD0
sub_080B7CD0: @ 0x080B7CD0
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x3c
	bne _080B7CEE
	adds r0, r2, #0
	bl Proc_Break
	b _080B7D02
_080B7CEE:
	ldr r0, _080B7D08 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080B7D02
	adds r0, r2, #0
	bl Proc_Break
_080B7D02:
	pop {r0}
	bx r0
	.align 2, 0
_080B7D08: .4byte 0x08B857F8
