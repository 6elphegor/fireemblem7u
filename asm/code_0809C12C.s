	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C12C
sub_0809C12C: @ 0x0809C12C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809C150 @ =0x0202BBF8
	ldrh r0, [r0, #0x2c]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _0809C144
	movs r0, #0xa
_0809C144:
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809C150: .4byte 0x0202BBF8
