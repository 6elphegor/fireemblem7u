	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B676C
sub_080B676C: @ 0x080B676C
	ldr r2, _080B6790 @ =0x08CED6BA
	adds r0, r0, r2
	adds r2, #5
	adds r1, r1, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r2, r0, r1
	movs r0, #0
	ldr r1, _080B6794 @ =0x08CED6C4
_080B677E:
	ldrh r3, [r1]
	cmp r2, r3
	blo _080B678C
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B677E
_080B678C:
	bx lr
	.align 2, 0
_080B6790: .4byte 0x08CED6BA
_080B6794: .4byte 0x08CED6C4
