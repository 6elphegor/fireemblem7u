	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A50CC
sub_080A50CC: @ 0x080A50CC
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1e
	ble _080A50FC
	ldr r0, _080A50F8 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A5100
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _080A5100
	.align 2, 0
_080A50F8: .4byte 0x08B857F8
_080A50FC:
	adds r0, r2, #1
	strh r0, [r1]
_080A5100:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
