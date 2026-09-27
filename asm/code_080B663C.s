	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B663C
sub_080B663C: @ 0x080B663C
	push {r4, lr}
	ldr r3, _080B666C @ =0x08CED69E
	adds r0, r0, r3
	adds r4, r3, #5
	adds r1, r1, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	adds r4, r0, r1
	adds r3, #0xa
	adds r2, r2, r3
	ldrb r2, [r2]
	adds r4, r2, r4
	movs r0, #0
	ldr r1, _080B6670 @ =0x08CED6AE
_080B6658:
	ldrh r2, [r1]
	cmp r4, r2
	blo _080B6666
	adds r1, #2
	adds r0, #1
	cmp r0, #4
	ble _080B6658
_080B6666:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080B666C: .4byte 0x08CED69E
_080B6670: .4byte 0x08CED6AE
