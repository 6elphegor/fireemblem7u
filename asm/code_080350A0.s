	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080350A0
sub_080350A0: @ 0x080350A0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl PutMapCursor
	ldr r0, _080350E0 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #9
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _080350CA
	adds r0, r4, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0x2d
	ble _080350D4
_080350CA:
	adds r0, r4, #0
	bl Proc_Break
	adds r2, r4, #0
	adds r2, #0x64
_080350D4:
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080350E0: .4byte 0x08B857F8
