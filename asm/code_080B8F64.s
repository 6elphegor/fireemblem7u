	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8F64
sub_080B8F64: @ 0x080B8F64
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	adds r0, #1
	str r0, [r2, #0x58]
	ldr r0, _080B8F84 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r3, [r1, #8]
	ands r0, r3
	cmp r0, #0
	beq _080B8F88
	adds r0, r2, #0
	bl Proc_Break
	b _080B8FB8
	.align 2, 0
_080B8F84: .4byte 0x08B857F8
_080B8F88:
	movs r0, #4
	ldrh r1, [r1, #4]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080B8FB2
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	ble _080B8FB8
	adds r0, r2, #0
	movs r1, #2
	bl Proc_Goto
	b _080B8FB8
_080B8FB2:
	adds r0, r2, #0
	adds r0, #0x4c
	strh r1, [r0]
_080B8FB8:
	pop {r0}
	bx r0
